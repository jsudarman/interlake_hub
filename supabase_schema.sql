-- ============================================================
-- Saints Station — Supabase Schema & Seed Data
-- Run once in: Supabase Dashboard → SQL Editor → New Query
-- ============================================================

-- ── 1. Create tables ────────────────────────────────────────

create table if not exists public.clubs (
  id               text primary key,
  name             text not null,
  category         text not null,
  tagline          text    default '',
  description      text    default '',
  advisor          text    default '',
  advisor_email    text    default '',
  meeting_days     text    default '',
  meeting_time     text    default '',
  meeting_location text    default '',
  requirements     text[]  default '{}',
  how_to_join      text    default '',
  contact_email    text    default '',
  instagram        text    default '',
  members          integer default 0,
  featured         boolean default false,
  officers         jsonb   default '[]',
  next_meeting     jsonb   default null,
  created_at       timestamptz default now(),
  updated_at       timestamptz default now()
);

create table if not exists public.club_updates (
  id         text primary key,
  club_id    text not null references public.clubs(id) on delete cascade,
  date       date not null,
  type       text not null check (type in ('agenda','recap','announcement')),
  title      text not null,
  content    text not null,
  author     text default '',
  created_at timestamptz default now()
);

create index if not exists idx_club_updates_club_id on public.club_updates (club_id);
create index if not exists idx_club_updates_date    on public.club_updates (date desc);

-- ── 2. Auto-update updated_at on clubs ──────────────────────

create or replace function public.set_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_clubs_updated_at on public.clubs;
create trigger trg_clubs_updated_at
  before update on public.clubs
  for each row execute function public.set_updated_at();

-- ── 3. Row Level Security ────────────────────────────────────

alter table public.clubs        enable row level security;
alter table public.club_updates enable row level security;

-- Anyone can read clubs
drop policy if exists "clubs_public_read" on public.clubs;
create policy "clubs_public_read" on public.clubs
  for select to anon, authenticated using (true);

-- Anyone can read updates
drop policy if exists "updates_public_read" on public.club_updates;
create policy "updates_public_read" on public.club_updates
  for select to anon, authenticated using (true);

-- Anon users (Officer Portal) can insert updates
drop policy if exists "updates_anon_insert" on public.club_updates;
create policy "updates_anon_insert" on public.club_updates
  for insert to anon with check (true);

-- ── 4. Seed: clubs ──────────────────────────────────────────
-- ON CONFLICT DO NOTHING: safe to re-run; won't overwrite manual edits.

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'robotics',
  'Robotics Club',
  'engineering',
  'Build, code, compete.',
  'Interlake''s Robotics Club participates in the FIRST Robotics Competition (FRC) and VEX Robotics. Members design, build, program, and operate robots to compete at regional and state-level competitions. Sub-teams cover mechanical engineering, electrical systems, software, and outreach.',
  'Mr. Johnson',
  'rjohnson@bsd405.org',
  'Tuesdays & Thursdays',
  '3:15 PM – 5:00 PM',
  'Room B-214',
  ARRAY[
    'Open to all grades (9–12)',
    'Attend at least 2 intro meetings before joining a sub-team',
    '75% attendance commitment during build season (Jan–Mar)'
  ],
  'Show up to any Tuesday or Thursday meeting in Room B-214. No experience necessary — we welcome all skill levels and backgrounds!',
  'robotics@interlake.example',
  '@interlakerobotics',
  52, true,
  '[{"name":"Ethan Park","role":"President","grade":"12","email":"epark@interlake.example"},{"name":"Priya Nair","role":"VP of Engineering","grade":"11"},{"name":"Marcus Chen","role":"VP of Software","grade":"11"},{"name":"Sofia Romero","role":"Secretary","grade":"10"},{"name":"James Liu","role":"Treasurer","grade":"11"}]',
  '{"date":"2026-09-16","items":["Fall kick-off — welcome new members","Sub-team assignments","Build season timeline overview","FRC game reveal watch party"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'science-olympiad',
  'Science Olympiad',
  'science',
  '23 events. One team.',
  'Science Olympiad is an academic competition team where students compete in 23 STEM events spanning biology, chemistry, physics, earth science, engineering, and more. Members specialize in 2–3 events and collaborate as a team to earn trophies at invitational, regional, and state tournaments.',
  'Ms. Patel',
  'spatel@bsd405.org',
  'Mondays & Wednesdays',
  '3:15 PM – 5:30 PM',
  'Room C-108',
  ARRAY[
    'Tryouts held in September — open to all grades',
    '15-member competitive team + alternates',
    'Each member commits to 2–3 events and regular practice'
  ],
  'Tryouts are in September. Follow our Instagram for announcements. Off-season study sessions are open to anyone interested in joining next year.',
  'sciolympiad@interlake.example',
  '@interlakescio',
  30, true,
  '[{"name":"Aisha Okonkwo","role":"Team Captain","grade":"12","email":"aokonkwo@interlake.example"},{"name":"Ryan Zhang","role":"Co-Captain","grade":"12"},{"name":"Lily Hoffman","role":"Secretary","grade":"11"},{"name":"Dev Kapoor","role":"Treasurer","grade":"10"}]',
  '{"date":"2026-09-08","items":["Tryout info session","Event selection overview","Study group sign-ups","Practice schedule for fall"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'model-un',
  'Model United Nations',
  'diplomatic',
  'Debate global issues. Forge solutions.',
  'Model UN simulates the United Nations, with members acting as delegates representing different countries in committee debates on global topics. Members research international issues, write position papers, practice public speaking, and compete at regional and national MUN conferences.',
  'Mr. Williams',
  'kwilliams@bsd405.org',
  'Thursdays',
  '3:15 PM – 4:30 PM',
  'Room A-112',
  ARRAY[
    'Open to grades 10–12 (9th graders by application)',
    'Complete one practice committee before attending a conference',
    'Write one position paper per conference attended'
  ],
  'Attend any Thursday meeting. New members go through a 3-week intro to parliamentary procedure before joining the main committee.',
  'modelun@interlake.example',
  '@interlakemun',
  38, true,
  '[{"name":"Isabella Ferrara","role":"Secretary-General","grade":"12","email":"iferrara@interlake.example"},{"name":"Nathan Osei","role":"Deputy Secretary-General","grade":"11"},{"name":"Chloe Nakamura","role":"Director of Conferences","grade":"11"},{"name":"Tyler Brooks","role":"Treasurer","grade":"10"}]',
  '{"date":"2026-09-11","items":["Fall committee assignments","Conference calendar for 2026–27","Topic research kick-off","Parliamentary procedure refresher"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'debate',
  'Debate Club',
  'diplomatic',
  'Argue with evidence. Win with logic.',
  'Interlake Debate competes in Lincoln-Douglas (LD) and Public Forum (PF) formats at tournaments across Washington and nationally. Members develop research, argumentation, rebuttal, and public speaking skills. Regular practice rounds prepare competitors for NSDA-sanctioned tournaments.',
  'Ms. Garcia',
  'mgarcia@bsd405.org',
  'Tuesdays & Fridays',
  '3:00 PM – 5:00 PM',
  'Room A-203',
  ARRAY[
    'Open to all grades',
    'New members complete a 2-week orientation',
    'Compete in at least 2 tournaments per season'
  ],
  'Email the club or show up on any Tuesday. No debate experience needed — our coaches train beginners from scratch.',
  'debate@interlake.example',
  '@interlakedebate',
  41, false,
  '[{"name":"Jordan Whitfield","role":"President","grade":"12","email":"jwhitfield@interlake.example"},{"name":"Mei-Ling Tran","role":"Vice President","grade":"11"},{"name":"Caleb Moss","role":"Secretary","grade":"10"},{"name":"Anya Gupta","role":"Treasurer","grade":"11"},{"name":"Finn O''Brien","role":"Tournament Director","grade":"12"}]',
  '{"date":"2026-09-09","items":["Fall topic release — LD & PF","Novice orientation schedule","Tournament registration open","Case-writing workshop"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'coding-club',
  'Coding Club',
  'engineering',
  'Write code. Build things. Ship it.',
  'Coding Club is a collaborative space for students interested in software development, web design, machine learning, and competitive programming. Members work on personal and group projects, prepare for USACO competitions, and participate in hackathons like HackHS and Congressional App Challenge.',
  'Mr. Chen',
  'achen@bsd405.org',
  'Wednesdays',
  '3:15 PM – 5:00 PM',
  'Computer Lab D-110',
  ARRAY[
    'Open to all grades and experience levels',
    'Beginners start in the intro track (HTML/CSS/Python)',
    'Intermediate/advanced members choose project tracks'
  ],
  'Walk in on any Wednesday. Bring your laptop if you have one (loaners available).',
  'codingclub@interlake.example',
  '@interlakecode',
  65, true,
  '[{"name":"Samira Haddad","role":"President","grade":"12","email":"shaddad@interlake.example"},{"name":"Kevin Wu","role":"VP of Projects","grade":"11"},{"name":"Zoe Larsen","role":"VP of Competitions","grade":"11"},{"name":"Diego Reyes","role":"Secretary","grade":"10"},{"name":"Preethi Iyer","role":"Treasurer","grade":"10"}]',
  '{"date":"2026-09-10","items":["Track sign-ups: Intro / Projects / Competitions","USACO fall contest dates","Congressional App Challenge kickoff","Project team formation"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'math-team',
  'Math Team',
  'engineering',
  'Solve harder problems.',
  'Interlake Math Team competes in AMC 10/12, AIME, ARML, and Washington state math competitions. Members study advanced topics including combinatorics, number theory, algebra, and geometry. We''re known for producing USAMO qualifiers and strong AMC scores.',
  'Dr. Kim',
  'hkim@bsd405.org',
  'Mondays',
  '3:15 PM – 4:45 PM',
  'Room B-118',
  ARRAY[
    'Open to all grades',
    'No prerequisite score required — all levels welcome',
    'AMC/MATHCOUNTS experience recommended for varsity track'
  ],
  'Come to any Monday meeting. All skill levels welcome. Varsity and JV tracks available.',
  'mathteam@interlake.example',
  null,
  48, false,
  '[{"name":"Lena Vasquez","role":"Team Lead","grade":"12","email":"lvasquez@interlake.example"},{"name":"Aaron Shi","role":"Vice Lead","grade":"12"},{"name":"Claire Johansson","role":"Secretary","grade":"11"},{"name":"Ravi Menon","role":"Treasurer","grade":"10"}]',
  '{"date":"2026-09-08","items":["Fall practice schedule","AMC 10/12 registration — Nov date","JV/Varsity track placement","Problem set: summer review"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'environmental-club',
  'Environmental Club',
  'science',
  'Act locally. Think globally.',
  'Environmental Club organizes campus sustainability initiatives, local ecosystem restoration projects, and climate advocacy campaigns. Members run the school recycling program, coordinate beach and trail cleanups, and lobby for environmental policy at the district level.',
  'Ms. Torres',
  'ltorres@bsd405.org',
  'Fridays',
  '3:15 PM – 4:15 PM',
  'Room C-205',
  ARRAY[
    'Open to all grades',
    'No prior experience needed',
    'Participate in at least 2 service events per semester'
  ],
  'Join any Friday meeting or sign up through the school activity form.',
  'envclub@interlake.example',
  '@interlakegreen',
  34, false,
  '[{"name":"Mia Johansson","role":"Co-President","grade":"12","email":"mjohansson@interlake.example"},{"name":"Omar Farouk","role":"Co-President","grade":"12"},{"name":"Tessa Williams","role":"Secretary","grade":"11"},{"name":"Ben Castillo","role":"Treasurer","grade":"10"},{"name":"Yuki Tanaka","role":"Outreach Coordinator","grade":"11"}]',
  '{"date":"2026-09-12","items":["Fall project planning","Campus recycling audit","Adopt-a-Trail sign-ups for October","Green Week committee formation"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'drama-club',
  'Drama Club',
  'creative',
  'Take the stage.',
  'Interlake Drama Club produces two full theatrical productions per year — a fall play and a spring musical — plus student-directed one-act shows. Members participate in acting, directing, stagecraft, costuming, lighting, sound, and marketing. No audition required for crew positions.',
  'Ms. Rivera',
  'arivera@bsd405.org',
  'Mondays, Wednesdays & Fridays',
  '3:15 PM – 6:00 PM (production weeks vary)',
  'Black Box Theater, Building A',
  ARRAY[
    'Cast roles require spring/fall auditions',
    'Crew positions are open year-round, no audition',
    'Full commitment expected 3 weeks before show dates'
  ],
  'For crew: show up Monday. For acting: attend auditions (announced on Instagram). Anyone can help with front-of-house, marketing, or set painting.',
  'drama@interlake.example',
  '@interlakedrama',
  70, true,
  '[{"name":"Grace Kim","role":"President","grade":"12","email":"gkim@interlake.example"},{"name":"Elijah Foster","role":"Vice President","grade":"11"},{"name":"Nadia Patel","role":"Stage Manager","grade":"11"},{"name":"Leo Santana","role":"Treasurer","grade":"10"},{"name":"Alicia Chen","role":"Publicity Chair","grade":"10"}]',
  '{"date":"2026-09-08","items":["Fall show announcement — audition dates","Crew interest sign-ups","Rehearsal and production calendar","Costumes & set design kick-off"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'key-club',
  'Key Club',
  'service',
  'Lead. Serve. Build.',
  'Key Club is the largest student-led service organization at Interlake, affiliated with Kiwanis International. Members complete community service hours, lead volunteer events, and develop leadership skills through district and international conventions.',
  'Mr. Park',
  'jpark@bsd405.org',
  'Tuesdays',
  '7:15 AM – 7:50 AM',
  'Room A-101',
  ARRAY[
    'Open to all grades',
    '50 service hours per year recommended for active status',
    '$15 annual dues to Kiwanis International'
  ],
  'Sign up at any Tuesday meeting or through the school activity portal.',
  'keyclub@interlake.example',
  '@interlakekeyclub',
  120, false,
  '[{"name":"Simone Adeyemi","role":"President","grade":"12","email":"sadeyemi@interlake.example"},{"name":"Patrick Nguyen","role":"Vice President","grade":"11"},{"name":"Hannah Berg","role":"Secretary","grade":"11"},{"name":"Marcus Thompson","role":"Treasurer","grade":"10"},{"name":"Jade Morales","role":"Service Chair","grade":"11"}]',
  '{"date":"2026-09-09","items":["New member welcome & dues info","Fall service calendar","Hour-tracking system walkthrough","Volunteer event sign-ups for September"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'literary-magazine',
  'Literary Magazine',
  'creative',
  'Write. Create. Publish.',
  'Interlake''s literary magazine publishes student poetry, prose, visual art, and photography in an annual print edition. The editorial team reviews submissions, designs the layout, and coordinates publication. We also host open mic nights and writing workshops throughout the year.',
  'Mr. Nakamura',
  'tnakamura@bsd405.org',
  'Wednesdays',
  '3:15 PM – 4:30 PM',
  'Room A-205',
  ARRAY[
    'Open to all grades',
    'Writers submit work for consideration; editors apply in spring',
    'Art/photography submissions accepted year-round'
  ],
  'Submit work via our Google Form (linked on Instagram) or attend any Wednesday meeting.',
  'litmagzine@interlake.example',
  '@interlakelitmag',
  28, false,
  '[{"name":"Vivian Lu","role":"Editor-in-Chief","grade":"12","email":"vlu@interlake.example"},{"name":"Sam Porter","role":"Managing Editor","grade":"11"},{"name":"Aria Singh","role":"Art Director","grade":"11"},{"name":"Cole Martinson","role":"Treasurer","grade":"10"}]',
  '{"date":"2026-09-10","items":["Fall submissions open — theme reveal","New editor onboarding","Open mic night planning for October","Layout software training"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'asian-student-union',
  'Asian Student Union',
  'cultural',
  'Community. Culture. Advocacy.',
  'ASU celebrates the diversity of Asian and Pacific Islander cultures at Interlake while fostering community and advocacy. We host cultural events, heritage nights, community speakers, and work with administration on AAPI-related equity initiatives.',
  'Ms. Lee',
  'jlee@bsd405.org',
  'Thursdays',
  '3:15 PM – 4:30 PM',
  'Room B-209',
  ARRAY[
    'Open to all students — any background welcome',
    'No requirements, just enthusiasm!'
  ],
  'Come to any Thursday meeting. Everyone is welcome regardless of background.',
  'asu@interlake.example',
  '@interlakeasu',
  88, false,
  '[{"name":"Michelle Yeh","role":"Co-President","grade":"12","email":"myeh@interlake.example"},{"name":"David Hong","role":"Co-President","grade":"12"},{"name":"Priya Sharma","role":"Secretary","grade":"11"},{"name":"Jason Lim","role":"Treasurer","grade":"10"},{"name":"Angela Park","role":"Events Chair","grade":"11"}]',
  '{"date":"2026-09-11","items":["Fall event calendar brainstorm","Membership drive planning","Guest speaker series kick-off","Committee assignments"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'nhs',
  'National Honor Society',
  'leadership',
  'Scholarship. Service. Leadership. Character.',
  'NHS recognizes students who demonstrate outstanding achievement in academics, service, leadership, and character. Members coordinate tutoring programs, lead service initiatives, and represent Interlake at state NHS conferences.',
  'Ms. Johnson',
  'sjohnson@bsd405.org',
  'First & Third Tuesdays',
  '3:15 PM – 4:00 PM',
  'Room A-118',
  ARRAY[
    'Minimum 3.5 unweighted GPA',
    'Application and faculty review required (Grades 10–12)',
    '20 service hours per semester to maintain membership'
  ],
  'Applications open in October for juniors/seniors and in spring for sophomores. Check with Ms. Johnson for the current cycle.',
  'nhs@interlake.example',
  null,
  95, false,
  '[{"name":"Rachel Kim","role":"President","grade":"12","email":"rkim@interlake.example"},{"name":"Tyler Evans","role":"Vice President","grade":"11"},{"name":"Sophia Delgado","role":"Secretary","grade":"11"},{"name":"Andrew Cho","role":"Treasurer","grade":"10"}]',
  '{"date":"2026-09-16","items":["New member induction planning","Fall service project sign-ups","Hour-tracking reminder","October application deadline announcement"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'film-club',
  'Film Club',
  'creative',
  'Lights. Camera. Create.',
  'Film Club is a production and appreciation collective where students write, direct, shoot, and edit short films. We host an annual Film Festival and submit to regional student film competitions. Members also analyze cinema history and critique contemporary films.',
  'Mr. Okafor',
  'cokafor@bsd405.org',
  'Fridays',
  '3:15 PM – 5:00 PM',
  'Media Center',
  ARRAY[
    'Open to all grades',
    'Beginners welcome — equipment training provided',
    'Each member contributes to at least one film project per semester'
  ],
  'Come Friday to the Media Center. Cameras, tripods, and editing software are all provided.',
  'filmclub@interlake.example',
  '@interlakefilm',
  22, false,
  '[{"name":"Olivia Strand","role":"Chair","grade":"12","email":"ostrand@interlake.example"},{"name":"Noah Pham","role":"Vice Chair","grade":"11"},{"name":"Emma Kowalski","role":"Secretary","grade":"10"},{"name":"Lucas Rivera","role":"Equipment Manager","grade":"11"}]',
  '{"date":"2026-09-12","items":["Fall project pitches","Equipment training for new members","Film analysis: semester screening list","Festival planning timeline"]}'
) on conflict (id) do nothing;

insert into public.clubs
  (id, name, category, tagline, description, advisor, advisor_email,
   meeting_days, meeting_time, meeting_location, requirements,
   how_to_join, contact_email, instagram, members, featured,
   officers, next_meeting)
values (
  'peer-tutoring',
  'Peer Tutoring Program',
  'leadership',
  'Learn better together.',
  'Peer Tutoring connects students who want academic help with trained student tutors. We cover all core subjects: math (through AP Calc BC), science (bio, chem, physics), English, history, and foreign languages. All tutors complete a 4-hour training program.',
  'Ms. Huang',
  'yhuang@bsd405.org',
  'Mon–Thu (tutoring hours)',
  '3:15 PM – 4:30 PM',
  'Library, Room 2',
  ARRAY[
    'Tutors: 3.7+ GPA in subject, teacher recommendation',
    'Students seeking help: open to all, no requirements',
    'Tutors earn NHS-eligible service hours'
  ],
  'Students needing help: sign up at the library or online. Prospective tutors: apply via the Google Form linked on our Instagram.',
  'peertutoring@interlake.example',
  null,
  60, false,
  '[{"name":"Daniel Osei","role":"Program Coordinator","grade":"12","email":"dosei@interlake.example"},{"name":"Kavya Reddy","role":"Deputy Coordinator","grade":"11"},{"name":"Max Lindberg","role":"Secretary","grade":"11"},{"name":"Jasmine Lee","role":"Treasurer","grade":"10"},{"name":"Ethan Cross","role":"Tutor Training Lead","grade":"12"}]',
  '{"date":"2026-09-09","items":["Tutor applications open — deadline Sep 20","Student sign-up form goes live","Fall subject coverage overview","Training session scheduled for Sep 27"]}'
) on conflict (id) do nothing;

-- ── 5. Seed: club_updates ───────────────────────────────────
-- Existing updates from the original static data, preserved for continuity.

insert into public.club_updates (id, club_id, date, type, title, content, author) values
  ('r-u1', 'robotics', '2026-05-10', 'recap',
   'State Championship — 3rd Place Finish!',
   'We placed 3rd at the Washington State Robotics Championship this weekend! Huge congratulations to every member for an incredible build season. Special recognition to our programming team for flawless autonomous routines and to our drive team for clutch performances under pressure. We couldn''t be prouder.',
   'Club President'),

  ('r-u2', 'robotics', '2026-05-06', 'agenda',
   'Meeting Agenda — May 6',
   '1. Post-season debrief & lessons learned
2. Robot maintenance and off-season storage
3. Officer nominations for 2026–27
4. Summer workshop planning
5. Open Q&A for incoming members',
   'VP of Operations'),

  ('so-u1', 'science-olympiad', '2026-05-08', 'recap',
   'State Invitational Results',
   'Interlake placed 5th overall at the WASO State Invitational! Top individual event finishes: 1st in Disease Detectives, 2nd in Forensics, 3rd in Circuit Lab. Amazing work from everyone — we''re on track for a strong State Championship run.',
   'Team Captain'),

  ('mun-u1', 'model-un', '2026-05-09', 'recap',
   'WMUN Conference Recap',
   'Congratulations to our delegates at the Washington Model UN Conference! We earned Best Delegate in the Human Rights Committee and Outstanding Delegate in SPECPOL. 12 members attended — our largest delegation yet.',
   'Secretary-General'),

  ('deb-u1', 'debate', '2026-05-07', 'recap',
   'Spring Invitational Results',
   'Our PF team went 5-1 at the Spring Classic and advanced to finals. Three LD debaters cleared to elimination rounds. Fantastic weekend — lots of hardware coming back to Interlake!',
   'Club Coach'),

  ('cc-u1', 'coding-club', '2026-05-11', 'recap',
   'HackHS 2026 — Our Teams Shine',
   'Two Interlake teams competed at HackHS 2026. Team "Byte Brigade" won Best Education App for their AI tutoring assistant. Team "The Stack" placed 2nd in Social Impact. Proud of everyone who participated!',
   'Club Officers'),

  ('cc-u2', 'coding-club', '2026-05-04', 'agenda',
   'Meeting Notes — May 4',
   '1. HackHS debrief and project showcases
2. USACO June contest prep — register by May 25
3. Congressional App Challenge kickoff
4. Intro track: JavaScript DOM manipulation
5. Advanced track: ML model deployment with Flask',
   'President'),

  ('mt-u1', 'math-team', '2026-05-01', 'recap',
   'State Math Championship — 2nd Place',
   'Interlake placed 2nd at the Washington State High School Math Championship! Two members earned individual top-10 finishes. Our relay team set a new school record. Incredible performance by all.',
   'Team Lead'),

  ('env-u1', 'environmental-club', '2026-05-09', 'recap',
   'Earth Month Cleanup — 400 lbs Collected',
   'Our Earth Month cleanup at Mercer Slough was a huge success! 47 volunteers collected over 400 lbs of litter. We also planted 60 native plants along the wetland trail. Thank you to everyone who came out.',
   'Club Co-President'),

  ('dr-u1', 'drama-club', '2026-05-12', 'recap',
   '''Into the Woods'' Opens Tonight',
   '''Into the Woods'' runs May 12–14. Tickets available at the door or online. This has been an incredible production — months of hard work from our 45-person cast and crew. Come support your fellow students!',
   'Director'),

  ('kc-u1', 'key-club', '2026-05-08', 'recap',
   'Food Bank Drive — 1,200 Items Donated',
   'Our spring food bank drive collected 1,200+ non-perishable items for the Bellevue Food Bank. This is a new Interlake Key Club record! Thank you to every student, teacher, and family who donated.',
   'Club President'),

  ('lm-u1', 'literary-magazine', '2026-05-11', 'recap',
   'Spring Edition Now Available!',
   'The 2026 Spring Edition of ''Echoes'' is here! Pick up a copy in the main office or library. This issue features 84 pages of poetry, fiction, essays, and art from 32 student contributors. Incredible work this year.',
   'Editor-in-Chief'),

  ('asu-u1', 'asian-student-union', '2026-05-02', 'recap',
   'AAPI Heritage Month Kickoff Event',
   'Over 200 students attended our AAPI Heritage Month kickoff! We had cultural performances, traditional food, and a keynote from local AAPI community leader Dr. Yuen. One of our best events yet.',
   'Co-President'),

  ('nhs-u1', 'nhs', '2026-05-07', 'recap',
   'Spring Induction Ceremony',
   'Welcome to our 28 newest NHS members inducted at the Spring Ceremony! Congratulations to all inductees and their families. We look forward to your leadership and service contributions next year.',
   'NHS President'),

  ('fc-u1', 'film-club', '2026-05-09', 'recap',
   'Spring Film Festival — Full House!',
   'Our Spring Film Festival screened 8 student films to a packed audience. Best Film went to ''The Last Stop'' by junior director Maya L. Best Documentary went to ''Roots'' by the sophomore team. Congrats to all filmmakers!',
   'Club Chair'),

  ('pt-u1', 'peer-tutoring', '2026-05-10', 'recap',
   'AP Exam Prep Blitz — 200 Sessions Held',
   'In the two weeks before AP exams, our tutors held 200+ sessions helping students prep for 14 different AP subjects. Huge thanks to our 45 tutors who gave their time. Look for our AP results survey in June!',
   'Program Coordinator')

on conflict (id) do nothing;
