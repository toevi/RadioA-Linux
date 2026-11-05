# Privacy Policy – RadioA for Linux

**Last updated:** 5 November 2026

This policy covers **RadioA for Linux**, distributed as a `.deb` package from
<https://github.com/toevi/RadioA-Linux/releases> and through the project's APT repository
(<https://toevi.github.io/RadioA-Linux/apt>), and lives on the app's page:
<https://toevi.github.io/RadioA-Linux/>.
The Windows and Android apps have their own policies, on their own pages.

**The app does not collect, store or share any personal data, and it has no user accounts, no advertising
and no analytics.**

## 1. Data the app collects

**None.** RadioA for Linux does not collect any personal data and sends none to the developer. There are no
user accounts, no registration and no login. The app contains no advertising, analytics or crash-reporting
component.

## 2. Data stored on your computer

Everything the app saves stays on your computer and is never uploaded anywhere:

| What | Where |
|---|---|
| Your settings: equalizer, skins, VU meter mode, theme, window and list preferences | `~/.config/radioandroid` |
| Your station list (name and stream address of each station, favourites) | `~/.local/share/radioandroid` |
| Cached cover art and station logos, and a list of logo addresses already looked up | `~/.cache/radioandroid` |
| Playlists and equalizer presets you save, so you can copy or share them yourself | `Documents/RadioA/PLS`, `EQ` (your own documents folder, under the name your system uses for it) |
| The startup entry, **only if you turn on Start with the system** | `~/.config/autostart/radioa.desktop` |

The first three folders keep an earlier technical name of the app.

**Uninstalling** the package removes the program and the software source described in section 4. As with every Debian package, the files in your home
folder stay, so a reinstall finds your stations again. Delete the folders above yourself if you want nothing
left behind.

## 3. Internet connections the app makes

The app connects to the internet in order to play radio and to show cover art and station logos. No
personal data is sent in any of these requests.

| Destination | When | What is sent |
|---|---|---|
| The radio station's own server (the stream address of the station) | While a station is playing, and when you save a station (the address is checked) | A standard media stream request. A second, short request to the same address reads the "now playing" title the station broadcasts. |
| Apple iTunes Search API (`itunes.apple.com`) | When the station reports the currently playing track | The artist and title of that track, to look up the album cover. |
| Deezer API (`api.deezer.com`) | Fallback, when iTunes has no match for the track | The artist and title of that track. |
| radio-browser.info | When a station on your list has no logo yet | The station name, to look up its logo. |
| AudioAddict / RadioTunes API (`api.audioaddict.com`) | When looking up a station logo; the list is downloaded once and kept in the cache | Nothing but the request for the public channel list. |
| The server that holds a logo or cover image (for example the station's website, Wikimedia, Apple's or Deezer's image servers, `cdn-images.audioaddict.com`) | When a logo or cover found above is downloaded for the first time | A request for that image. It is then kept in the cache (section 2). |

These requests contain no identifiers, no account information and nothing about you — only the name of
a song or a station. As with every internet connection, each server can see your computer's IP address;
their own privacy policies apply to what they do with the requests they receive.

Some services require every client to name itself, so the requests carry a fixed description of the
app (it still uses the project's technical name, RadioAndroid): `RadioAndroid/6 (tomek.maselko@gmail.com)` for
logo and station-title lookups, `RadioAndroid/<version> (Linux)` for cover lookups and
`RadioAndroid/1.0 (Linux)` for image downloads. The e-mail address is the developer's contact address
from section 8. This description is the same for everyone and carries nothing that identifies you.

**Updates.** The app itself does not check for updates. The package adds the project's APT repository to
your system (section 4), so your system's package manager (`apt`), not the app, connects to `toevi.github.io`
when it checks for updates, on its own schedule or when you run it, to read the package list and to download
new versions. These are the standard requests it makes to every repository you have. GitHub, which hosts the
site, can see your IP address, and its privacy policy applies. Nothing about you is sent to the developer.

The app opens web pages in your own browser **only when you click a link**: the project page, the two
donation pages on the coffee page (`buycoffee.to`, `buymeacoffee.com` — voluntary, they unlock nothing in
the app) and the station directory `fmstream.org`. What happens there is covered by those sites' own policies.

## 4. Linux desktop integration

- **Media controls (MPRIS).** The station name, track title and cover are passed over the session bus to your
  desktop's media controls, so that media keys and the sound applet can show and control playback. Other
  programs of your user session can read them, as with every media player. Nothing is sent to the developer.
- **System tray.** The tray icon's tooltip shows the station and the track.
- **VU meter.** To show the real level of the music, the app reads the monitor of **its own** audio stream
  (with `parec`, from the `pulseaudio-utils` package) — only its own sound, never other programs and never
  the microphone — and measures it in memory, a fraction of a second at a time. Nothing is recorded, saved or
  sent anywhere.
- **Clipboard.** While the station editor is open, the app reads text from the clipboard when you come back
  to the window, so that a copied stream address lands in the address field. It keeps nothing else and sends
  nothing anywhere.
- **Sleep and wake.** The app listens for the system's sleep and wake signal (logind) to reconnect the station.
- **Installation.** Installing needs administrator rights (`sudo apt install`), as for any package. The package
  adds one software source, `/etc/apt/sources.list.d/radioa.list`, and its signing key, `/usr/share/keyrings/radioa-archive-keyring.gpg`, so that
  updates reach you through your system; uninstalling removes them. The app itself
  runs as your user and installs no service. It does not start with the system unless you turn on
  **Start with the system** in Settings. It does not access your location, contacts, camera or microphone, or
  files outside the folders listed in section 2 and the files you open yourself.

## 5. Children

The app is not directed at children and collects no data from anyone, including children.

## 6. Content responsibility

The developer does not host, control or curate any stream and is not responsible for the content the
stations broadcast. On first start the app adds a few example stations (SomaFM channels and France
Musique), whose broadcasters make these streams publicly available; you may delete them. All other
stations you add yourself. Please respect the copyright laws in your country.

## 7. Changes to this policy

If the app's features change, this Privacy Policy will be updated accordingly. The date at the top
shows its latest version.

## 8. Contact

If you have any questions about this Privacy Policy, you can contact the developer:

- Developer: Tomasz Masłowski
- Email: tomek.maselko@gmail.com
