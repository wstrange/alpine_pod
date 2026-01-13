BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "event_registrations" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "event_registrations" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "eventId" bigint NOT NULL,
    "registrationStatus" text NOT NULL,
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
-- ACTION DROP TABLE
--
DROP TABLE "events" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "events" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "description" text NOT NULL,
    "type" text NOT NULL,
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
    "sectionId" bigint NOT NULL,
    "documentsJson" text,
    "published" boolean NOT NULL DEFAULT false
);

-- Indexes
CREATE INDEX "upcoming_events_idx" ON "events" USING btree ("startTime");
CREATE INDEX "section_idx" ON "events" USING btree ("sectionId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_session_log" ADD COLUMN "userId" text;

--
-- MIGRATION VERSION FOR alpine_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('alpine_pod', '20260113230933298', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260113230933298', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();


COMMIT;
