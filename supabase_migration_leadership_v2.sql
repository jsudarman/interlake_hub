-- ============================================================
-- Saints Station — Leadership Tables Migration v2
-- Run AFTER supabase_migration_leadership.sql
-- Adds what_is_asb and tiktok_url columns to asb_settings.
-- ============================================================

ALTER TABLE public.asb_settings
  ADD COLUMN IF NOT EXISTS what_is_asb text NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS tiktok_url  text NOT NULL DEFAULT '';
