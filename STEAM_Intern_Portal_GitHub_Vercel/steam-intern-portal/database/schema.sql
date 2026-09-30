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
