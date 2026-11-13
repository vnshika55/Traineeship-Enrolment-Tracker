-- Reach Traineeship Enrolment Tracker
-- Run this whole script in Supabase Dashboard > SQL Editor > New query.
create table if not exists public.traineeship_learners (
  id uuid primary key default gen_random_uuid(),
  learner_name text not null,
  learner_id text default '',
  qualification text default '',
  occurrence_id text default '',
  employer text default '',
  start_date date,
  end_date date,
  coordinator text default '',
  trainer text default '',
  notes text default '',
  steps jsonb not null default '[]'::jsonb,
  created_by uuid references auth.users(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.traineeship_learners enable row level security;

drop policy if exists "Signed-in team can view learners" on public.traineeship_learners;
drop policy if exists "Signed-in team can add learners" on public.traineeship_learners;
drop policy if exists "Signed-in team can update learners" on public.traineeship_learners;
drop policy if exists "Signed-in team can delete learners" on public.traineeship_learners;

create policy "Signed-in team can view learners"
on public.traineeship_learners for select to authenticated using (true);

create policy "Signed-in team can add learners"
on public.traineeship_learners for insert to authenticated with check (true);

create policy "Signed-in team can update learners"
on public.traineeship_learners for update to authenticated using (true) with check (true);

create policy "Signed-in team can delete learners"
on public.traineeship_learners for delete to authenticated using (true);

-- Optional: enable Realtime if you want changes from other team members
-- to appear automatically without pressing Refresh:
alter publication supabase_realtime add table public.traineeship_learners;
