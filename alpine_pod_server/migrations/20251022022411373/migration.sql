BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "event_documents" (
    "id" bigserial PRIMARY KEY,
    "eventId" bigint,
    "url" text NOT NULL,
    "type" text,
    "name" text,
    "uploadedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "event_document_idx" ON "event_documents" USING btree ("eventId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "event_registrations" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "eventId" bigint NOT NULL,
    "registrationStatus" bigint NOT NULL,
    "registrationDate" timestamp without time zone NOT NULL,
    "carPoolPreference" text,
    "additionalGuests" bigint NOT NULL DEFAULT 0,
    "waiverAccepted" boolean NOT NULL,
    "participantNotes" text,
    "waitlistPosition" bigint,
    "waitlistedAt" timestamp without time zone,
    "paymentStatus" text NOT NULL DEFAULT 'N/A'::text,
    "paymentAmount" double precision NOT NULL DEFAULT 0.0,
    "modifiedAt" timestamp without time zone NOT NULL,
    "noShow" boolean NOT NULL DEFAULT false
);

-- Indexes
CREATE UNIQUE INDEX "user_event_idx" ON "event_registrations" USING btree ("userId", "eventId");
CREATE INDEX "event_status_idx" ON "event_registrations" USING btree ("eventId", "registrationStatus");
CREATE INDEX "waitlist_idx" ON "event_registrations" USING btree ("eventId", "waitlistPosition");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "event_trip_leaders" (
    "id" bigserial PRIMARY KEY,
    "eventId" bigint,
    "userId" bigint,
    "assignedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "event_leader_idx" ON "event_trip_leaders" USING btree ("eventId", "userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "events" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "type" bigint NOT NULL,
    "startTime" timestamp without time zone NOT NULL,
    "endTime" timestamp without time zone NOT NULL,
    "location" text,
    "gpsLatitude" double precision,
    "gpsLongitude" double precision,
    "mapLink" text,
    "carPoolingTime" timestamp without time zone,
    "carPoolingPlace" text,
    "carPoolingDriveOrRide" text,
    "maxParticipants" bigint,
    "public" boolean NOT NULL,
    "difficulty" text,
    "requiredEquipment" text,
    "prerequisites" text,
    "recurring" text,
    "registrationDeadline" timestamp without time zone,
    "registrationStartDate" timestamp without time zone,
    "waitlistEnabled" boolean NOT NULL,
    "registrationFee" double precision,
    "currentRegistrationCount" bigint,
    "requiresApproval" boolean NOT NULL,
    "waiverRequired" boolean NOT NULL,
    "minimumParticipants" bigint,
    "cancellationDeadline" timestamp without time zone,
    "registrationNotes" text,
    "sectionId" bigint,
    "documentsJson" text
);

-- Indexes
CREATE INDEX "upcoming_events_idx" ON "events" USING btree ("startTime");
CREATE INDEX "public_events_idx" ON "events" USING btree ("public", "startTime");
CREATE INDEX "section_idx" ON "events" USING btree ("sectionId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notifications" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "message" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "read" boolean NOT NULL,
    "recipientId" bigint,
    "attachments" text,
    "relatedEventId" bigint
);

-- Indexes
CREATE INDEX "recipient_idx" ON "notifications" USING btree ("recipientId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "section_memberships" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint,
    "sectionId" bigint,
    "externalUserId" text,
    "syncedAt" timestamp without time zone,
    "sourceSystem" text
);

-- Indexes
CREATE UNIQUE INDEX "user_section_unique_idx" ON "section_memberships" USING btree ("userId", "sectionId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sections" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "location" text,
    "contactInfo" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "phoneNumber" text NOT NULL,
    "membershipStatus" text NOT NULL,
    "profilePictureUrl" text,
    "emergencyContactName" text NOT NULL,
    "emergencyContactPhone" text NOT NULL,
    "medicalConditions" text,
    "certifications" text,
    "role" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");


--
-- MIGRATION VERSION FOR alpine_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('alpine_pod', '20251022022411373', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251022022411373', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
