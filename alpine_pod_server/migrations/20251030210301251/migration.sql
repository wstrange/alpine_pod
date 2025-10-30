BEGIN;

--
-- ACTION ALTER TABLE
--
DROP INDEX "userinfo_idx";
ALTER TABLE "members" DROP COLUMN "userInfoId";
ALTER TABLE "members" DROP COLUMN "role";
ALTER TABLE "members" ALTER COLUMN "displayName" DROP NOT NULL;
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
    "sourceSystem" text,
    "scopes" json NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_section_unique_idx" ON "section_memberships" USING btree ("memberId", "sectionId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "section_memberships"
    ADD CONSTRAINT "section_memberships_fk_0"
    FOREIGN KEY("memberId")
    REFERENCES "members"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "section_memberships"
    ADD CONSTRAINT "section_memberships_fk_1"
    FOREIGN KEY("sectionId")
    REFERENCES "sections"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR alpine_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('alpine_pod', '20251030210301251', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251030210301251', "timestamp" = now();

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
