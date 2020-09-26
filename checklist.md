# Hotkeys

## OBS
### Allgemein
* **[M]** 🔇 Mikrofon
* **[D]** 🔇 Desktop Audio

### Szenen
1. **[1]** Szene "Start" ⏰
    * 🔇 alle Audioquellen geschlossen

2. **[2]** Szene "Cam" 🎥
    * 🔊 alle Audioquellen, außer Gast, offen
    * 🎥 `Internal`
    * 📺 Screen, Spendenaufruf, ❓ und Chat 💬 nicht sichtbar
    * **[<]** Kameraumschaltung
    * **[+]** "Screen" 📺 ein-/ausblenden
    * **[€]** Spendenaufruf
    * **[?]** ❓
    * **[C]** Chat 💬 ein-/ausblenden

3. **[3]** Szene "Screen" 📺
    * 🔊 alle Audioquellen, außer Gast, offen
    * Kameras nicht sichtbar
    * **[+]** Kameras ein-/ausblenden
        * 🎥 `External` (rechts oben)
    * **[<]** Kameraumschaltung

4. **[4]** Szene "Finish" 🛌
    * 🔇 alle Audioquellen geschlossen

### Intro/ Outro
* **[I]** **I**ntro 🎞
    * 🔊 alle Audioquellen, außer Gast, offen
    * wechselt zu Szene "Cam"

* **[O]** **O**utro 🎞
    * 🔇 alle Audioquellen geschlossen
    * wechselt zu Szene "Finish"

### Guest 📞
* **[1]**, **[2]**, **[3]** und **[4]** - Gast niemals hör- und sichtbar

* **[F]** Szene "**F**ull" entspricht Szene "Cam" **[2]** mit Gast anstatt Gastgeber im Großbild
    * zusätzlich Ton Gast auf
    * 🔇 Mikrofon zu
    * **[€]** Spendenaufruf, **[?]** und **[+]** Screen

* **[G]** Szene "**G**uest" entspricht Szene "Cam" **[2]** mit eingeblendetem Gast und Chat 💬

* **[H]** Szene "**H**istory" entspricht Szene "Screen" **[3]**
    * zusätzlich Ton Gast auf
    * Kameras/ Gast unmittelbar sichtbar
    * **[+]** Kameras aus-/einblenden
        * **[<]** Kameraumschaltung

### Tipps
* Szene "Cam" **[2]**, "Screen" **[3]**, "Full" **[F]** und "Guest" **[G]** können nach Einblendungen durch erneutes Drücken wieder "aufgeräumt" werden.
* **[2]**,  **[3]** und **[G]** können auch benutzt werden, um z.B. das Mikrofon nach **[M]** wieder zu öffnen.
* Der Gast kann in **[G]** durch Wechsel zu **[2]** und in **[H]** zu **[3]** ausgeblendet und gemutet werden.

## Hammerspoon
* **[ctrl][alt][cmd] & [G]** - ***"Grundeinstellungen"*** 🧯
    * Audio- und Videoeinstellungen werden vorgenommen
    * Powermanagement deaktiviert
    * WiFi deaktiviert
    * nicht erforderliche Anwendungen werden geschlossen
    * verschiedene Prüfungen werden durchgeführt
    * kann immer wieder gedrückt werden, z.B. bei Tonproblemen, oder wenn der Monitor Einstellungen "vergisst"
    * wird immer durchgeführt, wenn OBS geöffent wird

* **[ctrl][alt][cmd] & [S]** - ***"Streamen"*** 🔧
    * `Skype`, `FotoMagico` und `NDI Virtual Input` werden geöffnet
    * nicht erforderliche Anwendungen werden geschlossen
    * wenn OBS nicht schon aktiv: 
        * "Grundeinstellungen" (weil mit OBS verknüpft)
        * OBS wird mit dem Profil `gpYTsq` und der Szenensammlung `gp_naked` geöffnet
        * OBS streamt 🔴
    * auch wiederholbar

* **[ctrl][alt][cmd] & [M]** - ***"Mail"*** ✉️
    * Log- und Konfiguratuonsdateien sammeln und als Email verschicken

## FotoMagico 🖼
* **[cmd] & [P]** Präsentation im Vollbildmodus starten

# Checklist
⏰ **16:00 Uhr**

--> ▶️ ☎️  Olaf
## Prelaunch
### Hammerspoon
* **[ctrl][alt][cmd] & [S]**
    * Audio- und Videoeinstellungen werden vorgenommen
    * Powermanagement deaktiviert
    * WiFi deaktiviert
    * nicht erforderliche Anwendungen werden geschlossen
    * verschiedene Prüfungen werden durchgeführt
    * OBS wird mit dem Profil `gpYTsq` und der Szenensammlung `gp_naked` geöffnet
    * OBS streamt 🔴

### FotoMagico
* Präsentation laden
* **[cmd] & [P]** Startposition `FotoMagico`

### OBS
#### Quellen sicht-/unsichtbar schalten und Overlays laden
* ⚠ Vorschaubild OBS anklicken!
* **[1]**
* **[2]**, **[€]**
* **[<]**
    * 🎥 `External` aktiv?
* **[3]**
    * `FotoMagico` (anklicken, damit bedienbar) sicht- und hörbar?
* **[+]** Kamera zuschalten > ***Stresstest***
    * **Report Markus** In OBS unten rechts angezeigte Werte: cpu, fps, Ampelfarbe und kb/s
* **[4]**

#### Filme
* **[I]** **I**ntro sicht- und hörbar?
* **[O]** **O**utro sicht- und hörbar?

#### Skype
* **[G]** \(vorerst schwarzer Kreis)

### Hammerspoon
* **[ctrl][alt][cmd] & [M]**
    * senden der Log- und Konfigurationsdateien

### Skype
#### Skype > Einstellungen > Anrufe > Erweitert
* ☒ `Eingehende Anrufe automatisch annehmen`
* ☒ `Video automatisch starten`
* ☒ `NDI-Nutzung erlauben`

#### Skype > Einstellungen > Audio und Video
* Kamera: `FaceTime HD-Kamera`

* Mikrofon: `Standardgerät`
    * ☐ `Mikrofoneinstellungen automatisch anpassen`
    * 🎚️ ≈ `4` (automatisch durch Hammerspoon)

* Lautsprecher: Standardgerät?
    * 🎚️= `0`

* `Kostenlosen Testanruf tätigen`
    * NDI Virtual Input (macOS Menüleiste) -> `(Skype - Aktiver Sprecher)`
    * Mithörton? Eigene Stimme hörbar?
* **Go-No-Go decision!**

⏰ **16:15 Uhr**
### OBS
#### Testanrufe Gast und Co-Moderatorin
* **[2]** und auf Anruf warten
* **[G]** Gast zuschalten, Kameraposition und Ton prüfen
* **[F]**
* **[H]** > ***Stresstest***
    * **Report Markus** In OBS unten rechts angezeigte Werte: cpu, fps, Ampelfarbe und kb/s
* **[2]** und Gespräch beenden

* 'Stream beenden'
* **[1]**
* **Programme geöffnet lassen!**
<-- ⏹️ ☎️  Olaf  


⏰ **18:45 Uhr**

--> ▶️ ☎️  Olaf
## Ignition

### Allgemein
* 📴 Smartphone und Tablet lautlos?

### Hammerspoon
* **[ctrl][alt]\[cmd] & [G]**

### FotoMagico
* Startposition **[cmd] & [P]**

### OBS
#### Quellen sicht-/unsichtbar schalten und Overlays laden
* ⚠ Vorschaubild OBS anklicken!
* **[1]**
* **[2]**, **[€]**, **[C]**
* **[<]**
    * 🎥 `External` aktiv?
* **[3]**
    * `FotoMagico` (anklicken, damit bedienbar) sicht- und hörbar?
* **[4]**
* **[1]**
    * **Report Markus** In OBS unten rechts angezeigte Werte: cpu, fps, Ampelfarbe und kb/s
* Stream nicht beenden!
<-- ⏹️ ☎️  Olaf  


⏰ **19:15 Uhr**

--> ▶️ ☎️  Olaf
### YouTube
* Olaf: Stream auf YouTube starten ⚡️
* Status:
    * 🔴 Online, Audio gemuted
    * Zuschauer werden benachrichtigt und sehen den Startbildschirm
    * **Guidance is internal!**
<-- ⏹️ ☎️  Olaf  


⏰ **19:30 Uhr**
## Launch
* `FotoMagico` (anklicken, damit bedienbar)
* auf den "Alarm" warten
* mit **[I]** das Intro starten 🚀
* Status:
    * alle Audioquellen öffnen, du kannst mit **[M]** muten
    * wechselt automatisch zu Szene "Cams"
* Auf geht's!

## Landing
* Nach dem letzten Satz mind. 20sec warten, dann
* mit **[O]** das Outro starten
* [Mic] gemutet? - Du bist nicht mehr zu sehen und zu hören!
* Streaming in OBS nach frühesten 10min beenden - Jetzt bist Du offline!
* Olaf: Warten auf das Ausbleiben des Signals und dann den Stream auf YouTube beenden.
