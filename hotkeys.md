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
