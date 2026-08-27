-- ============================================================
-- Saints Station — Officer Portal Profile Editing Migration
-- Run in: Supabase Dashboard → SQL Editor → New Query
--
-- This migration adds:
--   1. leadership_photo_url column to clubs table
--   2. GRANT UPDATE on clubs to anon role
--   3. RLS policy allowing anon UPDATE on clubs
-- ============================================================

-- 1. Add leadership photo URL column
ALTER TABLE public.clubs
  ADD COLUMN IF NOT EXISTS leadership_photo_url text DEFAULT '';

-- 2. Grant anon role UPDATE permission on clubs
GRANT UPDATE ON public.clubs TO anon;

-- 3. RLS policy: allow anon to UPDATE clubs (Officer Portal)
DROP POLICY IF EXISTS "clubs_anon_update" ON public.clubs;
CREATE POLICY "clubs_anon_update" ON public.clubs
  FOR UPDATE TO anon USING (true) WITH CHECK (true);
