# RadioA for Linux

Internet radio for Linux, packaged as a `.deb`. Your own station list, a 10-band equalizer, the
song that is playing with its album cover, skins, a VU meter that measures the real sound, and a classic hi-fi
look called **Vintage**. Free, no account, no ads.

## Get it

| Platform | Where |
|---|---|
| **Linux** (amd64, `.deb`) | [![Download from GitHub Releases](https://img.shields.io/badge/GitHub_Releases-download_.deb-2E9E5B?style=for-the-badge&logo=linux&logoColor=white)](https://github.com/toevi/RadioA-Linux/releases/latest) |
| **Windows 11** (x64) — RadioA for Windows | [![Get it from the Microsoft Store](https://img.shields.io/badge/Microsoft_Store-get_it-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)](https://apps.microsoft.com/detail/9NJPCB908XPS) |
| **Android** (phone, tablet, Android Auto) | [![Get it on Google Play](https://img.shields.io/badge/Google_Play-get_it-34A853?style=for-the-badge&logo=googleplay&logoColor=white)](https://play.google.com/store/apps/details?id=com.tmfgroup.radioandroid) |

The Linux app is distributed **only through this project's Releases page**. A copy from anywhere else may have been altered.

Website: <https://toevi.github.io/RadioA-Linux/>

Tested on Linux Mint 22.3 (Cinnamon, X11). Other Debian-based systems may work but are not tested yet. 64-bit (amd64) only.

### Install

```sh
sudo apt install ./radioa_<version>_amd64.deb
```

Use `apt` rather than `dpkg -i`: apt also installs what the app needs (VLC's playback library from your system's
repositories, and `pulseaudio-utils` for the VU meter).

### Check the download (recommended)

Every release carries `SHA256SUMS`, its signature `SHA256SUMS.gpg` and the public key `radioa-signing-key.asc`.
Key: `tmfgroup <tomek.maselko@gmail.com>`, fingerprint:

```
7B94 EDA6 999D F3F0 E34A  7D3C 8548 DB28 19D9 7E04
```

```sh
gpg --import radioa-signing-key.asc
gpg --show-keys --fingerprint radioa-signing-key.asc   # compare with the fingerprint above
gpg --verify SHA256SUMS.gpg SHA256SUMS                 # must say "Good signature"
sha256sum -c SHA256SUMS --ignore-missing               # must say "OK"
```

The fingerprint on this page and on the website is what ties the key to this project. A key file alone proves
nothing: anyone could make one under this name.

## Screenshots

<p align="center">
  <img src="docs/17-vintage-szerokie.png" alt="Vintage player style in black across a wide window" width="820">
</p>

<p align="center">
  <img src="docs/15-vintage-black.png" alt="Vintage player, black" width="200">
  <img src="docs/14-vintage-silver.png" alt="Vintage player, silver" width="200">
  <img src="docs/09-player-gra.png" alt="Modern player at phone width with a bar VU meter" width="200">
  <img src="docs/16-vintage-stacje.png" alt="Station grid in the Vintage style" width="200">
</p>

More on the website: <https://toevi.github.io/RadioA-Linux/#screenshots>

## What it is for

Listening to internet radio on a Linux desktop: you add the stations you like by their stream address, the app
plays them, keeps the connection alive and shows what is on air. Close the window and the radio keeps playing
from the system tray.

- Plays Shoutcast / Icecast and HLS streams, reconnects by itself when the stream or the network drops, and after
  the computer wakes from sleep.
- 10-band equalizer with your own presets; skins; Modern and **Vintage** player styles.
- Song title and album cover; sleep timer; media keys and the desktop's media controls (MPRIS); keyboard shortcuts.
- Playlists (PLS) and equalizer presets are file-compatible with the Android and Windows apps, both ways.

**Stations are yours to add.** On first start the list holds a few examples (SomaFM and France Musique)
so there is something to play straight away. The app hosts no streams of its own.

> **This repository is the app's home page, its documents and its releases — there is no source code here.**

## Licence and privacy

- **[LICENSE.txt](LICENSE.txt)** — licence terms. The app is free for private use; it is not for sale or resale.
- **[PRIVACY.md](PRIVACY.md)** — privacy policy: the app collects no personal data, has no accounts,
  advertising or analytics.
- **[THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt)** — the open-source components the app uses and their
  licences: LibVLCSharp (LGPL-2.1), Avalonia UI, .NET and Tmds.DBus (MIT), Material Icons (Apache-2.0), the Inter
  and Doto fonts (SIL OFL-1.1). libvlc (LGPL-2.1) comes from your system's repositories.

## Author

Tomasz Masłowski (**toevi**) — a private, one-person project. If you would like to support it, the app's
coffee page shows how; it is entirely optional and unlocks nothing.

## Reporting a problem

Open an **[issue](../../issues/new/choose)** — say which app version and which system and version you have and
what happened; a screenshot helps. This page is public, so anything private goes by e-mail instead:
tomek.maselko@gmail.com.
