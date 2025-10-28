BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "members" DROP COLUMN "password";
ALTER TABLE "members" ALTER COLUMN "membershipStatus" SET DEFAULT 'active'::text;
ALTER TABLE "members" ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "members" ALTER COLUMN "updatedAt" SET DEFAULT CURRENT_TIMESTAMP;
--
-- ACTION DROP TABLE
--
DROP TABLE "section_memberships" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "section_memberships" (
    "id" bigserial PRIMARY KEY,
    "memberId" bigint NOT NULL,
    "sectionId" bigint NOT NULL,
    "externalUserId" text,
    "syncedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sourceSystem" text
);

-- Indexes
CREATE UNIQUE INDEX "user_section_unique_idx" ON "section_memberships" USING btree ("memberId", "sectionId");


--
-- MIGRATION VERSION FOR alpine_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('alpine_pod', '20251028223212107', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251028223212107', "timestamp" = now();

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
