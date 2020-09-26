# Hotkeys

## OBS
### Allgemein
* [M] Mikrofon muten
* [D] Desktop Audio muten

### Szenen
* [1] Szene "Start"
    * alle Audioquellen zu

* [2] Szene "Cam"
    * alle Audioquellen, ausser Gast, offen
    * 🎥 `Internal`
    * Screen, Spendenaufruf, ? und Chat nicht sichtbar

    * [<] Kameraumschaltung
    * [+] "Screen" einblenden
    * [€] Spendenaufruf
    * [?] Fragen?
    * [C] Chat einblenden

* [3] Szene "Screen"
    * alle Audioquellen, ausser Gast, offen
    * Kameras nicht sichtbar

    * [+] Kameras einblenden
        * 🎥 `External` (rechts oben)
        * [<] Kameraumschaltung

* [4] Szene "Finish"
    * alle Audioquellen zu

### Intro/ Outro
* [I] Intro 🎞
    * alle Audioquellen, ausser Gast, offen
    * wechselt zu Szene "Cam"

* [O] Outro 🎞
    * wechselt zu Szene "Finish"
    * alle Audioquelen zu

### Guest
* [1], [2], [3] & [4] - Gast niemals hör- und sichtbar

* [F] entspricht Szene "Cam" [2] mit Gast anstatt Gastgeber im Großbild
   * zusätzlich Ton Gast auf
   * Mikrofon zu
   * [€] Spwndenaufruf, [?] und [+] Screen

* [G] entspricht Szene "Cam" [2] mit eingeblendetem Gast und Chat
   * zusätzlich Ton Gast auf
   * [€] Spwndenaufruf und [?]

* [H] entspricht Szene "Screen" [3] mit eingeblendetem Gast und Chat
   * zusätzlich Ton Gast auf
   * Kameras/ Gast sofort eingeblendet
        * [<] Kameraumschaltung
        * [+] Kameras einblenden

## Hotspoon
* \[ctrl]\[alt][cmd] & [G] - "Grundeinstellung"
    * alle Audio- und Videoeinstellungen werden vorgenommen
    * Powermanagement deaktiviert
    * WiFi deaktiviert
    * verschiedene Prüfungen
   
    * kann immer wieder gedrückt werden, z.B. bei Tonproblemen, oder wenn der Monitor seine EInstellungen vergisst
    * wird immer durchgeführt, wenn OBS geöffent wird

* \[ctrl]\[alt][cmd] & [S] - "Streamen"
    * Skype, FotoMagico & NDI Virtual Input werden geöffnet
    * nicht erforderliche Anwendungen werden geschlossen
    * wenn OBS nicht schon auf
        * "Grundeinstellung" (weil mit OBS verknüpft)
        * OBS wird mit dem Profil `gpYTsq` und der Szenensammlung `gp_naked` geöffnet
        * OBS streamt

    * auch wiederholbar

* \[ctrl]\[alt][cmd] & [M] - "Mail"
    * Log- und Konfiguratuonsdateien sammeln und als Email verschicken

## FotoMagico
    * [cmd] & [P] Präsemntation im Vollbildmodus starten




# Checklist
16:00 Uhr
## Prelaunch

### Allgemein
* Smartphone & Tablet lautlos?

### Hammerspoon
* \[ctrl]\[alt]\[cmd] & [S]
    * nicht erforderliche Anwendungen werden geschlossen
    * Audio- und Videoeinstellungen werden vorgenommen
    * Powermanagement deaktiviert
    * WiFi deaktiviert
    * Skype, FotoMagico & NDI Virtual Input werden geöffnet
    * OBS wird mit dem Profil `gpYTsq` und der Szenensammlung `gp_naked` geöffnet
    * OBS streamt

### FotoMagico
* Präsentation laden
* [cmd] & [P] Startposition FotoMagico

### OBS
#### Quellen sicht-/unsichtbar schalten und Overlays laden
* Achtung: Vorschaubild anklicken!
* [1]
* [2], [€]
* [<]
    * 🎥 `External` aktiv?
* [3]
    * FotoMagico (anklicken) sicht- und hörbar?
* [+] Kamera zuschalten - "Stresstest"
    * Report: Markus, in OBS unten rechts angezeigte Werte: cpu, fps, Ampelfarbe und kb/s
* [4]

#### Filme
* [I] Intro sicht- und hörbar?
* [O] Outro sicht- und hörbar?

#### Skype
* [G] \(vorerst schwarzer Kreis)

### Hammerspoon
* \[ctrl]\[alt]\[cmd] & [M]
    * senden der Log- und Konfigurationsdateien

### Skype
#### Skype > Einstellungen > Anrufe > Erweitert
* ☑ `Eingehende Anrufe automatisch annehmen`
* ☑ `Video automatisch starten`
* ☑ `NDI-Nutzung erlauben`

#### Skype > Einstellungen > Audio und Video
* Kamera: `FaceTime HD-Kamera`

* Mikrofon: `Standardgerät`
    * ☐ `Mikrofoneinstellungen automatisch anpassen`
    * 🎚️ ≈ '4' (automatisch durch Hammerspoon)

* Lautsprecher: Standardgerät?
    * 🎚️= `0`

* 'Kostenlosen Testanruf tätigen'
    * NDI Virtual Input (macOS Menüleiste) -> `(Skype - Aktiver Sprecher)`
    * Mithörton? Eigene Stimme hörbar?

### OBS
16:20 Uhr
#### Testanruf Gast?
* [2] und auf Anruf warten
* Zeichen geben und Gast mit [G] zuschalten
* [F], [G] und [H] Kameraposition und Ton prüfen
* Zeichen üben
* [1] und Gespräch beenden

* Report: Markus, in OBS unten rechts angezeigte Werte: cpu, fps, Ampelfarbe und kb/s
* 'Stream beenden'
* [1]
* **Programme geöffnet lassen!**

18:45 Uhr
## Ignition
### Hammerspoon
* \[ctrl]\[alt]\[cmd] & [G]

### FotoMagico
* Startposition [cmd] & [P]

### OBS
* OBS > `Stream starten`
* [1], [2]
* [3]
    * FotoMagico sichtbar?
* [4], [G]
* [1] Mic gemutet?
* Report in OBS unten rechts angezeigte Werte: cpu, fps, Ampelfarbe und kb/s
 
19:00 Uhr
### YouTube
* Stream starten

19:30 Uhr



Einwahl Karo
Allgemein unten
