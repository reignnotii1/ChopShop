# ChopShop – vocal chopper (VST3 / AAX)

**Controls**
- **CHOP** – stepped knob: 1/1, 1/2, 1/4, 1/8, 1/8T, 1/16, 1/16T, 1/32, 1/32T, 1/64 (tempo-synced to the host)
- **REFRESH** – how often a fresh slice is captured (1/32 … 4 bar). The first chop of each window plays live and is
  recorded; the rest of the window repeats that slice (stutter/chop).
- **FREEZE** – stop capturing, keep repeating the last slice
- **GATE** – % of each chop that is audible · **FADE** – edge fades (anti-click) · **MIX** · **OUTPUT**

## Build
Requires CMake 3.22+, a C++17 compiler (Visual Studio 2022 / Xcode), and Git (JUCE is downloaded automatically).

Windows:  `build.bat`            → build\ChopShop_artefacts\Release\VST3\ChopShop.vst3 + `installer\ChopShop-Setup-1.0.0.exe` (needs Inno Setup)
macOS:    `./build.sh`           → `installer/ChopShop-1.0.0.pkg`

### AAX (Pro Tools)
1. Get the free AAX SDK from Avid (developer account: https://my.avid.com/products/api).
2. Build with `build.bat C:\path\to\aax-sdk` or `./build.sh /path/to/aax-sdk`.
3. Pro Tools only loads AAX plugins signed through PACE/iLok (wraptool). Avid gives dev signing for testing.
   For release you need a PACE-signed build.

FL Studio uses VST3 (it does not load AAX). Pro Tools uses AAX only (it does not load VST3).
JUCE is licensed GPLv3 / commercial – check https://juce.com/juce-licensing before distributing.

## Get the .exe and .pkg without installing anything
Push this folder to a GitHub repo (Actions are free for public repos). The included workflow
(`.github/workflows/build.yml`) builds on Windows and macOS servers and produces
`ChopShop-Setup-1.0.0.exe` and `ChopShop-1.0.0.pkg` under the run's **Artifacts**.

## AAX installers via GitHub Actions
Make the repo **private**, download the AAX SDK from Avid, and place its contents in `aax-sdk/` at the repo root
(so `aax-sdk/Interfaces/...` exists). The workflow then also produces
`ChopShop-AAX-Setup-1.0.0.exe` (Windows) and `ChopShop-AAX-1.0.0.pkg` (Mac), plus combined VST3+AAX installers.
Pro Tools needs the AAX plugin signed with PACE wraptool before it will load it.
