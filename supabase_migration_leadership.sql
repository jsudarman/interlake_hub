-- ============================================================
-- Saints Station — Leadership Tables Migration
-- Run in: Supabase Dashboard → SQL Editor → New Query
--
-- Creates tables for:
--   ASB: asb_officers, asb_events, asb_announcements, asb_settings
--   Class Office: class_settings, class_officers,
--                 class_announcements, class_fundraisers
-- ============================================================

-- ── ASB Officers ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.asb_officers (
  id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  name        text        NOT NULL DEFAULT '',
  role        text        NOT NULL DEFAULT '',
  photo_url   text        NOT NULL DEFAULT '',
  sort_order  int         NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);

-- ── ASB Events ───────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.asb_events (
  id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  event_month text        NOT NULL DEFAULT '',
  event_day   text        NOT NULL DEFAULT '',
  event_name  text        NOT NULL DEFAULT '',
  bullets     jsonb       NOT NULL DEFAULT '[]',
  sort_order  int         NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);

-- ── ASB Announcements ────────────────────────────────────────
-- Each row = one announcement item; group by section_header in app
CREATE TABLE IF NOT EXISTS public.asb_announcements (
  id             uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  section_header text        NOT NULL DEFAULT '',
  main_text      text        NOT NULL DEFAULT '',
  sub_bullets    jsonb       NOT NULL DEFAULT '[]',
  sort_order     int         NOT NULL DEFAULT 0,
  created_at     timestamptz NOT NULL DEFAULT now()
);

-- ── ASB Settings (singleton row: id = 1) ─────────────────────
CREATE TABLE IF NOT EXISTS public.asb_settings (
  id               int  PRIMARY KEY DEFAULT 1,
  advisor_name     text NOT NULL DEFAULT '',
  advisor_email    text NOT NULL DEFAULT '',
  instagram_url    text NOT NULL DEFAULT '',
  minutes_url      text NOT NULL DEFAULT '',
  contact_general  text NOT NULL DEFAULT '',
  contact_president text NOT NULL DEFAULT '',
  contact_events   text NOT NULL DEFAULT ''
);

-- ── Class Settings ───────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.class_settings (
  class_year   text PRIMARY KEY,
  grade_label  text NOT NULL DEFAULT '',
  instagram_url text NOT NULL DEFAULT '',
  tiktok_url   text NOT NULL DEFAULT ''
);

-- ── Class Officers ───────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.class_officers (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  class_year  text NOT NULL,
  name        text NOT NULL DEFAULT '',
  role        text NOT NULL DEFAULT '',
  photo_url   text NOT NULL DEFAULT '',
  sort_order  int  NOT NULL DEFAULT 0
);

-- ── Class Announcements ──────────────────────────────────────
-- Each row = one announcement item; group by section_header in app
CREATE TABLE IF NOT EXISTS public.class_announcements (
  id             uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  class_year     text        NOT NULL,
  section_header text        NOT NULL DEFAULT '',
  main_text      text        NOT NULL DEFAULT '',
  sub_bullets    jsonb       NOT NULL DEFAULT '[]',
  sort_order     int         NOT NULL DEFAULT 0,
  created_at     timestamptz NOT NULL DEFAULT now()
);

-- ── Class Fundraisers ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS public.class_fundraisers (
  id          uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  class_year  text        NOT NULL,
  date_text   text        NOT NULL DEFAULT '',
  title       text        NOT NULL DEFAULT '',
  location    text        NOT NULL DEFAULT '',
  description text        NOT NULL DEFAULT '',
  sort_order  int         NOT NULL DEFAULT 0,
  created_at  timestamptz NOT NULL DEFAULT now()
);

-- ── Enable RLS ───────────────────────────────────────────────
ALTER TABLE public.asb_officers     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.asb_events       ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.asb_announcements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.asb_settings     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.class_settings   ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.class_officers   ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.class_announcements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.class_fundraisers ENABLE ROW LEVEL SECURITY;

-- ── GRANT to anon ────────────────────────────────────────────
GRANT SELECT, INSERT, UPDATE, DELETE ON public.asb_officers     TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.asb_events       TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.asb_announcements TO anon;
GRANT SELECT, UPDATE                 ON public.asb_settings     TO anon;
GRANT SELECT, INSERT, UPDATE         ON public.class_settings   TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.class_officers   TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.class_announcements TO anon;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.class_fundraisers TO anon;

-- ── RLS Policies ─────────────────────────────────────────────
DROP POLICY IF EXISTS "asb_officers_anon"      ON public.asb_officers;
DROP POLICY IF EXISTS "asb_events_anon"        ON public.asb_events;
DROP POLICY IF EXISTS "asb_announcements_anon" ON public.asb_announcements;
DROP POLICY IF EXISTS "asb_settings_anon"      ON public.asb_settings;
DROP POLICY IF EXISTS "class_settings_anon"    ON public.class_settings;
DROP POLICY IF EXISTS "class_officers_anon"    ON public.class_officers;
DROP POLICY IF EXISTS "class_announcements_anon" ON public.class_announcements;
DROP POLICY IF EXISTS "class_fundraisers_anon" ON public.class_fundraisers;

CREATE POLICY "asb_officers_anon"      ON public.asb_officers      FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "asb_events_anon"        ON public.asb_events        FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "asb_announcements_anon" ON public.asb_announcements FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "asb_settings_anon"      ON public.asb_settings      FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "class_settings_anon"    ON public.class_settings    FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "class_officers_anon"    ON public.class_officers    FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "class_announcements_anon" ON public.class_announcements FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "class_fundraisers_anon" ON public.class_fundraisers FOR ALL TO anon USING (true) WITH CHECK (true);
