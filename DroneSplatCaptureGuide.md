# Drone Capture Guide for Gaussian Splatting
## Narrow Street Scene — DJI Mini 5 Pro

A Gaussian splat is only as good as the source footage. The pipeline (COLMAP → splat training) needs to find the same features across many overlapping views to triangulate 3D positions. Fast movement, motion blur, or sparse coverage all break this. The goal: **slow, smooth, dense overlap**.

---

## Camera Settings

| Setting | Value | Why |
|---|---|---|
| **Mode** | Cine | Reduces stick sensitivity → smoother movement |
| **Resolution** | 4K (3840×2160) | More pixels = more features for COLMAP |
| **Frame rate** | 30 fps | Higher than needed for splats but gives margin for frame selection |
| **Shutter speed** | 1/120 or faster | Critical — kills motion blur. Use ND filter if too bright |
| **ISO** | Auto, cap at 400 | Noise hurts feature matching |
| **Colour profile** | Normal (NOT D-Log) | Splats train on RGB; log footage trains poorly |
| **White balance** | Manual / locked | Auto-WB shifts between frames and confuses training |
| **Focus** | AF-S, locked after first focus | Avoid hunting mid-flight |
| **Format** | MP4 (H.264) | Easier downstream than H.265 |

---

## Flight Plan — Narrow Street

Think of the splat as needing to "see" every surface from multiple angles. One pass isn't enough.

### Speed
- **2 m/s maximum** forward speed
- **1 m/s** when close to buildings or detail
- Cine mode caps the max — leave it in Cine the whole time

### Altitude passes
Do **at least 3 passes** down the street at different heights:
1. **Low** — 3-5m altitude (ground-level detail, doorways, windows)
2. **Mid** — 8-10m (mid-building, balconies)
3. **High** — 15-20m (rooflines, top floors)

### Camera angle
- **Pass 1 (low):** gimbal at **0°** (horizontal) — looking forward
- **Pass 2 (mid):** gimbal at **-15°** — slight down-look
- **Pass 3 (high):** gimbal at **-30° to -45°** — overhead context
- For each pass, do it **once facing each side of the street** (gimbal yawed ±45° toward the buildings on that side)

That's effectively **6 passes total**. Sounds a lot, but each one is short.

### Optional but great:
- **Orbit** key features (notable buildings, statues) — slow 360° circle at 2 m/s, gimbal -20°
- **Capture both ends of the street** with hovering wide shots for context

---

## Critical Rules

1. **Overlap is everything.** Every point on a building should appear in 20+ frames from different angles. Slow + multiple passes = automatic overlap.
2. **Never yaw and translate at the same time.** Yaw (rotate), stop, then translate (move). Combined motion = blur + bad triangulation.
3. **Don't change altitude mid-pass.** Fly each pass at constant altitude. Step up between passes only.
4. **Avoid the sky filling the frame.** Splats hate featureless sky — keep buildings in shot.
5. **Avoid moving objects.** Wait for cars/people to clear, or accept they'll be ghosted in the result. Early morning is ideal.
6. **Consistent lighting.** Shoot in flat overcast OR within a 30-minute window. Don't fly across sunset.
7. **No zooming.** Keep focal length fixed throughout.

---

## What Breaks a Splat

- ❌ Fast forward flight (>3 m/s) → motion blur
- ❌ Single pass only → no parallax, holes everywhere
- ❌ Auto white balance / auto ISO swings → COLMAP fails to register
- ❌ Filming into the sun → lens flare confuses features
- ❌ Tiny featureless walls (plain concrete) → use stills to fill these in
- ❌ Glass, mirrors, water → these will look weird no matter what

---

## Bonus: Aerial Stills

Take 50-100 still photos in addition to video, especially of:
- Building facades head-on
- Corners and architectural detail
- Anything important you want sharp in the final splat

Settings:
- **JPEG** (or RAW + JPEG)
- Same locked WB as video
- Shoot in hover, not while moving
- 60-70% overlap between adjacent photos

---

## Quick Pre-flight Checklist

- [ ] Cine mode on
- [ ] Shutter ≥ 1/120
- [ ] ND filter fitted if bright (ND16 for sunny day)
- [ ] White balance locked (tap-and-hold on grey building)
- [ ] D-Log OFF, Normal colour profile
- [ ] AF locked after first focus
- [ ] Battery >50% (cold/long flight)
- [ ] No people/cars in scene if possible

---

## Realistic Expectations

Even with perfect capture, splats of outdoor street scenes will have:
- Slight floaters in the sky
- Soft distant geometry
- Some ghosting on anything that moved
- Reflections (windows) that look weird

A good street splat takes **15-25 minutes of flight time** across the passes above. Rushing it is the #1 cause of bad results.
