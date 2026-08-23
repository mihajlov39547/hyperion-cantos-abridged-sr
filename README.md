<<<<<<< HEAD
# Hyperion Cantos — Abridged Serbian Reader

A Serbian-language abridged reader project based on **The Hyperion Cantos** by Dan Simmons.

The goal of this project is not to produce a literal translation of the original novels. Instead, it retells the larger narrative in modern, accessible Serbian, with emphasis on:

* characters and their relationships;
* motivations, emotions, conflicts and personal development;
* major events and their consequences;
* the structure and history of the fictional world;
* the mysteries surrounding Hyperion, the Shrike and the Time Tombs;
* the larger political, technological and philosophical conflict of the series.

The project is written as a single connected book divided into four major parts corresponding to the four main novels of the Cantos.

## Structure

### Part I — Hodočasnici

Based on *Hyperion*.

1. Poziv na Hiperion
2. Poslednje hodočašće
3. Sveštenik
4. Vojnik
5. Pesnik
6. Naučnik
7. Detektivka
8. Konzul
9. Dolina Vremenskih grobnica

### Part II — Pad

Based on *The Fall of Hyperion*.

10. Rat za Hiperion
11. Hodočasnici i Šrajk
12. Hegemonija i TehnoCentar
13. Vreme i Grobnice
14. Pad starog poretka
15. Posledice

### Part III — Endimion

Based on *Endymion*.

16. Novi vek
17. Raul i Enea
18. Bekstvo kroz svetove
19. Crkva i carstvo
20. Putovanje i poverenje
21. Povratak na Hiperion

### Part IV — Uspon

Based on *The Rise of Endymion*.

22. Enejina misija
23. Ljubav i izbor
24. Prava priroda sukoba
25. Rasplet svetova
26. Poslednje putovanje
27. Epilog

## Editorial approach

This project follows several basic rules.

The text should read naturally in contemporary Serbian rather than reproduce the syntax of an existing translation.

The narrative should preserve the important events, relationships, motivations, emotional changes and causal connections of the story.

Descriptions, technical explanations and historical digressions may be shortened when they do not materially affect character development or the reader's understanding of later events.

Worldbuilding concepts should be explained when they become relevant instead of being introduced as large blocks of exposition.

Important mysteries should not be explained earlier than the story itself reveals them.

Characters should retain their contradictions, weaknesses, motivations and emotional complexity even when their individual stories are substantially shortened.

The aim is therefore not to create a synopsis, but a shorter narrative that can still be read as a continuous novel.

## Language

The manuscript is written primarily in Serbian Latin script.

The preferred style is:

* contemporary Serbian;
* predominantly perfect tense;
* clear and natural sentence structure;
* restrained use of archaic or literary constructions;
* terminology kept consistent throughout the four parts.

Names and established fictional terms are tracked separately to preserve continuity.

## Project layout

```text
.
├── main.tex
├── preamble.tex
├── build.ps1
├── README.md
├── LICENSE
├── STYLE_GUIDE.md
├── AGENT_PROMPT.md
│
├── parts/
│   ├── hyperion.tex
│   ├── fall-of-hyperion.tex
│   ├── endymion.tex
│   └── rise-of-endymion.tex
│
├── chapters/
│   └── ...
│
└── notes/
    ├── characters.tex
    └── world.tex
```

## Building the book

The project uses XeLaTeX.

On Windows, run:

```powershell
.\build.ps1
```

To build and immediately open the generated PDF:

```powershell
.\build.ps1 -Open
```

To remove auxiliary LaTeX files:

```powershell
.\build.ps1 -Clean
```

The resulting book is generated as:

```text
main.pdf
```

## Working method

Each chapter is developed separately.

Before writing a chapter, the relevant section of the source material is reviewed and reduced to five questions:

1. What changes in the plot?
2. What does the reader learn about the characters?
3. What changes emotionally?
4. What new information about the world is necessary?
5. What information becomes important later?

Material that does not contribute meaningfully to one of those areas is a candidate for compression or omission.

Continuity notes for characters, terminology and worldbuilding are maintained throughout the project.

## Status

Work in progress.

The project is being written chapter by chapter, beginning with **Part I — Hodočasnici**.

## Copyright notice

This is an unofficial, non-commercial fan and reader project inspired by **The Hyperion Cantos** by Dan Simmons.

*Hyperion*, *The Fall of Hyperion*, *Endymion*, *The Rise of Endymion*, and all characters, settings, story elements and other original material from those works remain the property of their respective copyright holders.

This repository does not claim ownership of the underlying novels.

The MIT License included in this repository applies only to original project tooling such as LaTeX templates, build scripts and configuration files. It does **not** grant rights to reproduce, distribute or commercially exploit material derived from the original novels.

Original ebook, TXT, PDF or scanned copies of the novels should not be committed to this repository.
=======
# Hiperion — abridged LaTeX projekat

Ovo je početni projekat za jednu povezanu, skraćenu verziju četiri romana ciklusa Hyperion Cantos.

## Struktura
- `main.tex` — glavni dokument
- `preamble.tex` — LaTeX podešavanja
- `metadata.tex` — naslov i metapodaci
- `parts/` — četiri velika dela
- `chapters/` — poglavlja koja obrađujemo jedno po jedno
- `notes/characters.tex` — kontinuitet likova i njihovih motivacija
- `notes/world.tex` — kontinuitet sveta i termina
- `STYLE_GUIDE.md` — pravila prerade
- `AGENT_PROMPT.md` — gotov prompt za agenta

## Kompajliranje
Preporučeno: XeLaTeX ili LuaLaTeX.

Primer:

```bash
xelatex main.tex
xelatex main.tex
```

Dva prolaza su korisna zbog sadržaja i referenci.

## Predloženi način rada
1. Uzeti samo jedno poglavlje.
2. Napraviti kratak plan događaja i emocionalnih lukova.
3. Napisati skraćenu verziju u odgovarajući `.tex` fajl.
4. Proveriti kontinuitet termina i likova.
5. Tek onda preći na sledeće poglavlje.

## Napomena
Ovaj projekat je zamišljen kao transformativna, skraćena prerada za ličnu upotrebu. Izvorni tekst ne treba kopirati u dužim blokovima; sadržaj treba prepričavati i redigovati sopstvenim rečima.
>>>>>>> d6c56df (initial commit)
