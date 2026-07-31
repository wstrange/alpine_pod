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
import 'package:serverpod_database/serverpod_database.dart' as _i1;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i2;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i3;
import 'event.dart' as _i4;
import 'event_manager.dart' as _i5;
import 'event_registration.dart' as _i6;
import 'event_template.dart' as _i7;
import 'fcm_token.dart' as _i8;
import 'member.dart' as _i9;
import 'notification.dart' as _i10;
import 'notification_channel.dart' as _i11;
import 'notification_delivery.dart' as _i12;
import 'notification_template.dart' as _i13;
import 'registration_status.dart' as _i14;
import 'section.dart' as _i15;
import 'section_membership.dart' as _i16;
import 'user_notification.dart' as _i17;
import 'user_notification_preference.dart' as _i18;
import 'package:serverpod_client/serverpod_client.dart' as _i19;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i20;
import 'package:alpine_pod_client/src/protocol/notification_delivery.dart'
    as _i21;
import 'package:alpine_pod_client/src/protocol/event.dart' as _i22;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _i23;
import 'package:alpine_pod_client/src/protocol/event_template.dart' as _i24;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i25;
import 'package:alpine_pod_client/src/protocol/member.dart' as _i26;
import 'package:alpine_pod_client/src/protocol/user_notification.dart' as _i27;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i28;
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
export 'client.dart';

class Protocol extends _i1.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static final List<_i1.TableDefinition> targetTableDefinitions = [
    _i1.TableDefinition(
      name: 'event_managers',
      dartName: 'EventManager',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'eventId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'memberId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'assignedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _i1.ForeignKeyDefinition(
          constraintName: 'event_managers_fk_0',
          columns: ['eventId'],
          referenceTable: 'events',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i1.ForeignKeyDefinition(
          constraintName: 'event_managers_fk_1',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'event_manager_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    _i1.TableDefinition(
      name: 'event_registrations',
      dartName: 'EventRegistration',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'memberId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'eventId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'registrationStatus',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RegistrationStatus',
        ),
        _i1.ColumnDefinition(
          name: 'registrationDate',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i1.ColumnDefinition(
          name: 'carPoolPreference',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'additionalGuests',
          columnType: _i1.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i1.ColumnDefinition(
          name: 'waiverAccepted',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i1.ColumnDefinition(
          name: 'participantNotes',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'waitlistPosition',
          columnType: _i1.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i1.ColumnDefinition(
          name: 'waitlistedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i1.ColumnDefinition(
          name: 'paymentStatus',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'N/A\'',
        ),
        _i1.ColumnDefinition(
          name: 'paymentAmount',
          columnType: _i1.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _i1.ColumnDefinition(
          name: 'modifiedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _i1.ColumnDefinition(
          name: 'noShow',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i1.ForeignKeyDefinition(
          constraintName: 'event_registrations_fk_0',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i1.ForeignKeyDefinition(
          constraintName: 'event_registrations_fk_1',
          columns: ['eventId'],
          referenceTable: 'events',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'user_event_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i1.IndexDefinition(
          indexName: 'event_status_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    _i1.TableDefinition(
      name: 'events',
      dartName: 'Event',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'title',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'description',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'type',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'startTime',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i1.ColumnDefinition(
          name: 'endTime',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i1.ColumnDefinition(
          name: 'eventLocation',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'carpoolLocation',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'carpoolTime',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i1.ColumnDefinition(
          name: 'registrationDeadline',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i1.ColumnDefinition(
          name: 'registrationStartDate',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i1.ColumnDefinition(
          name: 'registrationFee',
          columnType: _i1.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i1.ColumnDefinition(
          name: 'requiresApproval',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i1.ColumnDefinition(
          name: 'minimumParticipants',
          columnType: _i1.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i1.ColumnDefinition(
          name: 'maxParticipants',
          columnType: _i1.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '8',
        ),
        _i1.ColumnDefinition(
          name: 'cancellationDeadline',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i1.ColumnDefinition(
          name: 'cancelled',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i1.ColumnDefinition(
          name: 'sectionId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'published',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _i1.ForeignKeyDefinition(
          constraintName: 'events_fk_0',
          columns: ['sectionId'],
          referenceTable: 'sections',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'upcoming_events_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'startTime',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i1.IndexDefinition(
          indexName: 'section_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    _i1.TableDefinition(
      name: 'members',
      dartName: 'Member',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'firstName',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'lastName',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'displayName',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'bio',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'email',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'membershipStatus',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'active\'',
        ),
        _i1.ColumnDefinition(
          name: 'emergencyContactName',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'emergencyContactPhone',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'medicalConditions',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'waiverSignedDate',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: '1970-01-01T00:00:00.000Z',
        ),
        _i1.ColumnDefinition(
          name: 'certifications',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'createdAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'member_id_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i1.IndexDefinition(
          indexName: 'email_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    _i1.TableDefinition(
      name: 'section_memberships',
      dartName: 'SectionMembership',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'memberId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'sectionId',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i1.ColumnDefinition(
          name: 'externalUserId',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'syncedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _i1.ColumnDefinition(
          name: 'sourceSystem',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'scopes',
          columnType: _i1.ColumnType.json,
          isNullable: false,
          dartType: 'Set<String>',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _i1.ForeignKeyDefinition(
          constraintName: 'section_memberships_fk_0',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i1.ForeignKeyDefinition(
          constraintName: 'section_memberships_fk_1',
          columns: ['sectionId'],
          referenceTable: 'sections',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i1.ForeignKeyAction.noAction,
          onDelete: _i1.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'user_section_unique_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    _i1.TableDefinition(
      name: 'sections',
      dartName: 'Section',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'name',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'description',
          columnType: _i1.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i1.ColumnDefinition(
          name: 'location',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'contactInfo',
          columnType: _i1.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'idx_sections_name',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    _i1.TableDefinition(
      name: 'user_notification_preference',
      dartName: 'UserNotificationPreference',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _i1.ColumnDefinition(
          name: 'id',
          columnType: _i1.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _i1.ColumnDefinition(
          name: 'allowInApp',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i1.ColumnDefinition(
          name: 'allowEmail',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i1.ColumnDefinition(
          name: 'allowPush',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i1.ColumnDefinition(
          name: 'allowSms',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i1.ColumnDefinition(
          name: 'newEvents',
          columnType: _i1.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i1.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i1.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i1.IndexDefinition(
          indexName: 'user_type_unique_idx',
          tableSpace: null,
          elements: [
            _i1.IndexElementDefinition(
              type: _i1.IndexElementDefinitionType.column,
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
    ..._i2.Protocol() is _i1.DatabaseSerializationManager
        ? (_i2.Protocol() as _i1.DatabaseSerializationManager)
              .getTargetTableDefinitions()
        : [],
    ..._i3.Protocol() is _i1.DatabaseSerializationManager
        ? (_i3.Protocol() as _i1.DatabaseSerializationManager)
              .getTargetTableDefinitions()
        : [],
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
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

    if (t == _i4.Event) {
      return _i4.Event.fromJson(data) as T;
    }
    if (t == _i5.EventManager) {
      return _i5.EventManager.fromJson(data) as T;
    }
    if (t == _i6.EventRegistration) {
      return _i6.EventRegistration.fromJson(data) as T;
    }
    if (t == _i7.EventTemplate) {
      return _i7.EventTemplate.fromJson(data) as T;
    }
    if (t == _i8.FcmToken) {
      return _i8.FcmToken.fromJson(data) as T;
    }
    if (t == _i9.Member) {
      return _i9.Member.fromJson(data) as T;
    }
    if (t == _i10.Notification) {
      return _i10.Notification.fromJson(data) as T;
    }
    if (t == _i11.NotificationChannel) {
      return _i11.NotificationChannel.fromJson(data) as T;
    }
    if (t == _i12.NotificationDelivery) {
      return _i12.NotificationDelivery.fromJson(data) as T;
    }
    if (t == _i13.NotificationTemplate) {
      return _i13.NotificationTemplate.fromJson(data) as T;
    }
    if (t == _i14.RegistrationStatus) {
      return _i14.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _i15.Section) {
      return _i15.Section.fromJson(data) as T;
    }
    if (t == _i16.SectionMembership) {
      return _i16.SectionMembership.fromJson(data) as T;
    }
    if (t == _i17.UserNotification) {
      return _i17.UserNotification.fromJson(data) as T;
    }
    if (t == _i18.UserNotificationPreference) {
      return _i18.UserNotificationPreference.fromJson(data) as T;
    }
    if (t == _i19.getType<_i4.Event?>()) {
      return (data != null ? _i4.Event.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i5.EventManager?>()) {
      return (data != null ? _i5.EventManager.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i6.EventRegistration?>()) {
      return (data != null ? _i6.EventRegistration.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i7.EventTemplate?>()) {
      return (data != null ? _i7.EventTemplate.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i8.FcmToken?>()) {
      return (data != null ? _i8.FcmToken.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i9.Member?>()) {
      return (data != null ? _i9.Member.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i10.Notification?>()) {
      return (data != null ? _i10.Notification.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i11.NotificationChannel?>()) {
      return (data != null ? _i11.NotificationChannel.fromJson(data) : null)
          as T;
    }
    if (t == _i19.getType<_i12.NotificationDelivery?>()) {
      return (data != null ? _i12.NotificationDelivery.fromJson(data) : null)
          as T;
    }
    if (t == _i19.getType<_i13.NotificationTemplate?>()) {
      return (data != null ? _i13.NotificationTemplate.fromJson(data) : null)
          as T;
    }
    if (t == _i19.getType<_i14.RegistrationStatus?>()) {
      return (data != null ? _i14.RegistrationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i19.getType<_i15.Section?>()) {
      return (data != null ? _i15.Section.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i16.SectionMembership?>()) {
      return (data != null ? _i16.SectionMembership.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i17.UserNotification?>()) {
      return (data != null ? _i17.UserNotification.fromJson(data) : null) as T;
    }
    if (t == _i19.getType<_i18.UserNotificationPreference?>()) {
      return (data != null
              ? _i18.UserNotificationPreference.fromJson(data)
              : null)
          as T;
    }
    if (t == List<_i6.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i6.EventRegistration>(e))
              .toList()
          as T;
    }
    if (t == _i19.getType<List<_i6.EventRegistration>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.EventRegistration>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i5.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_i5.EventManager>(e))
              .toList()
          as T;
    }
    if (t == _i19.getType<List<_i5.EventManager>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i5.EventManager>(e))
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
    if (t == List<_i20.Section>) {
      return (data as List).map((e) => deserialize<_i20.Section>(e)).toList()
          as T;
    }
    if (t == List<_i21.NotificationDelivery>) {
      return (data as List)
              .map((e) => deserialize<_i21.NotificationDelivery>(e))
              .toList()
          as T;
    }
    if (t == List<_i19.UuidValue>) {
      return (data as List).map((e) => deserialize<_i19.UuidValue>(e)).toList()
          as T;
    }
    if (t == _i19.getType<List<_i19.UuidValue>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.UuidValue>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i22.Event>) {
      return (data as List).map((e) => deserialize<_i22.Event>(e)).toList()
          as T;
    }
    if (t == List<_i23.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_i23.EventManager>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.EventTemplate>) {
      return (data as List)
              .map((e) => deserialize<_i24.EventTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_i25.SectionMembership>) {
      return (data as List)
              .map((e) => deserialize<_i25.SectionMembership>(e))
              .toList()
          as T;
    }
    if (t == List<_i26.Member>) {
      return (data as List).map((e) => deserialize<_i26.Member>(e)).toList()
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<_i27.UserNotification>) {
      return (data as List)
              .map((e) => deserialize<_i27.UserNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i28.EventRegistration>(e))
              .toList()
          as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i19.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i19.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i4.Event => 'Event',
      _i5.EventManager => 'EventManager',
      _i6.EventRegistration => 'EventRegistration',
      _i7.EventTemplate => 'EventTemplate',
      _i8.FcmToken => 'FcmToken',
      _i9.Member => 'Member',
      _i10.Notification => 'Notification',
      _i11.NotificationChannel => 'NotificationChannel',
      _i12.NotificationDelivery => 'NotificationDelivery',
      _i13.NotificationTemplate => 'NotificationTemplate',
      _i14.RegistrationStatus => 'RegistrationStatus',
      _i15.Section => 'Section',
      _i16.SectionMembership => 'SectionMembership',
      _i17.UserNotification => 'UserNotification',
      _i18.UserNotificationPreference => 'UserNotificationPreference',
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
      case _i4.Event():
        return 'Event';
      case _i5.EventManager():
        return 'EventManager';
      case _i6.EventRegistration():
        return 'EventRegistration';
      case _i7.EventTemplate():
        return 'EventTemplate';
      case _i8.FcmToken():
        return 'FcmToken';
      case _i9.Member():
        return 'Member';
      case _i10.Notification():
        return 'Notification';
      case _i11.NotificationChannel():
        return 'NotificationChannel';
      case _i12.NotificationDelivery():
        return 'NotificationDelivery';
      case _i13.NotificationTemplate():
        return 'NotificationTemplate';
      case _i14.RegistrationStatus():
        return 'RegistrationStatus';
      case _i15.Section():
        return 'Section';
      case _i16.SectionMembership():
        return 'SectionMembership';
      case _i17.UserNotification():
        return 'UserNotification';
      case _i18.UserNotificationPreference():
        return 'UserNotificationPreference';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
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
      return deserialize<_i4.Event>(data['data']);
    }
    if (dataClassName == 'EventManager') {
      return deserialize<_i5.EventManager>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i6.EventRegistration>(data['data']);
    }
    if (dataClassName == 'EventTemplate') {
      return deserialize<_i7.EventTemplate>(data['data']);
    }
    if (dataClassName == 'FcmToken') {
      return deserialize<_i8.FcmToken>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i9.Member>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i10.Notification>(data['data']);
    }
    if (dataClassName == 'NotificationChannel') {
      return deserialize<_i11.NotificationChannel>(data['data']);
    }
    if (dataClassName == 'NotificationDelivery') {
      return deserialize<_i12.NotificationDelivery>(data['data']);
    }
    if (dataClassName == 'NotificationTemplate') {
      return deserialize<_i13.NotificationTemplate>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_i14.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_i15.Section>(data['data']);
    }
    if (dataClassName == 'SectionMembership') {
      return deserialize<_i16.SectionMembership>(data['data']);
    }
    if (dataClassName == 'UserNotification') {
      return deserialize<_i17.UserNotification>(data['data']);
    }
    if (dataClassName == 'UserNotificationPreference') {
      return deserialize<_i18.UserNotificationPreference>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _i2.Protocol().registerHostProtocol('alpine_pod', this);
    _i3.Protocol().registerHostProtocol('alpine_pod', this);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var protocol = _i2.Protocol();
      var table = protocol is _i1.DatabaseSerializationManager
          ? (protocol as _i1.DatabaseSerializationManager).getTableForType(t)
          : null;
      if (table != null) {
        return table;
      }
    }
    {
      var protocol = _i3.Protocol();
      var table = protocol is _i1.DatabaseSerializationManager
          ? (protocol as _i1.DatabaseSerializationManager).getTableForType(t)
          : null;
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Event:
        return _i4.Event.t;
      case _i5.EventManager:
        return _i5.EventManager.t;
      case _i6.EventRegistration:
        return _i6.EventRegistration.t;
      case _i9.Member:
        return _i9.Member.t;
      case _i15.Section:
        return _i15.Section.t;
      case _i16.SectionMembership:
        return _i16.SectionMembership.t;
      case _i18.UserNotificationPreference:
        return _i18.UserNotificationPreference.t;
    }
    return null;
  }

  @override
  List<_i1.TableDefinition> getTargetTableDefinitions() =>
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
      return _i2.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
