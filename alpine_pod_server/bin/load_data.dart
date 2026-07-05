import 'dart:io';

import 'package:args/args.dart';
import 'package:alpine_pod_server/src/generated/endpoints.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:alpine_pod_server/src/tools/data_loader.dart';
import 'package:serverpod/serverpod.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'mode',
      abbr: 'm',
      defaultsTo: 'development',
      help: 'Serverpod run mode to use for config and database settings.',
    )
    ..addOption('server-id', defaultsTo: 'default', help: 'Serverpod server id.')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Print this usage information.');

  late ArgResults results;
  try {
    results = parser.parse(arguments);
  } on FormatException catch (error) {
    stderr.writeln(error.message);
    _printUsage(parser);
    exitCode = 64;
    return;
  }

  if (results['help'] as bool) {
    _printUsage(parser);
    return;
  }

  final files = results.rest;
  if (files.isEmpty) {
    stderr.writeln('Provide at least one .json, .yaml, or .yml data file.');
    _printUsage(parser);
    exitCode = 64;
    return;
  }

  final mode = results['mode'] as String;
  final serverId = results['server-id'] as String;
  final pod = Serverpod(['--mode', mode, '--server-id', serverId, '--apply-migrations'], Protocol(), Endpoints());

  final session = await pod.createSession();
  try {
    final loader = ServerDataLoader();
    var totalInserted = 0;
    var totalUpdated = 0;

    for (final file in files) {
      final result = await loader.loadFile(session, file);
      totalInserted += result.totalInserted;
      totalUpdated += result.totalUpdated;
      stdout.writeln('Loaded $file');
      stdout.writeln(
        '  sections: ${result.sectionsInserted} inserted, '
        '${result.sectionsUpdated} updated',
      );
      stdout.writeln(
        '  event templates: ${result.eventTemplatesInserted} inserted, '
        '${result.eventTemplatesUpdated} updated',
      );
      stdout.writeln(
        '  mail templates: ${result.notificationTemplatesInserted} inserted, '
        '${result.notificationTemplatesUpdated} updated',
      );
    }

    stdout.writeln('Done: $totalInserted inserted, $totalUpdated updated.');
  } on DataLoaderException catch (error) {
    stderr.writeln(error.message);
    exitCode = 1;
  } finally {
    await session.close();
    await pod.shutdown(exitProcess: false);
  }
}

void _printUsage(ArgParser parser) {
  stdout.writeln('Load sections, event templates, and mail templates.');
  stdout.writeln('');
  stdout.writeln('Usage: dart run bin/load_data.dart [options] <file...>');
  stdout.writeln('');
  stdout.writeln(parser.usage);
  stdout.writeln('');
  stdout.writeln('YAML/JSON shape:');
  stdout.writeln('  sections: [{name, description, location?, contactInfo?}]');
  stdout.writeln('  eventTemplates: [{name, description, content, language?}]');
  stdout.writeln(
    '  notificationTemplates: '
    '[{name, titleTemplate, bodyTemplate, htmlTemplate?}]',
  );
}
