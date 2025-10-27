BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "members" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "members" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "displayName" text NOT NULL,
    "bio" text,
    "userInfoId" bigint,
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
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "userinfo_idx" ON "members" USING btree ("userInfoId");
CREATE UNIQUE INDEX "email_idx" ON "members" USING btree ("email");


--
-- MIGRATION VERSION FOR alpine_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('alpine_pod', '20251026224145716', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251026224145716', "timestamp" = now();

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
