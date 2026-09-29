> **Kohortenfassung 5AHWIT** — adaptierte Kopie des Masters
> `unterricht/SA-02-daten-transformieren-dplyr/hausaufgabe.md`.
> Änderungen nur hier, Master bleibt unangetastet.

# Hausaufgabe UE 2 — Daten transformieren & Workflow

Name: Lara Raskovic &nbsp;&nbsp;&nbsp; Abgabe: 29.09.2026

**Lektüre:** R4DS 2e, [Kap. 3 Data transformation](https://r4ds.hadley.nz/data-transform.html)
(Pflicht) sowie [Kap. 4 Code style](https://r4ds.hadley.nz/workflow-style.html) und
[Kap. 6 Scripts and projects](https://r4ds.hadley.nz/workflow-scripts.html) —
Aufgabe 5 bezieht sich auf Kapitel 4 und 6.

---

## 1. Vorhersagen (ohne R — erst hinschreiben!)

**a)**

```r
penguins |> filter(species == "Gentoo") |> nrow()
```

Vorhersage (Zeilenzahl): Es werden die Gentoo-Pinguine herausgefiltert und anschließend wird ihre Anzahl ausgegeben.
<br>R-Ergebnis: 124

**b)**

```r
penguins |> select(species == "Gentoo") |> nrow()
```

Vorhersage: Was passiert hier überhaupt? ch vermute, dass hier ebenfalls die Anzahl der Gentoo-Pinguine ausgegeben wird.
<br>R-Ergebnis: Es kommt nicht zu 124, weil select() keine Pinguine nach species filtert, sondern versucht, eine Spaltenauswahl vorzunehmen.

**c)**

```r
penguins |> summarise(gram = mean(body_mass_g))
```

Vorhersage: Es wird die durchschnittliche Körpermasse aller Pinguine berechnet. &nbsp; Warum ist das Ergebnis so?

_________________________________________________
<br>R-Ergebnis: Das Ergebnis ist NA, weil body_mass_g fehlende Werte (NA) enthält und mean() diese standardmäßig nicht ignoriert.

---

## 2. Pipe bauen: schwere Gentoo

Schreibe eine Pipe, die alle Gentoo mit `body_mass_g > 5000` zählt und ihre
drei schwersten mit `species`, `island`, `body_mass_g` zeigt:

```r
penguins |>
  filter(species == "Gentoo", body_mass_g > 5000) |>
   arrange(desc(body_mass_g)) |>
  head(3)
```

- Wie viele Gentoo sind es? 3

---

## 3. Die Antwort-Tabelle nachbauen

Baue die Tabelle aus der Stunde nach — pro `species` und `island`:
Anzahl, Mittelwert und Standardabweichung von `body_mass_g`:

```r
penguins |>
  group_by(species, island) |>
  summarise(
    n    = n(),
    gram = mean(body_mass_g, na.rm = TRUE),
    sd_g = sd(body_mass_g, na.rm = TRUE)
  )
```

- Welche Gruppe ist die schwerste? Gentoo auf Biscoe
- Welche Gruppe hat die kleinste Streuung? Chinstrap auf Dream

---

## 4. mutate mit Betriebskontext

Eine Messreihe kam in Gramm, die Norm will Kilogramm mit **einer** Nachkommastelle:

```r
penguins |>
  mutate(kg = round(body_mass_g / 1000, 1)) |>
  select(species, kg) |>
  head(3)
```

- Was passiert mit dem ersten `NA`-Pinguin in dieser Spalte? Das NA bleibt auch in kg ein NA, weil aus einem fehlenden Wert keine Kilogramm-Angabe berechnet werden kann.
- Warum ist `mutate()` hier besser, als die Zahl „im Kopf" zu dividieren
  (2 Sätze)? mutate() erstellt eine neue Spalte und führt die Umrechnung für alle Werte automatisch durch. Dadurch bleibt die ursprüngliche Messung erhalten und die Berechnung ist nachvollziehbar.

---

## 5. Kapitel-Check (Kap. 4 + 6)

**a)** Nenne zwei Code-Stil-Regeln aus Kap. 4, die in Aufgabe 2 und 3 von dir
angewendet wurden — und jeweils ein Beispiel aus deinem eigenen Code:

1.Native Pipe |>

Regel: Die native Pipe |> verwenden.
Beispiel: penguins |> filter(...) |> arrange(...)
2. Aussagekräftige Namen verwenden

Regel: Variablen und Spalten sollen verständliche Namen haben.
Beispiel: body_mass_g, gram und sd_g

**b)** Lege ein RStudio-**Projekt** namens `pmm-ue02` an, speichere dein Skript
darin als `analyse.R` und habe alle Hausaufgaben-Pipes in diesem Skript.
Führe das Skript mit `Ctrl + Shift + S` komplett aus — gibt es eine
Fehlermeldung? Wenn ja: was sagt sie?

Fehlermeldung (falls ja): Keine. Das Skript wurde ohne Fehlermeldung ausgeführt. Es wurden jedoch 11 Warnungen angezeigt.
