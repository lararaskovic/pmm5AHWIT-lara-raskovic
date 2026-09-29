> **Kohortenfassung 5AHWIT** — adaptierte Kopie des Masters
> `unterricht/SA-01-datenvisualisierung-ggplot/hausaufgabe.md`.
> Änderungen nur hier, Master bleibt unangetastet.

# Hausaufgabe UE 1 — Daten visualisieren

Name:Lara Raskovic &nbsp;&nbsp;&nbsp; Abgabe: 29.09.2026

**Lektüre:** R4DS 2e, [Kap. 1 Data visualization](https://r4ds.hadley.nz/data-visualize.html)
und [Kap. 2 Workflow: basics](https://r4ds.hadley.nz/workflow-basics.html) —
lies sie zuerst, die Aufgaben bauen darauf auf.

---

## 1. Setup + erstes Ritual

Installiere `tidyverse` und `palmerpenguins` (falls noch nicht geschehen) und
führe aus:

```r
library(tidyverse)
library(palmerpenguins)

glimpse(penguins)
```

- Wie viele Zeilen (Pinguine)? 344 &nbsp; Wie viele Spalten? 8
- Welchen Typ hat `species`? factor &nbsp; `body_mass_g`? numeric (dbl)

---

## 2. Die Einstiegsfrage nachbauen

Baue im **Skript** (nicht in der Konsole!) das Ziel-Bild aus der Stunde nach:

```r
ggplot(penguins,
       aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  labs(x = "Flossengröße (mm)", y = "Körpermasse (g)")
```

- Steigt die Körpermasse mit der Flossengröße für **alle drei Arten**? Die Körpermasse steigt grundsätzlich mit zunehmender Flossenlänge, wobei der Zusammenhang je nach Art unterschiedlich stark ist.
- Welche Art ist am schwersten? Gentoo

---

## 3. Vorhersagen (ohne R — erst hinschreiben!)

**a)** Was unterscheidet diese beiden Zeilen im Ergebnis?

```r
ggplot(penguins, aes(x = species, y = body_mass_g)) + geom_point(color = "red")
ggplot(penguins, aes(x = species, y = body_mass_g, color = species)) + geom_point()
```

Vorhersage: Bei color = "red" erwarte ich, dass alle Punkte rot dargestellt werden. Bei color = species erwarte ich, dass die Punkte je nach Pinguinart unterschiedlich eingefärbt werden.

<br>R-Ergebnis (ausführen und vergleichen): Bei color = "red" sind alle Punkte rot. Bei color = species werden die drei Pinguinarten unterschiedlich eingefärbt und es erscheint eine Legende.

**b)** Was passiert, wenn du das `+` an den Zeilenanfang stellst?

```r
ggplot(penguins, aes(x = body_mass_g))
  + geom_histogram(binwidth = 250)
```

Vorhersage: Ich vermute, dass beide Schreibweisen funktionieren, weil R erkennen könnte, dass das + zum vorherigen ggplot gehört.

<br>R-Ergebnis: Mit + am Ende der vorherigen Zeile wird das Histogramm korrekt erstellt. Steht + am Anfang der nächsten Zeile, kommt es zu einem Fehler. Das + muss also am Ende der vorherigen Zeile stehen.
---

## 4. Eine eigene Frage finden

Wähle zwei Zahlen-Spalten der Pinguine, die dich interessieren, und baue ein
Streudiagramm mit sinnvollen `labs()`-Achsentiteln. Ergänze `geom_smooth()`.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  geom_smooth() +
  labs(
    x = "Flossenlänge (mm)",
    y = "Körpermasse (g)",
    title = "Zusammenhang zwischen Flossenlänge und Körpermasse"
  )

- Deine Frage (in einem Satz): Gibt es einen Zusammenhang zwischen Flossenlänge und Körpermasse?
- Was zeigt der Plot? (2 Sätze): Ja, es gibt einen positiven Zusammenhang. Pinguine mit längeren Flossen sind tendenziell schwerer.

  _________________________________________________

---

## 5. Kapitel-Check (Kap. 2 — Workflow: basics)

Antworte in eigenen Worten (1–2 Sätze je Frage):

- Warum steht das `+` in `ggplot2` **immer am Zeilenende** — was würde auch
  technisch passieren, wenn du es ans Zeilenanfang stellst? Wie meldet sich R?

  Das + zeigt an, dass der ggplot-Befehl noch nicht fertig ist und in der nächsten Zeile ein weiterer Layer hinzugefügt wird. Deshalb sollte das + am Ende der vorherigen Zeile stehen.

- Warum speichert man Werte mit `<-` in einem Skript, statt sie in der
  Konsole direkt auszurechnen?

 Mit <- kann man ein Ergebnis unter einem Namen speichern und später wiederverwenden. Im Skript ist der Code dadurch übersichtlich, nachvollziehbar und kann jederzeit erneut ausgeführt werden.