# STEAM Lab Intern Portal

A Next.js app for Vercel, backed by Turso (SQLite).

## Deploy

Follow START_HERE.md in the download. Upload this folder's contents to your private GitHub repository. package.json belongs at the repository root.

In Vercel, import the repository as Next.js. Connect a Turso database through Storage / Marketplace. The integration supplies TURSO_DATABASE_URL and TURSO_AUTH_TOKEN.

Add two additional, server-only environment variables:
- LAB_ACCESS_CODE: a private shared lab code, at least 12 characters. Give this to interns.
- TEACHER_SETUP_KEY: a separate private setup key, at least 20 characters. Keep this for yourself.

Do not use NEXT_PUBLIC_ prefixes for these variables. Use Production values for the live portal; connect a different database before enabling preview testing with real data.

Run the SQL from the private migration folder on the NEW database to copy the saved roster, task, hours, and hashed PIN. Keep that file out of GitHub. If you want an empty installation instead, run database/schema.sql and use TEACHER_SETUP_KEY to create a teacher PIN.

Redeploy after connecting the database and setting environment variables. Open the deployed URL, enter LAB_ACCESS_CODE, and open Teacher desk with your existing PIN if you imported the saved data.

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

LAB_ACCESS_CODE restricts the roster and other records to people who know the lab code. Teacher controls also require the teacher PIN. Interns select their names, so this is a shared lab/kiosk workflow rather than verified individual accounts. Sessions expire after 12 hours for lab access and 8 hours for teacher access.
