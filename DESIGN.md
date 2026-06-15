# git-city — Design system

Single-file three.js scene with a thin HTML/CSS chrome layer at the edges.
Dark, nocturnal, monospace. The 3D scene carries the voice; the DOM chrome is
quiet and consistent. All chrome tokens live in `:root` in `index.html`.

## Register & strategy
brand register. Colour strategy: committed-dark. The night scene IS the surface;
a single hot orange is the only saturated accent, gold is the secondary accent.
Mono type is identity here (a literal dev/terminal artifact), not costume.

## Colour (CSS custom properties)
Never pure black or white. Neutrals are blue-tinted.

- Surface: `--bg #060812`; panels `--panel` (vertical gradient rgba(16,22,40) → rgba(9,13,26)); flat panel `--panel-flat rgba(9,13,24,.96)`.
- Text on accent: `--ink #0a0c14`.
- Neutral ramp (blue-tinted): `--t-100 #eef1f5` (headings) · `--t-200 #c0c5cc` (body) · `--t-300 #9aa2ac` (secondary) · `--t-400 #868e98` (muted) · `--t-500 #69717f` (faint readout) · `--t-600 #535b69` (labels) · `--t-700 #454d5b` (faintest).
- Accent (signature orange): `--accent #ff6b35` · `--accent-bright #ff8a4a` · `--accent-hi #ffae84`.
- Secondary accent: `--gold #d8b078` (HUD repo label, legend icons, busy state).
- Status: `--ok #8aa898` · `--err #e07a6a` · `--add #7ec88a`.
- File-type palette (the data colours) lives in JS (`EXT_PALETTES.byExt`), brighter/more saturated than chrome.

## Hairlines, radius, motion
- Hairlines: `--line-soft .06` · `--line .08` · `--line-mid .10` · `--line-strong .12` (all white-alpha).
- Radius: `--r-sm 3px` (chips, small) · `--r-md 4px` (inputs, buttons) · `--r-lg 7px` (panels).
- Motion: `--ease cubic-bezier(0.16,1,0.3,1)` (ease-out-expo) for panel entrances. UI transitions 0.16–0.18s. No bounce, no layout-property animation. Honour `prefers-reduced-motion` for chrome (the 3D scene is content and keeps running).
- Rhythm: `--edge 22px` corner inset for all fixed chrome.

## Typography
JetBrains Mono / Menlo, monospace, everywhere (the brand voice).
- Headings: 19–25px, weight 500, tight tracking (-0.01em).
- Body: 12.5–13px, line-height 1.5–1.65.
- Labels / HUD / help: 9–11px, UPPERCASE, wide tracking (0.12–0.34em).
- Big readouts (score): 23px weight 600.

## Components
- `#hud` top-left readout (repo · commits · buildings), gold repo label, ellipsis on overflow.
- `#legend` "how to read" with data-driven swatches; collapsible.
- `#help` bottom-right keyboard hints with `kbd` chips (hidden on small screens).
- `#sig` 8px orange square, top-right (the maker's mark).
- `.gate-panel` repo modal: kicker + title + sub + input/build + chips + status + skip.
- `#play-btn` outline-orange CTA; `#game-hud` score + pulsing hint; `.over-panel` win/lose.
- `#tip` hover tooltip (file · +/− lines · commit · author).

## Interaction states
Every control has hover + a shared `:focus-visible` ring (2px `--accent`, 2px offset).
Primary action = solid orange; secondary = bordered ghost; tertiary = text only.
Inputs keep an orange focus glow. Disabled = 0.5 opacity.

## Responsive
Desktop-first (3D experience). At ≤640px: hide keyboard-only `#help`, tighten HUD
and legend, drop the play button. Modals are fluid (`min(94vw, …)`).
