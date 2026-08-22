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
import 'package:alpine_pod_client/src/protocol/event.dart' as _ix4abnwg;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _iygn3jma;
import 'package:alpine_pod_client/src/protocol/event_registration.dart'
    as _isud34nx;
import 'package:alpine_pod_client/src/protocol/event_template.dart'
    as _imjavx7o;
import 'package:alpine_pod_client/src/protocol/member.dart' as _ixkkgnmw;
import 'package:alpine_pod_client/src/protocol/notification_delivery.dart'
    as _ionzmxtq;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i7dvc5iw;
import 'package:alpine_pod_client/src/protocol/section_membership.dart'
    as _ikapn372;
import 'package:alpine_pod_client/src/protocol/user_notification.dart'
    as _i9cwoz9c;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:serverpod_database/serverpod_database.dart' as _isd;
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
export 'client.dart';

class Protocol extends _isd.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isd.TableDefinition> get targetTableDefinitions => [
    _isd.TableDefinition(
      name: 'event_managers',
      dartName: 'EventManager',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'eventId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'memberId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'assignedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isd.ForeignKeyDefinition(
          constraintName: 'event_managers_fk_0',
          columns: ['eventId'],
          referenceTable: 'events',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isd.ForeignKeyDefinition(
          constraintName: 'event_managers_fk_1',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'event_manager_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    _isd.TableDefinition(
      name: 'event_registrations',
      dartName: 'EventRegistration',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'memberId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'eventId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'registrationStatus',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RegistrationStatus',
        ),
        _isd.ColumnDefinition(
          name: 'registrationDate',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isd.ColumnDefinition(
          name: 'carPoolPreference',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'additionalGuests',
          columnType: _isd.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isd.ColumnDefinition(
          name: 'waiverAccepted',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isd.ColumnDefinition(
          name: 'participantNotes',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'waitlistPosition',
          columnType: _isd.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isd.ColumnDefinition(
          name: 'waitlistedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isd.ColumnDefinition(
          name: 'paymentStatus',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'N/A\'',
        ),
        _isd.ColumnDefinition(
          name: 'paymentAmount',
          columnType: _isd.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
        _isd.ColumnDefinition(
          name: 'modifiedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isd.ColumnDefinition(
          name: 'noShow',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _isd.ForeignKeyDefinition(
          constraintName: 'event_registrations_fk_0',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isd.ForeignKeyDefinition(
          constraintName: 'event_registrations_fk_1',
          columns: ['eventId'],
          referenceTable: 'events',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'user_event_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isd.IndexDefinition(
          indexName: 'event_status_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'eventId',
            ),
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    _isd.TableDefinition(
      name: 'events',
      dartName: 'Event',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'title',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'description',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'type',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'startTime',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isd.ColumnDefinition(
          name: 'endTime',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isd.ColumnDefinition(
          name: 'eventLocation',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'carpoolLocation',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'carpoolTime',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isd.ColumnDefinition(
          name: 'registrationDeadline',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isd.ColumnDefinition(
          name: 'registrationStartDate',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isd.ColumnDefinition(
          name: 'registrationFee',
          columnType: _isd.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isd.ColumnDefinition(
          name: 'requiresApproval',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isd.ColumnDefinition(
          name: 'minimumParticipants',
          columnType: _isd.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isd.ColumnDefinition(
          name: 'maxParticipants',
          columnType: _isd.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '8',
        ),
        _isd.ColumnDefinition(
          name: 'cancellationDeadline',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isd.ColumnDefinition(
          name: 'cancelled',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isd.ColumnDefinition(
          name: 'sectionId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'published',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isd.ForeignKeyDefinition(
          constraintName: 'events_fk_0',
          columns: ['sectionId'],
          referenceTable: 'sections',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'upcoming_events_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'startTime',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isd.IndexDefinition(
          indexName: 'section_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    _isd.TableDefinition(
      name: 'members',
      dartName: 'Member',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'firstName',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'lastName',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'displayName',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'bio',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'email',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'membershipStatus',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'active\'',
        ),
        _isd.ColumnDefinition(
          name: 'emergencyContactName',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'emergencyContactPhone',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'medicalConditions',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'profileImageUrl',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'waiverSignedDate',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: '1970-01-01T00:00:00.000Z',
        ),
        _isd.ColumnDefinition(
          name: 'certifications',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'createdAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'member_id_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isd.IndexDefinition(
          indexName: 'email_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    _isd.TableDefinition(
      name: 'section_memberships',
      dartName: 'SectionMembership',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'memberId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'sectionId',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isd.ColumnDefinition(
          name: 'externalUserId',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'syncedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isd.ColumnDefinition(
          name: 'sourceSystem',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'scopes',
          columnType: _isd.ColumnType.json,
          isNullable: false,
          dartType: 'Set<String>',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isd.ForeignKeyDefinition(
          constraintName: 'section_memberships_fk_0',
          columns: ['memberId'],
          referenceTable: 'members',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _isd.ForeignKeyDefinition(
          constraintName: 'section_memberships_fk_1',
          columns: ['sectionId'],
          referenceTable: 'sections',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isd.ForeignKeyAction.noAction,
          onDelete: _isd.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'user_section_unique_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
              definition: 'memberId',
            ),
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    _isd.TableDefinition(
      name: 'sections',
      dartName: 'Section',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'name',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'description',
          columnType: _isd.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isd.ColumnDefinition(
          name: 'location',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'contactInfo',
          columnType: _isd.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'idx_sections_name',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    _isd.TableDefinition(
      name: 'user_notification_preference',
      dartName: 'UserNotificationPreference',
      schema: 'public',
      module: 'alpine_pod',
      columns: [
        _isd.ColumnDefinition(
          name: 'id',
          columnType: _isd.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isd.ColumnDefinition(
          name: 'allowInApp',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isd.ColumnDefinition(
          name: 'allowEmail',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isd.ColumnDefinition(
          name: 'allowPush',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isd.ColumnDefinition(
          name: 'allowSms',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _isd.ColumnDefinition(
          name: 'newEvents',
          columnType: _isd.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isd.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isd.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isd.IndexDefinition(
          indexName: 'user_type_unique_idx',
          tableSpace: null,
          elements: [
            _isd.IndexElementDefinition(
              type: _isd.IndexElementDefinitionType.column,
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
    ..._iaic.Protocol() is _isd.DatabaseSerializationManager
        ? (_iaic.Protocol() as _isd.DatabaseSerializationManager)
              .getTargetTableDefinitions()
        : [],
    ..._iacc.Protocol() is _isd.DatabaseSerializationManager
        ? (_iacc.Protocol() as _isd.DatabaseSerializationManager)
              .getTargetTableDefinitions()
        : [],
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
    if (t == _isc.getType<_iu57571s.Event?>()) {
      return (data != null ? _iu57571s.Event.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ich6ygep.EventManager?>()) {
      return (data != null ? _ich6ygep.EventManager.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i27uzliw.EventRegistration?>()) {
      return (data != null ? _i27uzliw.EventRegistration.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_inrioji0.EventTemplate?>()) {
      return (data != null ? _inrioji0.EventTemplate.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iv0wxest.FcmToken?>()) {
      return (data != null ? _iv0wxest.FcmToken.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i7zhj6lg.Member?>()) {
      return (data != null ? _i7zhj6lg.Member.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_irt10kca.Notification?>()) {
      return (data != null ? _irt10kca.Notification.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i05lhlgd.NotificationChannel?>()) {
      return (data != null
              ? _i05lhlgd.NotificationChannel.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ikw6watb.NotificationDelivery?>()) {
      return (data != null
              ? _ikw6watb.NotificationDelivery.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_ikosvoxr.NotificationTemplate?>()) {
      return (data != null
              ? _ikosvoxr.NotificationTemplate.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_infnr7i7.RegistrationStatus?>()) {
      return (data != null ? _infnr7i7.RegistrationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ibhmj7lb.Section?>()) {
      return (data != null ? _ibhmj7lb.Section.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ikti0jxs.SectionMembership?>()) {
      return (data != null ? _ikti0jxs.SectionMembership.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ikzqql1t.UserNotification?>()) {
      return (data != null ? _ikzqql1t.UserNotification.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iiu7743a.UserNotificationPreference?>()) {
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
    if (t == _isc.getType<List<_i27uzliw.EventRegistration>?>()) {
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
    if (t == _isc.getType<List<_ich6ygep.EventManager>?>()) {
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
    if (t == List<_i7dvc5iw.Section>) {
      return (data as List)
              .map((e) => deserialize<_i7dvc5iw.Section>(e))
              .toList()
          as T;
    }
    if (t == List<_ionzmxtq.NotificationDelivery>) {
      return (data as List)
              .map((e) => deserialize<_ionzmxtq.NotificationDelivery>(e))
              .toList()
          as T;
    }
    if (t == List<_isc.UuidValue>) {
      return (data as List).map((e) => deserialize<_isc.UuidValue>(e)).toList()
          as T;
    }
    if (t == _isc.getType<List<_isc.UuidValue>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_isc.UuidValue>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_ix4abnwg.Event>) {
      return (data as List).map((e) => deserialize<_ix4abnwg.Event>(e)).toList()
          as T;
    }
    if (t == List<_iygn3jma.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_iygn3jma.EventManager>(e))
              .toList()
          as T;
    }
    if (t == List<_imjavx7o.EventTemplate>) {
      return (data as List)
              .map((e) => deserialize<_imjavx7o.EventTemplate>(e))
              .toList()
          as T;
    }
    if (t == List<_ikapn372.SectionMembership>) {
      return (data as List)
              .map((e) => deserialize<_ikapn372.SectionMembership>(e))
              .toList()
          as T;
    }
    if (t == List<_ixkkgnmw.Member>) {
      return (data as List)
              .map((e) => deserialize<_ixkkgnmw.Member>(e))
              .toList()
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<_i9cwoz9c.UserNotification>) {
      return (data as List)
              .map((e) => deserialize<_i9cwoz9c.UserNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_isud34nx.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_isud34nx.EventRegistration>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
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
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
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
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('alpine_pod', this);
    _iacc.Protocol().registerHostProtocol('alpine_pod', this);
  }

  @override
  _isd.Table? getTableForType(Type t) {
    {
      var protocol = _iaic.Protocol();
      var table = protocol is _isd.DatabaseSerializationManager
          ? (protocol as _isd.DatabaseSerializationManager).getTableForType(t)
          : null;
      if (table != null) {
        return table;
      }
    }
    {
      var protocol = _iacc.Protocol();
      var table = protocol is _isd.DatabaseSerializationManager
          ? (protocol as _isd.DatabaseSerializationManager).getTableForType(t)
          : null;
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
      case _i7zhj6lg.Member:
        return _i7zhj6lg.Member.t;
      case _ibhmj7lb.Section:
        return _ibhmj7lb.Section.t;
      case _ikti0jxs.SectionMembership:
        return _ikti0jxs.SectionMembership.t;
      case _iiu7743a.UserNotificationPreference:
        return _iiu7743a.UserNotificationPreference.t;
    }
    return null;
  }

  @override
  List<_isd.TableDefinition> getTargetTableDefinitions() =>
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
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
