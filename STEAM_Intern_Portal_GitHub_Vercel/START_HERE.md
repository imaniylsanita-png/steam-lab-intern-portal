# Move your STEAM lab portal to GitHub and Vercel

This package contains:
- steam-intern-portal/: the app source to upload to GitHub.
- private-migration/restore.sql: your saved records and hashed teacher PIN. Keep this OUT of GitHub.

Your existing hosted portal remains available. This download is ready for deployment, but it has not been deployed to your GitHub or Vercel accounts.

## 1. Create the GitHub repository

1. Unzip this download.
2. Go to https://github.com/new and sign in.
3. Name the repository steam-intern-portal and choose Private.
4. Select Add a README file, then Create repository.
5. Open Add file > Upload files.
6. Open the steam-intern-portal folder on your computer. Drag its CONTENTS into the upload area, including the app, components, database, lib and public folders and the files beside them. Do not upload the ZIP or private-migration folder.
7. Click Commit changes.
8. Check that package.json is directly visible in the repository root, alongside app/. If it is inside an extra folder, fix that structure before importing to Vercel.

On a Mac, Command + Shift + Period shows hidden files if you also want to include .gitignore and .env.example. These example files contain no actual passwords. Never upload a filled-in .env.local.

## 2. Create the Vercel project

1. Go to https://vercel.com/new and sign in with GitHub.
2. Authorize access to the new private repository and click Import next to steam-intern-portal.
3. Framework Preset: Next.js. Root Directory: ./ (the repository root).
4. Keep the default build command (npm run build), install command and output directory.
5. Add these environment variables for Production:
   - LAB_ACCESS_CODE: choose a private code with at least 12 characters; interns will use it.
   - TEACHER_SETUP_KEY: choose a separate private key with at least 20 characters; keep it to yourself.
6. Click Deploy. The build can succeed before the database is attached, but do not enter real records yet.

## 3. Attach the database

1. In the Vercel project, open Storage, or use Marketplace.
2. Select Turso (Turso Cloud / Serverless SQLite).
3. Create a NEW database named steam-intern-lab and connect it to this project for Production. Review the plan shown by the provider before selecting it.
4. In Settings > Environment Variables, confirm the integration added TURSO_DATABASE_URL and TURSO_AUTH_TOKEN.
5. These are private server credentials. Do not put them in GitHub or send their values in chat.

Turso marketplace integration: https://vercel.com/marketplace/tursocloud/database

## 4. Copy your saved data

1. Open the new database's dashboard from the Vercel storage resource.
2. Open its SQL editor or SQL console.
3. Open private-migration/restore.sql in a plain-text editor on your computer.
4. Copy the whole file into the NEW database's SQL editor and run it.
5. Confirm the tables interns, tasks, shifts and settings exist.
6. Verify these snapshot counts: 9 interns, 1 task and 1 shift. The saved PIN hash is also restored; active login sessions are intentionally not transferred.

Only import this snapshot into the new database. It preserves record IDs, so repeating the exact import does not duplicate those records. It does not merge later edits from your old portal.

If the provider does not offer a SQL editor in your account, tell me what options you see; the same SQL can also be imported with the Turso CLI. Do not paste the private file into GitHub.

## 5. Redeploy and verify

1. In Vercel, open Deployments, open the most recent deployment's menu and choose Redeploy. This applies the newly connected database variables.
2. Open the successful production deployment's URL.
3. Enter the LAB_ACCESS_CODE you chose in step 2.
4. Open Teacher desk and enter your EXISTING teacher PIN.
5. Confirm the roster and task are present; confirm hours in Time review.
6. Add a real task, reload the page, and confirm it remains saved.
7. Test Print my tasks with your installed receipt printer (80 mm paper; no print headers/footers).
8. After verification, use the Vercel portal for live entries so the two databases do not diverge.

If you see Set up your desk instead of Welcome back after importing, verify you ran the full restore.sql on the same database connected in Vercel. If you intentionally chose an empty database, run steam-intern-portal/database/schema.sql, then create a new PIN using TEACHER_SETUP_KEY.

## After setup

- Code updates: commit/push to GitHub; Vercel deploys the update.
- New tasks, interns and hour records: add them through the app; no deployment is needed.
- The public Vercel URL shows an access-code screen. Student records remain behind LAB_ACCESS_CODE, and teacher actions also require your PIN.

References:
https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository
https://vercel.com/docs/git/vercel-for-github
https://vercel.com/marketplace/tursocloud/database
