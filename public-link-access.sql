-- PUBLIC LINK ACCESS for Reach Traineeship Tracker
-- Run this in Supabase SQL Editor after the original table setup.
-- WARNING: Anyone who can reach your Supabase project endpoint can read,
-- add, edit and delete all rows in this table. Do not use for confidential
-- or personally identifying learner information.

GRANT USAGE ON SCHEMA public TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE
ON TABLE public.traineeship_learners TO anon;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'traineeship_learners'
      AND policyname = 'Public link access - all actions'
  ) THEN
    CREATE POLICY "Public link access - all actions"
    ON public.traineeship_learners
    FOR ALL
    TO anon
    USING (true)
    WITH CHECK (true);
  END IF;
END $$;
