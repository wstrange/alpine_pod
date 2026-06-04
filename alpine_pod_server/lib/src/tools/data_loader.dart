import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:yaml/yaml.dart';

import '../generated/protocol.dart';

class DataLoadResult {
  DataLoadResult();

  int sectionsInserted = 0;
  int sectionsUpdated = 0;
  int eventTemplatesInserted = 0;
  int eventTemplatesUpdated = 0;
  int notificationTemplatesInserted = 0;
  int notificationTemplatesUpdated = 0;

  int get totalInserted =>
      sectionsInserted + eventTemplatesInserted + notificationTemplatesInserted;

  int get totalUpdated =>
      sectionsUpdated + eventTemplatesUpdated + notificationTemplatesUpdated;
}

class ServerDataLoader {
  Future<DataLoadResult> loadFile(Session session, String path) async {
    final file = File(path);
    if (!file.existsSync()) {
      throw DataLoaderException('Data file does not exist: $path');
    }

    final rawData = _decodeFile(file);
    final data = _normalize(rawData);
    if (data is! Map<String, dynamic>) {
      throw DataLoaderException('Top-level data must be an object in $path.');
    }

    final result = DataLoadResult();
    await _loadSections(session, _readList(data, 'sections'), result);
    await _loadEventTemplates(
      session,
      _readList(data, 'eventTemplates', aliases: ['event_templates']),
      result,
    );
    await _loadNotificationTemplates(
      session,
      _readList(
        data,
        'notificationTemplates',
        aliases: ['notification_templates', 'mailTemplates', 'mail_templates'],
      ),
      result,
    );

    if (result.totalInserted == 0 && result.totalUpdated == 0) {
      throw DataLoaderException(
        'No supported data found in $path. Expected one of: sections, '
        'eventTemplates, notificationTemplates.',
      );
    }

    return result;
  }

  Object? _decodeFile(File file) {
    final extension = file.path.split('.').last.toLowerCase();
    final content = file.readAsStringSync();

    return switch (extension) {
      'json' => jsonDecode(content),
      'yaml' || 'yml' => loadYaml(content),
      _ => throw DataLoaderException(
        'Unsupported file type for ${file.path}. Use .json, .yaml, or .yml.',
      ),
    };
  }

  Object? _normalize(Object? value) {
    return switch (value) {
      YamlMap() => {
        for (final entry in value.entries)
          entry.key.toString(): _normalize(entry.value),
      },
      YamlList() => value.map(_normalize).toList(),
      List() => value.map(_normalize).toList(),
      Map() => {
        for (final entry in value.entries)
          entry.key.toString(): _normalize(entry.value),
      },
      _ => value,
    };
  }

  List<Map<String, dynamic>> _readList(
    Map<String, dynamic> data,
    String key, {
    List<String> aliases = const [],
  }) {
    final value = [
      key,
      ...aliases,
    ].map((candidate) => data[candidate]).nonNulls.firstOrNull;

    if (value == null) return [];
    if (value is! List) {
      throw DataLoaderException('"$key" must be a list.');
    }

    return [
      for (final row in value)
        if (row is Map<String, dynamic>)
          row
        else
          throw DataLoaderException('Every "$key" entry must be an object.'),
    ];
  }

  Future<void> _loadSections(
    Session session,
    List<Map<String, dynamic>> rows,
    DataLoadResult result,
  ) async {
    for (final row in rows) {
      final name = _requiredString(row, 'name');
      final section = Section(
        name: name,
        description: _requiredString(row, 'description'),
        location: _optionalString(row, 'location'),
        contactInfo: _optionalString(row, 'contactInfo'),
      );

      final existing = await Section.db.findFirstRow(
        session,
        where: (t) => t.name.equals(name),
      );

      if (existing == null) {
        await Section.db.insertRow(session, section);
        result.sectionsInserted++;
      } else {
        await Section.db.updateRow(session, section.copyWith(id: existing.id));
        result.sectionsUpdated++;
      }
    }
  }

  Future<void> _loadEventTemplates(
    Session session,
    List<Map<String, dynamic>> rows,
    DataLoadResult result,
  ) async {
    for (final row in rows) {
      final name = _requiredString(row, 'name');
      final language = _optionalString(row, 'language') ?? 'en';
      final template = EventTemplate(
        name: name,
        description: _requiredString(row, 'description'),
        content: _requiredString(row, 'content'),
        language: language,
      );

      final existing = await EventTemplate.db.findFirstRow(
        session,
        where: (t) => t.name.equals(name) & t.language.equals(language),
      );

      if (existing == null) {
        await EventTemplate.db.insertRow(session, template);
        result.eventTemplatesInserted++;
      } else {
        await EventTemplate.db.updateRow(
          session,
          template.copyWith(id: existing.id),
        );
        result.eventTemplatesUpdated++;
      }
    }
  }

  Future<void> _loadNotificationTemplates(
    Session session,
    List<Map<String, dynamic>> rows,
    DataLoadResult result,
  ) async {
    for (final row in rows) {
      final name = _requiredString(row, 'name');
      final now = DateTime.now().toUtc();
      final existing = await NotificationTemplate.db.findFirstRow(
        session,
        where: (t) => t.name.equals(name),
      );
      final createdAt =
          _optionalDateTime(row, 'createdAt') ?? existing?.createdAt ?? now;
      final template = NotificationTemplate(
        name: name,
        titleTemplate: _requiredString(row, 'titleTemplate'),
        bodyTemplate: _requiredString(row, 'bodyTemplate'),
        htmlTemplate: _optionalString(row, 'htmlTemplate'),
        createdAt: createdAt,
        updatedAt: _optionalDateTime(row, 'updatedAt') ?? now,
      );

      if (existing == null) {
        await NotificationTemplate.db.insertRow(session, template);
        result.notificationTemplatesInserted++;
      } else {
        await NotificationTemplate.db.updateRow(
          session,
          template.copyWith(id: existing.id),
        );
        result.notificationTemplatesUpdated++;
      }
    }
  }

  String _requiredString(Map<String, dynamic> row, String key) {
    final value = row[key];
    if (value is String && value.isNotEmpty) return value;
    throw DataLoaderException('Required string field "$key" is missing.');
  }

  String? _optionalString(Map<String, dynamic> row, String key) {
    final value = row[key];
    if (value == null) return null;
    if (value is String) return value;
    throw DataLoaderException('Optional field "$key" must be a string.');
  }

  DateTime? _optionalDateTime(Map<String, dynamic> row, String key) {
    final value = row[key];
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.parse(value);
    throw DataLoaderException('Optional field "$key" must be a DateTime.');
  }
}

class DataLoaderException implements Exception {
  DataLoaderException(this.message);

  final String message;

  @override
  String toString() => message;
}
