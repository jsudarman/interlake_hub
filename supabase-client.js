// Supabase client helper
// ─────────────────────────────────────────────────────────────────────────────
// Load order in HTML (before any page script that uses `sb`):
//
//   <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.js"></script>
//   <script src="config.js"></script>
//   <script src="supabase-client.js"></script>
//
// After loading, `window.sb` is the configured Supabase client.
// Usage:  const { data, error } = await sb.from('clubs').select('*');
// ─────────────────────────────────────────────────────────────────────────────

(function () {
  // Guard: config.js must be loaded first
  if (typeof SUPABASE_URL === 'undefined' || typeof SUPABASE_ANON_KEY === 'undefined') {
    console.error(
      '[Saints Station] Supabase config missing.\n' +
      'Copy config.example.js → config.js and fill in your credentials.'
    );
    window.sb = null;
    return;
  }

  if (SUPABASE_URL.includes('YOUR_PROJECT_REF') || SUPABASE_ANON_KEY.includes('YOUR_SUPABASE_ANON_KEY')) {
    console.warn(
      '[Saints Station] Supabase credentials are still placeholders.\n' +
      'Open config.js and replace the placeholder strings with your real values.'
    );
    window.sb = null;
    return;
  }

  // Guard: CDN script must be loaded first
  if (typeof supabase === 'undefined' || typeof supabase.createClient !== 'function') {
    console.error(
      '[Saints Station] supabase-js CDN script not found.\n' +
      'Make sure the CDN <script> tag appears before supabase-client.js.'
    );
    window.sb = null;
    return;
  }

  window.sb = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
})();
