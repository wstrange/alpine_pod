BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "events" ADD COLUMN "published" boolean NOT NULL DEFAULT false;

--
-- MIGRATION VERSION FOR alpine_pod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('alpine_pod', '20251104014916587', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251104014916587', "timestamp" = now();

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
