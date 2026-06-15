# git-city — Design system

Single-file three.js scene with a thin HTML/CSS chrome layer at the edges.
**The chrome uses the Lime design system in dark mode** (see `../lime/`): friendly
rounded grotesk, pill buttons with a green circle-arrow, soft cards, lime-green
accent, on a green-tinted dark night. The 3D scene carries the voice; the DOM
chrome is quiet, rounded, and green. All chrome tokens live in `:root` in
`index.html`.

## Register & strategy
brand register. Colour strategy: committed-dark-green. The night scene is the
surface; a single lime green is the accent (CTAs, the orb, the signature dot,
positive values). Type is **Hanken Grotesk** (the Lime family), not mono.

## Colour (CSS custom properties, OKLCH)
Never pure black/white. Neutrals are green-tinted.

- Surface: `--bg #0a1009`; panels `--panel` (dark green gradient ~oklch(0.21→0.26 0.02 150)); flat panel `--panel-flat`.
- Text on green fills: `--ink oklch(0.19 0.03 150)`.
- Warm-white green-tinted text ramp: `--t-100` (0.97) headings · `--t-200` body · `--t-300` secondary · `--t-400` muted · `--t-500` faint readout · `--t-600` labels · `--t-700` faintest.
- Accent (lime): `--accent oklch(0.86 0.20 130)` (highlights, repo label, sig, score, busy state) · `--grass oklch(0.80 0.20 142)` (green fill for primary CTAs).
- Status: `--ok` green · `--err` warm red · `--add` green (+lines).
- Hairlines: `--line-soft/-/-mid/-strong` = white-alpha tints via `color-mix`.
- 3D scene retinted green-dark to match: sky gradient `#03070a→#0e2c1a`, fog `0x0a1c11`, ground `0x0a1810`, grid green, backdrop towers green-dark. The flyer orb + its light are green. Data-building palette (file types) and city window-lights stay as-is (data + atmosphere).

## Shape, motion, rhythm
- Radii (rounded, like the reference): `--r-sm 10` (inputs) · `--r-md 13` (tooltip) · `--r-lg 20` (panels) · `--r-pill 999` (nav/buttons/chips/badges).
- `--ease cubic-bezier(0.16,1,0.3,1)`; buttons lift 2px + green glow on hover; honour `prefers-reduced-motion` for chrome (the 3D scene keeps running).
- `--edge 22px` corner inset; `--mono` (JetBrains/Menlo) kept only for code tokens (tooltip file path, commit hash).

## Typography
**Hanken Grotesk** (Google Fonts), one family, weight contrast.
- Headings/display: 800, tight tracking (gate title clamp(26,6.5vw,34)).
- Body: 13–14px / 1.6.
- Labels / HUD / help / eyebrows: UPPERCASE, 600–700, wide tracking, 9.5–11px.
- Score readout: 24px / 800, lime.

## Components
- `.arrow` — the signature: a circle (ink) with a green `→` that nudges on hover, inside primary CTAs.
- Primary CTA = **green pill** (`--grass` fill, `--ink` text) + `.arrow`: `#play-btn`, `#gate-build`, `#over-again`.
- Ghost pill = rounded, hairline border, green on hover: `#open-gate`, `#over-exit`.
- Eyebrow pill = green-tinted pill (`gate-kicker`).
- Cards = dark rounded panels (`gate-panel`, `over-panel`, `#tip`), soft shadow, no nesting.
- Chips = rounded pills (repo examples). HUD, legend, help, game HUD, tooltip all Hanken + green accent.

## Interaction & responsive
Every control has hover + a shared `:focus-visible` ring (2px `--accent`).
Inputs glow green on focus. Desktop-first; at ≤640px hide keyboard-only `#help`,
tighten HUD/legend, stack the two bottom CTAs centered.
