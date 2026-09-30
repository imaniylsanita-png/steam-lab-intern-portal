# STEAM Lab Intern Portal

A Next.js app for Vercel, backed by Turso (SQLite).

## Deploy

Upload this folder's contents to your GitHub repository. package.json belongs at the repository root.

In Vercel, import the repository as Next.js. Connect a Turso database through Storage / Marketplace. The integration supplies TURSO_DATABASE_URL and TURSO_AUTH_TOKEN.

Add this additional, server-only environment variable:
- TEACHER_SETUP_KEY: a separate private setup key, at least 20 characters. Keep this for yourself.

Do not use NEXT_PUBLIC_ prefixes for these variables. Use Production values for the live portal; connect a different database before enabling preview testing with real data.

Run the SQL from the private migration folder on the NEW database to copy the saved roster, task, hours, and records. Use a fresh teacher PIN when migrating. Keep that file out of GitHub. If you want an empty installation instead, run database/schema.sql and use TEACHER_SETUP_KEY to create a teacher PIN.

Redeploy after connecting the database and setting environment variables. Open the deployed URL, choose your name to use the intern portal. Open Teacher desk to set up or enter your teacher PIN.

## Local development

1. Install Node.js 22 or newer and run npm install.
2. Copy .env.example to .env.local and fill in your own database credentials and codes.
3. Run the schema or private migration on that database.
4. Run npm run dev.

## Updating

Push code changes to GitHub to trigger Vercel deployment. Adding interns, tasks, or hours inside the app writes to Turso and does not require a new deployment.

The SQL migration is a snapshot. Changes made in the old portal after that snapshot are not synchronized. Use one portal for live records after the transfer is verified.

## Printing

Print my tasks opens the browser print dialog with an 80 mm receipt layout. Select the installed receipt-printer driver, use 80 mm paper and 100% scale, and turn off headers and footers. This requires an OS printer driver; it is not a direct ESC/POS connection.

## Access

Interns open the portal and select their name without an access code. Teacher controls require the teacher PIN. Intern name selection uses the shared lab workflow. Teacher sessions expire after 8 hours.
