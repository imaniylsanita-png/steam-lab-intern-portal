-- PRIVATE: saved roster, tasks, hours, and hashed PIN. Do not upload to GitHub.
-- Run only on the new, empty Turso database. Existing rows with these IDs are preserved.
CREATE TABLE IF NOT EXISTS `interns` (
	`id` text PRIMARY KEY NOT NULL,
	`name` text NOT NULL,
	`role` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `settings` (
	`key` text PRIMARY KEY NOT NULL,
	`value` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `shifts` (
	`id` text PRIMARY KEY NOT NULL,
	`intern` text NOT NULL,
	`start` integer NOT NULL,
	`end` integer,
	`hours` real,
	`approved` integer NOT NULL,
	`note` text NOT NULL,
	`correction` text NOT NULL
);

CREATE TABLE IF NOT EXISTS `tasks` (
	`id` text PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`brief` text NOT NULL,
	`steps` text NOT NULL,
	`done` text NOT NULL,
	`date` text NOT NULL,
	`assignee` text,
	`status` text NOT NULL,
	`note` text NOT NULL
);

BEGIN;
INSERT INTO "interns"("id","name","role") VALUES('53c2f7af-6d3c-4ce4-a826-d4b76ac2e849','Marianne','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('67806aed-8df6-4a6c-ba4c-e43e096812a5','Jerell','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('6dff66b8-9379-4983-b60b-5b5120bfccb3','Aliza','Graphic Designer') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('939b14ab-a72a-44c0-9984-d30160a5f2f6','Jaden','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('9c55e51e-cf17-414b-932c-4e6ea909e089','Adrian','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('b5f5bc99-e989-4cc7-89f3-0165f195c196','Rose','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('cb958074-a0c5-4c85-bd59-9170086685b9','Natalie','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('ce45ec77-41c8-4668-a6b4-062bad156cfd','Isaias','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "interns"("id","name","role") VALUES('f33ffb63-ce39-4c94-ba47-36bb6bc2b9be','King','Lab intern') ON CONFLICT DO NOTHING;
INSERT INTO "tasks"("id","title","brief","steps","done","date","assignee","status","note") VALUES('5e13cde0-ca7b-4d7b-b8ed-4e8fc168a56d','Organize tool bin','Organize and discard any broken tools','Sort tools
Label drawers with cricut stickers
discard any waste or broken tools','','2026-09-30','939b14ab-a72a-44c0-9984-d30160a5f2f6','Not started','') ON CONFLICT DO NOTHING;
INSERT INTO "shifts"("id","intern","start","end","hours","approved","note","correction") VALUES('38320a0f-34d1-45f4-8831-79f57a52f40b','9c55e51e-cf17-414b-932c-4e6ea909e089',1790775954601,NULL,NULL,0,'','') ON CONFLICT DO NOTHING;
INSERT INTO "settings"("key","value") VALUES('pin','b8c3f3d9-b1e5-4b25-a9f2-5b1bef527e9b:dcb26a64aa78b30b392bd3749960114e0ba9f21d5fd1247c8847bfbe2504f2dc') ON CONFLICT DO NOTHING;
COMMIT;
