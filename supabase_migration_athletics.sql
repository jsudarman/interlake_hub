-- ============================================================
-- Saints Station — Athletics Page Migration
-- Run in: Supabase Dashboard → SQL Editor → New Query
--
-- Creates 6 tables covering every editable section on
-- athletics.html, with RLS and seed data pre-loaded.
-- ============================================================

-- ── 1. Tables ───────────────────────────────────────────────

-- Misc page settings (hero, season pill, games note)
create table if not exists public.ath_settings (
  id                serial primary key,
  hero_title        text default 'Saints Athletics',
  hero_subtitle     text default 'Interlake High School Saints — KingCo 3A Conference. Go Saints!',
  season_pill_label text default 'Fall Season 2026 — In Progress',
  games_note        text default 'Schedules are approximate for Fall 2026. For live schedules and results, visit MaxPreps.',
  updated_at        timestamptz default now()
);

-- Upcoming games
create table if not exists public.ath_upcoming_games (
  id         serial primary key,
  sport      text not null,
  game_date  date not null,
  matchup    text not null,
  time_str   text not null default '',
  location   text not null default '',
  home_away  text not null default 'home' check (home_away in ('home','away')),
  sort_order int  default 0
);

-- Athlete of the Week
create table if not exists public.ath_athlete_of_week (
  id          serial primary key,
  name        text not null,
  sport       text not null default '',
  description text not null default '',
  photo_url   text default '',
  week_of     date,
  is_active   boolean default false
);

-- Season metadata (Fall / Winter / Spring)
create table if not exists public.ath_seasons (
  id           serial primary key,
  season_key   text unique not null,
  display_name text not null,
  date_range   text not null default '',
  status       text not null default 'coming' check (status in ('live','coming','past')),
  sort_order   int  default 0
);

-- Coaches by season
create table if not exists public.ath_coaches (
  id         serial primary key,
  season_key text not null,
  sport      text not null,
  coach_name text not null default '',
  sort_order int  default 0
);

-- Athletic Department contacts
create table if not exists public.ath_dept_contacts (
  id         serial primary key,
  role       text not null,
  name       text not null default '',
  phone      text default '',
  email      text default '',
  sort_order int  default 0
);

-- ── 2. Row Level Security ────────────────────────────────────

alter table public.ath_settings        enable row level security;
alter table public.ath_upcoming_games  enable row level security;
alter table public.ath_athlete_of_week enable row level security;
alter table public.ath_seasons         enable row level security;
alter table public.ath_coaches         enable row level security;
alter table public.ath_dept_contacts   enable row level security;

-- Public read
drop policy if exists "ath_settings_read"  on public.ath_settings;
drop policy if exists "ath_games_read"     on public.ath_upcoming_games;
drop policy if exists "ath_aotw_read"      on public.ath_athlete_of_week;
drop policy if exists "ath_seasons_read"   on public.ath_seasons;
drop policy if exists "ath_coaches_read"   on public.ath_coaches;
drop policy if exists "ath_contacts_read"  on public.ath_dept_contacts;

create policy "ath_settings_read"  on public.ath_settings        for select to anon, authenticated using (true);
create policy "ath_games_read"     on public.ath_upcoming_games   for select to anon, authenticated using (true);
create policy "ath_aotw_read"      on public.ath_athlete_of_week  for select to anon, authenticated using (true);
create policy "ath_seasons_read"   on public.ath_seasons          for select to anon, authenticated using (true);
create policy "ath_coaches_read"   on public.ath_coaches          for select to anon, authenticated using (true);
create policy "ath_contacts_read"  on public.ath_dept_contacts    for select to anon, authenticated using (true);

-- Anon write (portal password enforced in JS)
drop policy if exists "ath_settings_write"  on public.ath_settings;
drop policy if exists "ath_games_write"     on public.ath_upcoming_games;
drop policy if exists "ath_aotw_write"      on public.ath_athlete_of_week;
drop policy if exists "ath_seasons_write"   on public.ath_seasons;
drop policy if exists "ath_coaches_write"   on public.ath_coaches;
drop policy if exists "ath_contacts_write"  on public.ath_dept_contacts;

create policy "ath_settings_write"  on public.ath_settings        for all to anon using (true) with check (true);
create policy "ath_games_write"     on public.ath_upcoming_games   for all to anon using (true) with check (true);
create policy "ath_aotw_write"      on public.ath_athlete_of_week  for all to anon using (true) with check (true);
create policy "ath_seasons_write"   on public.ath_seasons          for all to anon using (true) with check (true);
create policy "ath_coaches_write"   on public.ath_coaches          for all to anon using (true) with check (true);
create policy "ath_contacts_write"  on public.ath_dept_contacts    for all to anon using (true) with check (true);

-- Grants
grant all on public.ath_settings          to anon;
grant all on public.ath_upcoming_games    to anon;
grant all on public.ath_athlete_of_week   to anon;
grant all on public.ath_seasons           to anon;
grant all on public.ath_coaches           to anon;
grant all on public.ath_dept_contacts     to anon;
grant usage, select on sequence public.ath_settings_id_seq          to anon;
grant usage, select on sequence public.ath_upcoming_games_id_seq    to anon;
grant usage, select on sequence public.ath_athlete_of_week_id_seq   to anon;
grant usage, select on sequence public.ath_seasons_id_seq           to anon;
grant usage, select on sequence public.ath_coaches_id_seq           to anon;
grant usage, select on sequence public.ath_dept_contacts_id_seq     to anon;

-- ── 3. Seed data ─────────────────────────────────────────────

insert into public.ath_settings (hero_title, hero_subtitle, season_pill_label, games_note)
values (
  'Saints Athletics',
  'Interlake High School Saints — KingCo 3A Conference. Go Saints!',
  'Fall Season 2026 — In Progress',
  'Schedules are approximate for Fall 2026. For live schedules and results, visit MaxPreps.'
);

insert into public.ath_upcoming_games (sport, game_date, matchup, time_str, location, home_away, sort_order) values
('Football',     '2026-09-06', 'Interlake vs. Sammamish', '7:00 PM', 'Sammamish Stadium',     'away', 1),
('Football',     '2026-09-13', 'Interlake vs. Newport',   '7:00 PM', 'Interlake Stadium',      'home', 2),
('Girls Soccer', '2026-09-05', 'Interlake vs. Eastlake',  '5:00 PM', 'Interlake Field',         'home', 3),
('Girls Soccer', '2026-09-11', 'Interlake vs. Bellevue',  '5:00 PM', 'Bellevue HS Field',       'away', 4),
('Volleyball',   '2026-09-09', 'Interlake vs. Juanita',   '6:30 PM', 'Juanita High School',     'away', 5),
('Volleyball',   '2026-09-16', 'Interlake vs. Redmond',   '6:30 PM', 'Interlake Gymnasium',     'home', 6),
('Cross Country','2026-09-12', 'KingCo Invitational',      '9:00 AM', 'Marymoor Park',           'away', 7),
('Boys Tennis',  '2026-09-10', 'Interlake vs. Issaquah',  '3:30 PM', 'Interlake Tennis Courts', 'home', 8);

insert into public.ath_athlete_of_week (name, sport, description, is_active) values
('Coming Soon', 'Saints Athletics',
 'The Athlete of the Week spotlight will be featured here. Check back each week to see a highlighted Saints athlete and their achievements.',
 true);

insert into public.ath_seasons (season_key, display_name, date_range, status, sort_order) values
('fall',   'Fall 2026',      'August — November',   'live',   1),
('winter', 'Winter 2026–27', 'November — February', 'coming', 2),
('spring', 'Spring 2027',    'February — May',      'coming', 3);

insert into public.ath_coaches (season_key, sport, coach_name, sort_order) values
('fall',   'Cross Country — Boys',   'Mitch Carabat',      1),
('fall',   'Cross Country — Girls',  'Kim Alberts-Hild',   2),
('fall',   'Football',               'Chris Wright',       3),
('fall',   'Golf — Boys',            'Scott Marcum',       4),
('fall',   'Soccer — Girls',         'Derek Gentry',       5),
('fall',   'Swim & Dive — Girls',    'Paola Arenas',       6),
('fall',   'Tennis — Boys',          'Matthew Perlman',    7),
('fall',   'Volleyball',             'Mitch Bio',          8),
('fall',   'Water Polo — Boys',      'Steve MacKinnon',    9),
('fall',   'Cheer',                  'Heather McLean',    10),
('fall',   'Dance & Drill',          'Ashleigh Morio',    11),
('winter', 'Basketball — Boys',      'Scott Didrickson',   1),
('winter', 'Basketball — Girls',     'Josh Lovern',        2),
('winter', 'Gymnastics',             'Sara Grandstrand',   3),
('winter', 'Swim & Dive — Boys',     'Paola Arenas',       4),
('winter', 'Wrestling — Boys',       'Dave Unwin',         5),
('winter', 'Wrestling — Girls',      'Dave Unwin',         6),
('spring', 'Badminton — Girls',      'Griffith Johnson',   1),
('spring', 'Baseball',               'Alex Papadopulos',   2),
('spring', 'Golf — Girls',           'Doug Calvert',       3),
('spring', 'Lacrosse — Boys',        'Weston Heuker',      4),
('spring', 'Lacrosse — Girls',       'Samantha Gunnerson', 5),
('spring', 'Soccer — Boys',          'Dan Peterson',       6),
('spring', 'Softball',               'Kevin Cooper',       7),
('spring', 'Tennis — Girls',         'Mathew Perlman',     8),
('spring', 'Track & Field — Boys',   'Dave Unwin',         9),
('spring', 'Track & Field — Girls',  'Mitch Carabat',     10);

insert into public.ath_dept_contacts (role, name, phone, email, sort_order) values
('Athletics & Activities Director', 'Tori Marcum',     '(425) 456-7209', 'marcumt@bsd405.org',               1),
('Athletic & Activities Assistant', 'Mrs. Higgins',    '(425) 456-7365', 'higginsk@bsd405.org',              2),
('Accountant',                      'Esther Tate',     '(425) 456-7327', 'tatee@bsd405.org',                 3),
('Athletic Trainer',                'Miranda Faucett', '',               'mi.faucett@proliancesurgeons.com', 4);
