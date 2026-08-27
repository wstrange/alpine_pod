/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:alpine_pod_server/src/generated/event.dart' as _ix3n45j3;
import 'package:alpine_pod_server/src/generated/event_manager.dart'
    as _ic9gt6sp;
import 'package:alpine_pod_server/src/generated/event_registration.dart'
    as _ilehff48;
import 'package:alpine_pod_server/src/generated/event_template.dart'
    as _ien9qwaj;
import 'package:alpine_pod_server/src/generated/member.dart' as _i4yfgm2x;
import 'package:alpine_pod_server/src/generated/notification_delivery.dart'
    as _id1h1owf;
import 'package:alpine_pod_server/src/generated/section.dart' as _ikvglbzb;
import 'package:alpine_pod_server/src/generated/section_membership.dart'
    as _i63wiasb;
import 'package:alpine_pod_server/src/generated/user_notification.dart'
    as _il434e8e;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'event.dart' as _iu57571s;
import 'event_manager.dart' as _ich6ygep;
import 'event_registration.dart' as _i27uzliw;
import 'event_template.dart' as _inrioji0;
import 'fcm_token.dart' as _iv0wxest;
import 'member.dart' as _i7zhj6lg;
import 'notification.dart' as _irt10kca;
import 'notification_channel.dart' as _i05lhlgd;
import 'notification_delivery.dart' as _ikw6watb;
import 'notification_template.dart' as _ikosvoxr;
import 'registration_status.dart' as _infnr7i7;
import 'section.dart' as _ibhmj7lb;
import 'section_membership.dart' as _ikti0jxs;
import 'user_notification.dart' as _ikzqql1t;
import 'user_notification_preference.dart' as _iiu7743a;
export 'event.dart';
export 'event_manager.dart';
export 'event_registration.dart';
export 'event_template.dart';
export 'fcm_token.dart';
export 'member.dart';
export 'notification.dart';
export 'notification_channel.dart';
export 'notification_delivery.dart';
export 'notification_template.dart';
export 'registration_status.dart';
export 'section.dart';
export 'section_membership.dart';
export 'user_notification.dart';
export 'user_notification_preference.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'event_managers',
      dartName: 'EventManager',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'eventId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'memberId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'assignedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'event_managers_fk_0',
          columns: ['eventId'],
          referenceTable: 'events',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'event_managers_fk_1',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'event_manager_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'event_registrations',
      dartName: 'EventRegistration',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'memberId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'eventId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'registrationStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RegistrationStatus',
        ),
        _isp.ColumnDefinition(
          name: 'registrationDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'carPoolPreference',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'additionalGuests',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'waiverAccepted',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'participantNotes',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'waitlistPosition',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'waitlistedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'paymentStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'N/A\'',
        ),
        _isp.ColumnDefinition(
          name: 'paymentAmount',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isp.ColumnDefinition(
          name: 'modifiedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'noShow',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'event_registrations_fk_0',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'event_registrations_fk_1',
          columns: ['eventId'],
          referenceTable: 'events',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_event_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'event_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'registrationStatus',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'event_templates',
      dartName: 'EventTemplate',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'content',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'language',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'en\'',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'events',
      dartName: 'Event',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'type',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'startTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'endTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'eventLocation',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'carpoolLocation',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'carpoolTime',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'registrationDeadline',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'registrationStartDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'registrationFee',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'requiresApproval',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'minimumParticipants',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'maxParticipants',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '8',
        ),
        _isp.ColumnDefinition(
          name: 'cancellationDeadline',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'cancelled',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'sectionId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'published',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'events_fk_0',
          columns: ['sectionId'],
          referenceTable: 'sections',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'upcoming_events_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'startTime',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'section_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'sectionId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'fcm_tokens',
      dartName: 'FcmToken',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'token',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'deviceId',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'token_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'token',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'fcm_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'members',
      dartName: 'Member',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'firstName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'lastName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'displayName',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'bio',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'email',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'membershipStatus',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'active\'',
        ),
        _isp.ColumnDefinition(
          name: 'emergencyContactName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'emergencyContactPhone',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'medicalConditions',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'profileImageUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'waiverSignedDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: '1970-01-01T00:00:00.000Z',
        ),
        _isp.ColumnDefinition(
          name: 'certifications',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'member_id_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'email_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'notification',
      dartName: 'Notification',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'templateId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'data',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'Map<String,String>',
        ),
        _isp.ColumnDefinition(
          name: 'actionUrl',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'renderedTitle',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'renderedBody',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'renderedHtml',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'notification_fk_0',
          columns: ['templateId'],
          referenceTable: 'notification_template',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'notification_delivery',
      dartName: 'NotificationDelivery',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'notificationId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'recipientUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'channel',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:NotificationChannel',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'pending\'',
        ),
        _isp.ColumnDefinition(
          name: 'attempts',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'lastAttemptAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'errorMessage',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'info',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'sectionId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'notification_delivery_fk_0',
          columns: ['notificationId'],
          referenceTable: 'notification',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'notification_delivery_fk_1',
          columns: ['recipientUserId'],
          referenceTable: 'serverpod_auth_core_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'pending_delivery_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'recipient_channel_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'recipientUserId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'channel',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'notification_template',
      dartName: 'NotificationTemplate',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'titleTemplate',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'bodyTemplate',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'htmlTemplate',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'name_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'name',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'section_memberships',
      dartName: 'SectionMembership',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'memberId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'sectionId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'externalUserId',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'syncedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'sourceSystem',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'scopes',
          columnType: _isp.ColumnType.json,
          isNullable: false,
          dartType: 'Set<String>',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'section_memberships_fk_0',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'section_memberships_fk_1',
          columns: ['sectionId'],
          referenceTable: 'sections',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_section_unique_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'sectionId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'sections',
      dartName: 'Section',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'location',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'contactInfo',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'idx_sections_name',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'name',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_notification',
      dartName: 'UserNotification',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'notificationId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'isRead',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'isSeen',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'readAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'user_notification_fk_0',
          columns: ['notificationId'],
          referenceTable: 'notification',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_feed_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_notification_preference',
      dartName: 'UserNotificationPreference',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'allowInApp',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'allowEmail',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'allowPush',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'allowSms',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isp.ColumnDefinition(
          name: 'newEvents',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_type_unique_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(dynamic data, [Type? t]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _iu57571s.Event) {
      return _iu57571s.Event.fromJson(data) as T;
    }
    if (t == _ich6ygep.EventManager) {
      return _ich6ygep.EventManager.fromJson(data) as T;
    }
    if (t == _i27uzliw.EventRegistration) {
      return _i27uzliw.EventRegistration.fromJson(data) as T;
    }
    if (t == _inrioji0.EventTemplate) {
      return _inrioji0.EventTemplate.fromJson(data) as T;
    }
    if (t == _iv0wxest.FcmToken) {
      return _iv0wxest.FcmToken.fromJson(data) as T;
    }
    if (t == _i7zhj6lg.Member) {
      return _i7zhj6lg.Member.fromJson(data) as T;
    }
    if (t == _irt10kca.Notification) {
      return _irt10kca.Notification.fromJson(data) as T;
    }
    if (t == _i05lhlgd.NotificationChannel) {
      return _i05lhlgd.NotificationChannel.fromJson(data) as T;
    }
    if (t == _ikw6watb.NotificationDelivery) {
      return _ikw6watb.NotificationDelivery.fromJson(data) as T;
    }
    if (t == _ikosvoxr.NotificationTemplate) {
      return _ikosvoxr.NotificationTemplate.fromJson(data) as T;
    }
    if (t == _infnr7i7.RegistrationStatus) {
      return _infnr7i7.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _ibhmj7lb.Section) {
      return _ibhmj7lb.Section.fromJson(data) as T;
    }
    if (t == _ikti0jxs.SectionMembership) {
      return _ikti0jxs.SectionMembership.fromJson(data) as T;
    }
    if (t == _ikzqql1t.UserNotification) {
      return _ikzqql1t.UserNotification.fromJson(data) as T;
    }
    if (t == _iiu7743a.UserNotificationPreference) {
      return _iiu7743a.UserNotificationPreference.fromJson(data) as T;
    }
    if (t == _is.getType<_iu57571s.Event?>()) {
      return (data != null ? _iu57571s.Event.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ich6ygep.EventManager?>()) {
      return (data != null ? _ich6ygep.EventManager.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i27uzliw.EventRegistration?>()) {
      return (data != null ? _i27uzliw.EventRegistration.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_inrioji0.EventTemplate?>()) {
      return (data != null ? _inrioji0.EventTemplate.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iv0wxest.FcmToken?>()) {
      return (data != null ? _iv0wxest.FcmToken.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i7zhj6lg.Member?>()) {
      return (data != null ? _i7zhj6lg.Member.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_irt10kca.Notification?>()) {
      return (data != null ? _irt10kca.Notification.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i05lhlgd.NotificationChannel?>()) {
      return (data != null
              ? _i05lhlgd.NotificationChannel.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ikw6watb.NotificationDelivery?>()) {
      return (data != null
              ? _ikw6watb.NotificationDelivery.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ikosvoxr.NotificationTemplate?>()) {
      return (data != null
              ? _ikosvoxr.NotificationTemplate.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_infnr7i7.RegistrationStatus?>()) {
      return (data != null ? _infnr7i7.RegistrationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ibhmj7lb.Section?>()) {
      return (data != null ? _ibhmj7lb.Section.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ikti0jxs.SectionMembership?>()) {
      return (data != null ? _ikti0jxs.SectionMembership.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ikzqql1t.UserNotification?>()) {
      return (data != null ? _ikzqql1t.UserNotification.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iiu7743a.UserNotificationPreference?>()) {
      return (data != null
              ? _iiu7743a.UserNotificationPreference.fromJson(data)
              : null)
          as T;
    }
    if (t == List<_i27uzliw.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i27uzliw.EventRegistration>(e))
              .toList()
          as T;
    }
    if (t == _is.getType<List<_i27uzliw.EventRegistration>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i27uzliw.EventRegistration>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_ich6ygep.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_ich6ygep.EventManager>(e))
              .toList()
          as T;
    }
    if (t == _is.getType<List<_ich6ygep.EventManager>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_ich6ygep.EventManager>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String>(v)),
          )
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<_ikvglbzb.Section>) {
      return (data as List)
              .map((e) => deserialize<_ikvglbzb.Section>(e))
              .toList()
          as T;
    }
    if (t == List<_id1h1owf.NotificationDelivery>) {
      return (data as List)
              .map((e) => deserialize<_id1h1owf.NotificationDelivery>(e))
              .toList()
          as T;
    }
    if (t == List<_is.UuidValue>) {
      return (data as List).map((e) => deserialize<_is.UuidValue>(e)).toList()
          as T;
    }
    if (t == _is.getType<List<_is.UuidValue>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_is.UuidValue>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_ix3n45j3.Event>) {
      return (data as List).map((e) => deserialize<_ix3n45j3.Event>(e)).toList()
          as T;
    }
    if (t == List<_ic9gt6sp.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_ic9gt6sp.EventManager>(e))
              .toList()
          as T;
    }
    if (t == List<_ien9qwaj.EventTemplate>) {
      return (data as List)
              .map((e) => deserialize<_ien9qwaj.EventTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i63wiasb.SectionMembership>) {
      return (data as List)
              .map((e) => deserialize<_i63wiasb.SectionMembership>(e))
              .toList()
          as T;
    }
    if (t == List<_i4yfgm2x.Member>) {
      return (data as List)
              .map((e) => deserialize<_i4yfgm2x.Member>(e))
              .toList()
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<_il434e8e.UserNotification>) {
      return (data as List)
              .map((e) => deserialize<_il434e8e.UserNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_ilehff48.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_ilehff48.EventRegistration>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _iu57571s.Event => 'Event',
      _ich6ygep.EventManager => 'EventManager',
      _i27uzliw.EventRegistration => 'EventRegistration',
      _inrioji0.EventTemplate => 'EventTemplate',
      _iv0wxest.FcmToken => 'FcmToken',
      _i7zhj6lg.Member => 'Member',
      _irt10kca.Notification => 'Notification',
      _i05lhlgd.NotificationChannel => 'NotificationChannel',
      _ikw6watb.NotificationDelivery => 'NotificationDelivery',
      _ikosvoxr.NotificationTemplate => 'NotificationTemplate',
      _infnr7i7.RegistrationStatus => 'RegistrationStatus',
      _ibhmj7lb.Section => 'Section',
      _ikti0jxs.SectionMembership => 'SectionMembership',
      _ikzqql1t.UserNotification => 'UserNotification',
      _iiu7743a.UserNotificationPreference => 'UserNotificationPreference',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('alpine_pod.', '');
    }

    switch (data) {
      case _iu57571s.Event():
        return 'Event';
      case _ich6ygep.EventManager():
        return 'EventManager';
      case _i27uzliw.EventRegistration():
        return 'EventRegistration';
      case _inrioji0.EventTemplate():
        return 'EventTemplate';
      case _iv0wxest.FcmToken():
        return 'FcmToken';
      case _i7zhj6lg.Member():
        return 'Member';
      case _irt10kca.Notification():
        return 'Notification';
      case _i05lhlgd.NotificationChannel():
        return 'NotificationChannel';
      case _ikw6watb.NotificationDelivery():
        return 'NotificationDelivery';
      case _ikosvoxr.NotificationTemplate():
        return 'NotificationTemplate';
      case _infnr7i7.RegistrationStatus():
        return 'RegistrationStatus';
      case _ibhmj7lb.Section():
        return 'Section';
      case _ikti0jxs.SectionMembership():
        return 'SectionMembership';
      case _ikzqql1t.UserNotification():
        return 'UserNotification';
      case _iiu7743a.UserNotificationPreference():
        return 'UserNotificationPreference';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Event') {
      return deserialize<_iu57571s.Event>(data['data']);
    }
    if (dataClassName == 'EventManager') {
      return deserialize<_ich6ygep.EventManager>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i27uzliw.EventRegistration>(data['data']);
    }
    if (dataClassName == 'EventTemplate') {
      return deserialize<_inrioji0.EventTemplate>(data['data']);
    }
    if (dataClassName == 'FcmToken') {
      return deserialize<_iv0wxest.FcmToken>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i7zhj6lg.Member>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_irt10kca.Notification>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i05lhlgd.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationDelivery') {
      return deserialize<_ikw6watb.NotificationDelivery>(data['data']);
    }
    if (dataClassName == 'NotificationTemplate') {
      return deserialize<_ikosvoxr.NotificationTemplate>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_infnr7i7.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_ibhmj7lb.Section>(data['data']);
    }
    if (dataClassName == 'SectionMembership') {
      return deserialize<_ikti0jxs.SectionMembership>(data['data']);
    }
    if (dataClassName == 'UserNotification') {
      return deserialize<_ikzqql1t.UserNotification>(data['data']);
    }
    if (dataClassName == 'UserNotificationPreference') {
      return deserialize<_iiu7743a.UserNotificationPreference>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('alpine_pod', this);
    _iacs.Protocol().registerHostProtocol('alpine_pod', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _iu57571s.Event:
        return _iu57571s.Event.t;
      case _ich6ygep.EventManager:
        return _ich6ygep.EventManager.t;
      case _i27uzliw.EventRegistration:
        return _i27uzliw.EventRegistration.t;
      case _inrioji0.EventTemplate:
        return _inrioji0.EventTemplate.t;
      case _iv0wxest.FcmToken:
        return _iv0wxest.FcmToken.t;
      case _i7zhj6lg.Member:
        return _i7zhj6lg.Member.t;
      case _irt10kca.Notification:
        return _irt10kca.Notification.t;
      case _ikw6watb.NotificationDelivery:
        return _ikw6watb.NotificationDelivery.t;
      case _ikosvoxr.NotificationTemplate:
        return _ikosvoxr.NotificationTemplate.t;
      case _ibhmj7lb.Section:
        return _ibhmj7lb.Section.t;
      case _ikti0jxs.SectionMembership:
        return _ikti0jxs.SectionMembership.t;
      case _ikzqql1t.UserNotification:
        return _ikzqql1t.UserNotification.t;
      case _iiu7743a.UserNotificationPreference:
        return _iiu7743a.UserNotificationPreference.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'alpine_pod';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
