# Reach Traineeship Enrolment Tracker

A browser-based, team-shared tracker for the 11 traineeship enrolment steps.

## Included
- Add and edit learners (name, ID/CID, dates, coordinator, trainer, notes).
- Tick/untick each of the 11 steps and record a completion date and note for every step.
- Progress percentage, learner status, dashboard counts, search and filters.
- Shared cloud storage through Supabase.
- CSV export with `✓` / `✗` in each step column.
- Excel export with green conditional formatting for `✓` and red conditional formatting for `✗`.
- Supabase email/password sign-in. Team members can use one shared team login.

## Important about CSV
CSV is plain text and cannot store cell colours, Excel conditional-formatting rules, or formatting. It will contain the correct `✓` and `✗` values. Use **Export Excel** when you need coloured conditional formatting.

## Setup and deployment (GitHub Pages + Supabase)

### Public-link mode (no sign-in)
This build is configured to open without a login. After running `public-link-access.sql` in Supabase, anyone with access to the deployed app can read, add, edit and delete every learner record. This is intentionally public access and is not appropriate for confidential or personally identifying learner information. The Supabase anon/public key is intended to be visible in browser code; never put a service_role key in `config.js`.

### 1. Create a Supabase project
1. Sign in to Supabase and create a project in a region available to you. Choose the closest available region to your team; Sydney is not required.
2. Open **Project Settings → API**.
3. Copy the **Project URL** and the **anon/public key**.

### 2. Create the database
1. Open **SQL Editor → New query** in Supabase.
2. Open `supabase-schema.sql` from this project.
3. Paste the complete SQL into the editor and click **Run**.

### 3. Enable public-link access
1. Open `public-link-access.sql` in Supabase SQL Editor and run it.
2. This enables anonymous read/write access. Anyone who has the app link can view, add, edit and delete records. Do not use real learner personal information in this mode.

### 4. Add Supabase settings
1. Open `config.js`.
2. Replace `YOUR_SUPABASE_PROJECT_URL` with your Project URL.
3. Replace `YOUR_SUPABASE_ANON_PUBLIC_KEY` with your anon/public key.
4. Save the file. Do not use the `service_role` key.

### 5. Upload to your existing GitHub repository
Your existing repository was `Traineeship-Enrolment-Tracker` under `vnshika55`.
1. Open that repository on GitHub.
2. Choose **Add file → Upload files**.
3. Upload `index.html`, `config.js`, and `supabase-schema.sql` (README can also be uploaded).
4. Commit the changes to the `main` branch.

### 6. Turn on GitHub Pages
1. In the repository, open **Settings → Pages**.
2. Under **Build and deployment**, choose **Deploy from a branch**.
3. Select branch **main** and folder **/(root)**, then Save.
4. Wait for GitHub Pages to publish. The site address will appear on that same Pages screen.
5. Open the site address and sign in.

## Data and security
- Learner data is stored in the Supabase database, not only in the browser, so the same learners are available from the shared app link.
- In public-link mode, anyone who has the website link can view, add, edit or delete records. This is not a secure way to store learner personal information.
- Export a backup regularly using Excel or CSV. Deleting a learner in the app deletes that learner's record from the shared database.

## Using the tracker
1. Click **Add learner** and enter the learner details.
2. Tick a step when it is completed. Add the completion date and any note under that step.
3. The progress bar and status update automatically.
4. Use search or the status filter to find learners.
5. Use **Export Excel** for a formatted workbook or **Export CSV** for a simple data file.
