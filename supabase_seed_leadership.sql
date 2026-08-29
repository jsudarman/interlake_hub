-- ============================================================
-- Saints Station — Leadership Seed Data
-- Run AFTER supabase_migration_leadership.sql
-- Clears existing data and inserts current page content.
-- ============================================================

-- Clear existing data
DELETE FROM public.asb_announcements;
DELETE FROM public.asb_events;
DELETE FROM public.asb_officers;
DELETE FROM public.asb_settings;
DELETE FROM public.class_announcements;
DELETE FROM public.class_fundraisers;
DELETE FROM public.class_officers;
DELETE FROM public.class_settings;

-- ── ASB Settings ─────────────────────────────────────────────
INSERT INTO public.asb_settings (id, advisor_name, advisor_email, instagram_url, minutes_url, contact_general, contact_president, contact_events)
VALUES (
  1,
  'Mr. VanDevanter',
  'mvandevanter@bsd405.org',
  'https://www.instagram.com/interlakeasb/',
  'https://docs.google.com/document/d/1w1JzZxjG5OY0Qg-T5gmEMZqiw1ZWYQ1a/edit?rtpof=true&sd=true&tab=t.0',
  'asb@interlake.edu',
  'asbpresident@interlake.edu',
  'asbevents@interlake.edu'
);

-- ── ASB Officers ─────────────────────────────────────────────
INSERT INTO public.asb_officers (name, role, photo_url, sort_order) VALUES
  ('Name', 'President',                 '', 1),
  ('Name', 'Exec Vice President',       '', 2),
  ('Name', 'VP of Communications',      '', 3),
  ('Name', 'VP of Community Relations', '', 4),
  ('Name', 'Secretary',                 '', 5),
  ('Name', 'Treasurer',                 '', 6),
  ('Name', 'Historian',                 '', 7);

-- ── ASB Events ───────────────────────────────────────────────
INSERT INTO public.asb_events (event_month, event_day, event_name, bullets, sort_order) VALUES
  ('SEP', '2', 'First Day of School',
   '["Arrive by 7:45 AM — advisory period begins at 8:00 AM","Pick up your schedule in the main office if you haven''t already","All students report to advisory first period"]',
   1),
  ('SEP', '4', 'Welcoming Back Assembly + Crossroads Cup',
   '["Held in the main gym — report directly after advisory","Grade colors: Seniors — blue, Juniors — gold, Sophomores — white, Freshmen — green","Every student competing counts toward your class score","Doors close at the bell — arrive on time"]',
   2),
  ('SEP', '11', 'Freshman Tailgate',
   '["A welcome event exclusively for the Class of 2030","Held in the school courtyard after school","Food, games, and a chance to meet your class officers","No sign-up needed — all freshmen welcome"]',
   3),
  ('SEP', '25', 'Homecoming Assembly & Football Game',
   '["Assembly in the main gym during school hours","Homecoming court presentation and grade competitions","Football game at Memorial Stadium — check athletics page for kickoff time","Wear your Interlake colors to the game"]',
   4),
  ('SEP', '26', 'Homecoming Dance',
   '["Formal attire required","ASB card required for entry — purchase through the school store","Non-Interlake guests must have a guest pass submitted by September 19th","Tickets: $15 pre-sale, $20 at the door"]',
   5);

-- ── ASB Announcements ────────────────────────────────────────
-- Homecoming section
INSERT INTO public.asb_announcements (section_header, main_text, sub_bullets, sort_order) VALUES
  ('Homecoming', 'Homecoming is September 25–26!',
   '["Assembly and football game: Thursday, September 25th","Homecoming dance: Friday, September 26th","Biggest week of the school year — don''t miss it"]',
   1),
  ('Homecoming', 'Homecoming theme announcement coming soon.',
   '["Follow @InterlakeASB on Instagram to be the first to know"]',
   2),
  ('Homecoming', 'Dance tickets go on sale soon through the school store.',
   '["Pre-sale: $15","At the door: $20","ASB card required for entry"]',
   3),
  ('Homecoming', 'Homecoming court nominations open September 5th.',
   '["Nomination forms available in the main office","Nominate a peer who represents Interlake''s values"]',
   4),
  ('Homecoming', 'Guest passes are required for non-Interlake students attending the dance.',
   '["Submit forms to the main office by September 19th — no exceptions"]',
   5);

-- Freshman Class Office Elections section
INSERT INTO public.asb_announcements (section_header, main_text, sub_bullets, sort_order) VALUES
  ('Freshman Class Office Elections', 'Freshman class officer elections are happening this September!',
   '["All freshmen eligible to run for: President, Vice President, Secretary, or Treasurer"]',
   6),
  ('Freshman Class Office Elections', 'Want to run? Pick up a candidate packet from the main office.',
   '["Deadline to submit: September 10th — don''t wait"]',
   7),
  ('Freshman Class Office Elections', 'Candidate speeches will be held September 18th during advisory.',
   '["Held in the main gym — all freshmen encouraged to attend"]',
   8),
  ('Freshman Class Office Elections', 'Voting is September 19th.',
   '["Voting link sent to your school email — check your inbox"]',
   9),
  ('Freshman Class Office Elections', 'Results announced September 22nd.',
   '["Congratulations in advance to Interlake''s first-ever Class of 2030 officers!"]',
   10);

-- Assemblies section
INSERT INTO public.asb_announcements (section_header, main_text, sub_bullets, sort_order) VALUES
  ('Assemblies', 'Welcoming Back Assembly — September 4th.',
   '["Crossroads Cup kicks off — each grade competes for the trophy","Seniors — blue, Juniors — gold, Sophomores — white, Freshmen — green"]',
   11),
  ('Assemblies', 'Homecoming Assembly — September 25th.',
   '["Cheer on your class during competitions","Watch the Homecoming court presentation","Get hyped for the football game that night"]',
   12),
  ('Assemblies', 'All assemblies are held in the main gym.',
   '["Arrive on time — doors close at the bell","Late entry is not permitted once the assembly begins"]',
   13);

-- ── Class Settings ───────────────────────────────────────────
INSERT INTO public.class_settings (class_year, grade_label, instagram_url, tiktok_url) VALUES
  ('2027', 'Seniors',    'https://www.instagram.com/',                    'https://www.tiktok.com'),
  ('2028', 'Juniors',    'https://www.instagram.com/interlakeclassof2028/', 'https://www.tiktok.com'),
  ('2029', 'Sophomores', 'https://www.instagram.com/',                    ''),
  ('2030', 'Freshmen',   'https://www.instagram.com/',                    '');

-- ── Class Officers ───────────────────────────────────────────
-- Class of 2027 — Seniors
INSERT INTO public.class_officers (class_year, name, role, photo_url, sort_order) VALUES
  ('2027', 'Emily Zhang',   'President',     '', 1),
  ('2027', 'Marcus Rivera', 'Vice President', '', 2),
  ('2027', 'Sofia Patel',   'Secretary',     '', 3),
  ('2027', 'Noah Kim',      'Treasurer',     '', 4),
  ('2027', 'Ava Johnson',   'Events Chair',  '', 5);

-- Class of 2028 — Juniors
INSERT INTO public.class_officers (class_year, name, role, photo_url, sort_order) VALUES
  ('2028', 'Jordan Lee',      'President',     '', 1),
  ('2028', 'Isabella Torres', 'Vice President', '', 2),
  ('2028', 'Ryan Nakamura',   'Secretary',     '', 3),
  ('2028', 'Priya Menon',     'Treasurer',     '', 4),
  ('2028', 'Caleb Thompson',  'Events Chair',  '', 5);

-- Class of 2029 — Sophomores
INSERT INTO public.class_officers (class_year, name, role, photo_url, sort_order) VALUES
  ('2029', 'Mia Chen',      'President',     '', 1),
  ('2029', 'Ethan Brooks',  'Vice President', '', 2),
  ('2029', 'Lily Osei',     'Secretary',     '', 3),
  ('2029', 'Daniel Park',   'Treasurer',     '', 4),
  ('2029', 'Grace Hoffman', 'Events Chair',  '', 5);

-- Class of 2030 — Freshmen
INSERT INTO public.class_officers (class_year, name, role, photo_url, sort_order) VALUES
  ('2030', 'Aiden Walsh',  'President',     '', 1),
  ('2030', 'Chloe Singh',  'Vice President', '', 2),
  ('2030', 'Mason Reed',   'Secretary',     '', 3),
  ('2030', 'Zoe Martinez', 'Treasurer',     '', 4),
  ('2030', 'Liam Okoro',   'Events Chair',  '', 5);

-- ── Class Announcements ──────────────────────────────────────
-- Class of 2027
INSERT INTO public.class_announcements (class_year, section_header, main_text, sub_bullets, sort_order) VALUES
  ('2027', 'Senior Year Events', 'Prom venue confirmed — save the date for May 30th',
   '["Tickets go on sale in April","Venue: The Westin Bellevue Ballroom","Dress code details coming soon"]', 1),
  ('2027', 'Senior Year Events', 'Senior sunrise happening September 5th',
   '["Meet at the football field at 5:45 AM","Bring blankets and warm clothes","Breakfast provided by class office"]', 2),
  ('2027', 'Senior Year Events', 'Graduation ceremony details finalized',
   '["Ceremony: June 13th at Meydenbauer Center","Rehearsal required — June 12th","Cap and gown orders due by March 1st"]', 3),
  ('2027', 'Senior Memories', 'Senior memories photo campaign now live on Instagram',
   '["Tag @interlakeclass2027 with your senior moments","Best photos featured in the yearbook spread","Submission deadline: May 1st"]', 4),
  ('2027', 'Senior Memories', 'Senior class motto vote closing soon',
   '["Vote on Instagram story poll","Top 3 options chosen by student council","Winner announced at the April assembly"]', 5);

-- Class of 2028
INSERT INTO public.class_announcements (class_year, section_header, main_text, sub_bullets, sort_order) VALUES
  ('2028', 'Junior Year Updates', 'Junior prom venue research underway for spring 2027',
   '["Officer committee formed to evaluate options","Budget discussion happening at next meeting","Input from the class welcome — DM us on Instagram"]', 1),
  ('2028', 'Junior Year Updates', 'Class-wide spirit week participation organized',
   '["Theme days coordinated with ASB","Class spirit award for highest participation","More details on the class Instagram"]', 2),
  ('2028', 'Service & Community', 'Joint service event with NHS completed',
   '["Over 40 juniors volunteered","Event raised 200+ food items for the local food bank","Next joint event planned for spring"]', 3),
  ('2028', 'Service & Community', 'Class motto and color input collected',
   '["Over 150 classmates responded to the survey","Top 3 options being reviewed by officers","Final vote coming in November"]', 4);

-- Class of 2029
INSERT INTO public.class_announcements (class_year, section_header, main_text, sub_bullets, sort_order) VALUES
  ('2029', 'Sophomore Events', 'First class social held — over 60 students attended',
   '["Held in the commons after school on October 10th","Games, music, and snacks provided by class office","Next social being planned for January"]', 1),
  ('2029', 'Sophomore Events', 'Sophomore semi-formal planned for late May',
   '["Date TBD — checking venue availability","Tickets expected to go on sale in April","Theme vote coming on Instagram"]', 2),
  ('2029', 'Class Office News', 'Class Instagram launched — 200+ followers and growing',
   '["Follow @interlakeclass2029 for updates","Polls and Q&As posted weekly","DM us with ideas or questions"]', 3),
  ('2029', 'Class Office News', 'Fundraiser ideas survey sent to all sophomores',
   '["Results being reviewed by the treasurer","Top ideas will be presented at the next meeting","Winning idea gets executed this spring"]', 4);

-- Class of 2030
INSERT INTO public.class_announcements (class_year, section_header, main_text, sub_bullets, sort_order) VALUES
  ('2030', 'Freshman Class Updates', 'First class officer meeting held — goals set for the year',
   '["Focus areas: community, spirit, and fundraising","Next meeting scheduled for November","Follow us on Instagram for updates"]', 1),
  ('2030', 'Freshman Class Updates', 'Class office introduced at freshman orientation assembly',
   '["Officers presented goals to the class of 2030","Q&A session held after the presentation","Strong turnout and positive response"]', 2),
  ('2030', 'Upcoming Plans', 'Freshman social mixer organized during advisory week',
   '["Icebreaker games and snacks in the commons","Over 50 freshmen attended","Second mixer planned for winter"]', 3),
  ('2030', 'Upcoming Plans', 'End-of-year class celebration in early planning',
   '["Proposals being gathered from classmates","Budget discussion at February officer meeting","More details to come in the spring"]', 4);

-- ── Class Fundraisers ────────────────────────────────────────
INSERT INTO public.class_fundraisers (class_year, date_text, title, location, description, sort_order) VALUES
  ('2027', 'June 5, 2026',  'Senior Bake Sale',         'Main Lobby — all three lunches',    'Homemade treats made by class members. All proceeds go toward the senior activities fund.', 1),
  ('2027', 'June 12, 2026', 'Chipotle Restaurant Night', 'Chipotle, 148th Ave SE, Bellevue',  'Dine between 4–8 PM and mention Interlake Class of 2027 at checkout — 33% of your purchase comes back to our class.', 2),
  ('2028', 'June 3, 2026',  'Popsicle Sale',             'Courtyard — all three lunches',     'Beat the end-of-year heat with popsicles! $1 each — all proceeds support junior class events next year.', 1),
  ('2028', 'June 17, 2026', 'Panda Express Restaurant Night', 'Panda Express, Bellevue Way NE', 'Show our flyer or mention Interlake Class of 2028 between 5–9 PM and 20% goes directly to our class fund.', 2),
  ('2029', 'May 29, 2026',  'Bake Sale',                 'Main Lobby — all three lunches',    'Sweet and savory treats baked by class members. Stop by during lunch and support the Class of 2029!', 1),
  ('2029', 'June 9, 2026',  'Chipotle Night',            'Chipotle, NE 8th St, Bellevue',     'Mention Interlake Class of 2029 at checkout between 4–8 PM and 33% comes back to our class fund.', 2),
  ('2030', 'June 2, 2026',  'Popsicle Sale',             'Courtyard — all three lunches',     'Our first-ever fundraiser! Popsicles for $1 each. Come support the Class of 2030.', 1),
  ('2030', 'June 19, 2026', 'Panda Express Restaurant Night', 'Panda Express, Bellevue Way NE', 'Our first restaurant night! Mention Class of 2030 between 5–9 PM and 20% goes to our class fund.', 2);
