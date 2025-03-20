# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Lehrstuhl.Repo.insert!(%Lehrstuhl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Lehrstuhl.Repo
alias Lehrstuhl.Persons.Mitarbeiter
alias Lehrstuhl.Persons.Student
alias Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten
alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten
alias Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten
alias Lehrstuhl.Seminare.Seminar
alias Lehrstuhl.Seminare.Seminarergebnis
alias Lehrstuhl.Klausuren.Klausurergebnis
alias Lehrstuhl.Klausuren.Klausur
alias Lehrstuhl.Klausuren
alias Lehrstuhl.Klausuren.Modul
alias Lehrstuhl.Accounts.User
import Bcrypt, only: [hash_pwd_salt: 1]

# Passwort hashen
hashed_password = hash_pwd_salt("password123")

Repo.insert!(%User{
   email: "admin@example.com",
   hashed_password: hashed_password,
   confirmed_at: ~N[2025-02-17 00:00:00]
})

mitarbeiter1 = Repo.insert!(%Mitarbeiter{
  id: "11e68b9e-069e-4e28-96d5-3d85c5849fba",
  email: "johanna.müller@studium.fernuni-hagen.de",
  nachname: "Müller",
  vorname: "Johanna",
  rolle: :wissenschaftlicher_mitarbeiter
})

mitarbeiter2 = Repo.insert!(%Mitarbeiter{
  id: "22e68a9e-069e-4e28-96d5-3d85c5849fbb",
  email: "peter.hansen@studium.fernuni-hagen.de",
  nachname: "Hansen",
  vorname: "Peter",
  rolle: :wissenschaftlicher_mitarbeiter
})

mitarbeiter3 = Repo.insert!(%Mitarbeiter{
  id: "33e68a9e-069e-4e28-96d5-3d85c5849fbc",
  email: "karl.becker@studium.fernuni-hagen.de",
  nachname: "Becker",
  vorname: "Karl",
  rolle: :wissenschaftlicher_mitarbeiter
})

mitarbeiter4 = Repo.insert!(%Mitarbeiter{
  id: "23e58a9e-069e-4e28-96d5-3d85c5849fbc",
  email: "johann.brenner@studium.fernuni-hagen.de",
  nachname: "Brenner",
  vorname: "Johann",
  rolle: :professor
})

mitarbeiter5 = Repo.insert!(%Mitarbeiter{
  id: "31e48a9e-069e-4e28-96d5-3d85c5849fbc",
  email: "leon.fischer@studium.fernuni-hagen.de",
  nachname: "Fischer",
  vorname: "Leon",
  rolle: :wissenschaftlicher_mitarbeiter
})

mitarbeiter6 = Repo.insert!(%Mitarbeiter{
  id: "41e58a9e-069e-4e28-96d5-3d85c5849fbd",
  email: "hannah.schmidt@studium.fernuni-hagen.de",
  nachname: "Schmidt",
  vorname: "Hannah",
  rolle: :nicht_wissenschaftlicher_mitarbeiter
})

mitarbeiter7 = Repo.insert!(%Mitarbeiter{
  id: "51e68a9e-069e-4e28-96d5-3d85c5849fbe",
  email: "max.krause@studium.fernuni-hagen.de",
  nachname: "Krause",
  vorname: "Max",
  rolle: :betreuer
})

mitarbeiter8 = Repo.insert!(%Mitarbeiter{
  id: "61e78a9e-069e-4e28-96d5-3d85c5849fbf",
  email: "lisa.wagner@studium.fernuni-hagen.de",
  nachname: "Wagner",
  vorname: "Lisa",
  rolle: :prüfer
})


# Students

# Bereits vorhandene Studenten
student1 = Repo.insert!(%Student{
  id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1",
  email: "laura.schmidt@studium.fernuni-hagen.de",
  matrikelnummer: "7967990",
  nachname: "Schmidt",
  vorname: "Laura",
  geburtsdatum: ~D[2001-10-12]
})

student2 = Repo.insert!(%Student{
  id: "55e68a9e-069e-4e28-96d5-3d85c5849fb2",
  email: "marcus.bauer@studium.fernuni-hagen.de",
  matrikelnummer: "8887777",
  nachname: "Bauer",
  vorname: "Marcus",
  geburtsdatum: ~D[1980-09-12]
})

student3 = Repo.insert!(%Student{
  id: "44e35a9e-069e-4e28-96d5-3d85c5849fb2",
  email: "sophie.meyer@studium.fernuni-hagen.de",
  matrikelnummer: "1837675",
  nachname: "Meyer",
  vorname: "Sophie",
  geburtsdatum: ~D[1984-02-19]
})

student4 = Repo.insert!(%Student{
  id: "77e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "daniel.fischer@studium.fernuni-hagen.de",
  matrikelnummer: "7647910",
  nachname: "Fischer",
  vorname: "Daniel",
  geburtsdatum: ~D[2000-08-12]
})

student5 = Repo.insert!(%Student{
  id: "97e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "anna.krause@studium.fernuni-hagen.de",
  matrikelnummer: "6767877",
  nachname: "Krause",
  vorname: "Anna",
  geburtsdatum: ~D[1995-08-12]
})

student6 = Repo.insert!(%Student{
  id: "10e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "felix.wagner@studium.fernuni-hagen.de",
  matrikelnummer: "4447227",
  nachname: "Wagner",
  vorname: "Felix",
  geburtsdatum: ~D[1993-07-11]
})

student7 = Repo.insert!(%Student{
  id: "18e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "lena.schneider@studium.fernuni-hagen.de",
  matrikelnummer: "8189911",
  nachname: "Schneider",
  vorname: "Lena",
  geburtsdatum: ~D[1991-03-03]
})

student8 = Repo.insert!(%Student{
  id: "21a12a3e-5c3d-4f44-a13b-9e5f26d1c91e",
  email: "max.mueller@studium.fernuni-hagen.de",
  matrikelnummer: "5632810",
  nachname: "Müller",
  vorname: "Max",
  geburtsdatum: ~D[1998-04-15]
})

student9 = Repo.insert!(%Student{
  id: "32b41b2e-3d7f-4f22-b94b-1a6e72d3c84f",
  email: "julia.hoffmann@studium.fernuni-hagen.de",
  matrikelnummer: "6538921",
  nachname: "Hoffmann",
  vorname: "Julia",
  geburtsdatum: ~D[1997-12-30]
})

student10 = Repo.insert!(%Student{
  id: "ad3fc4f3-cd30-4012-89ef-fc029c0d42a0",
  email: "sebastian.schulz@studium.fernuni-hagen.de",
  matrikelnummer: "7482390",
  nachname: "Schulz",
  vorname: "Sebastian",
  geburtsdatum: ~D[1999-09-05]
})

student11 = Repo.insert!(%Student{
  id: "d3eaf256-ec56-48d4-a829-1a1f8d1aab43",
  email: "sandra.klein@studium.fernuni-hagen.de",
  matrikelnummer: "8291045",
  nachname: "Klein",
  vorname: "Sandra",
  geburtsdatum: ~D[1996-06-21]
})

student12 = Repo.insert!(%Student{
  id: "7d96d8bd-717d-4603-991f-7c4778f9f658",
  email: "lukas.neumann@studium.fernuni-hagen.de",
  matrikelnummer: "9342156",
  nachname: "Neumann",
  vorname: "Lukas",
  geburtsdatum: ~D[1995-11-17]
})

student13 = Repo.insert!(%Student{
  id: "76f85f6e-9c7d-4b66-f57b-5e8fb4d7c420",
  email: "lisa.koch@studium.fernuni-hagen.de",
  matrikelnummer: "1023467",
  nachname: "Koch",
  vorname: "Lisa",
  geburtsdatum: ~D[1994-08-09]
})

student14 = Repo.insert!(%Student{
  id: "a8b32561-63ed-40eb-afad-2b0924450d23",
  email: "tobias.lehmann@studium.fernuni-hagen.de",
  matrikelnummer: "1134568",
  nachname: "Lehmann",
  vorname: "Tobias",
  geburtsdatum: ~D[1993-02-14]
})

student15 = Repo.insert!(%Student{
  id: "697a7678-34ce-4fc1-8371-853ebedb7a99",
  email: "marina.schmidt@studium.fernuni-hagen.de",
  matrikelnummer: "7245789",
  nachname: "Schmidt",
  vorname: "Marina",
  geburtsdatum: ~D[1992-07-22]
})

student16 = Repo.insert!(%Student{
  id: "bea50865-0fe5-4167-804c-c9c2f6fe0e1e",
  email: "kevin.schubert@studium.fernuni-hagen.de",
  matrikelnummer: "9356789",
  nachname: "Schubert",
  vorname: "Kevin",
  geburtsdatum: ~D[1991-05-10]
})

student17 = Repo.insert!(%Student{
  id: "d4717012-d5b4-4ab5-9039-5c917f381115",
  email: "svenja.berger@studium.fernuni-hagen.de",
  matrikelnummer: "4678901",
  nachname: "Berger",
  vorname: "Svenja",
  geburtsdatum: ~D[1990-03-27]
})

student18 = Repo.insert!(%Student{
  id: "bacda517-e1e0-4371-aff6-3a3010cad22e",
  email: "manuel.walter@studium.fernuni-hagen.de",
  matrikelnummer: "7654321",
  nachname: "Walter",
  vorname: "Manuel",
  geburtsdatum: ~D[1989-12-15]
})

student19 = Repo.insert!(%Student{
  id: "6db5632f-a521-465e-9142-13573ab7cb13",
  email: "franziska.huber@studium.fernuni-hagen.de",
  matrikelnummer: "7788990",
  nachname: "Huber",
  vorname: "Franziska",
  geburtsdatum: ~D[1988-10-02]
})

student20 = Repo.insert!(%Student{
  id: "6b03a905-a7cd-4c17-95e3-3ccd889cbebe",
  email: "thomas.maier@studium.fernuni-hagen.de",
  matrikelnummer: "7901234",
  nachname: "Maier",
  vorname: "Thomas",
  geburtsdatum: ~D[1987-08-20]
})

#konkrete Abschlussarbeiten

abstrakte_abschlussarbeit1 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter1.id
})

konkrete_abschlussarbeit1 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "7967990",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2023-06-05],
  abgabedatum: ~D[2023-12-25],
  studienniveau: :bachelor,
  student_id: student1.id,
  mitarbeiter_id: mitarbeiter1.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit1.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7967990",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2024-02-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit1.id
})

abstrakte_abschlussarbeit2 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS22/23",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter2.id
})

konkrete_abschlussarbeit2 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS22/23",
  matrikelnummer: "8887777",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2022-06-05],
  abgabedatum: ~D[2022-12-25],
  studienniveau: :master,
  student_id: student2.id,
  mitarbeiter_id: mitarbeiter2.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit2.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "8887777",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.1,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit2.id
})

abstrakte_abschlussarbeit3 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS22",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter3.id
})

konkrete_abschlussarbeit3 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS22",
  matrikelnummer: "1837675",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2022-06-05],
  abgabedatum: ~D[2022-12-25],
  studienniveau: :bachelor,
  student_id: student3.id,
  mitarbeiter_id: mitarbeiter3.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit3.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1837675",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-07-01],
  note: 2.3,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit3.id
})

abstrakte_abschlussarbeit4 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS23",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter4.id
})

konkrete_abschlussarbeit4 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS23",
  matrikelnummer: "7647910",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2023-06-05],
  abgabedatum: ~D[2023-12-25],
  studienniveau: :bachelor,
  student_id: student4.id,
  mitarbeiter_id: mitarbeiter4.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit4.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7647910",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-05-01],
  note: 2.9,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit4.id
})

abstrakte_abschlussarbeit5 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS23",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter5.id
})

konkrete_abschlussarbeit5 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS23",
  matrikelnummer: "6767877",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2023-02-01],
  abgabedatum: ~D[2023-06-25],
  studienniveau: :master,
  student_id: student5.id,
  mitarbeiter_id: mitarbeiter5.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit5.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6767877",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-03-01],
  note: 2.3,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit5.id
})

abstrakte_abschlussarbeit6 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS22",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter6.id
})

konkrete_abschlussarbeit6 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS22",
  matrikelnummer: "4447227",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2023-02-01],
  abgabedatum: ~D[2023-06-25],
  studienniveau: :bachelor,
  student_id: student6.id,
  mitarbeiter_id: mitarbeiter6.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit6.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "4447227",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-09-01],
  note: 1.7,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit6.id
})

abstrakte_abschlussarbeit7 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS23/24",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter7.id
})

konkrete_abschlussarbeit7 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS23/24",
  matrikelnummer: "8189911",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2023-02-01],
  abgabedatum: ~D[2023-06-25],
  studienniveau: :master,
  student_id: student7.id,
  mitarbeiter_id: mitarbeiter7.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit7.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "8189911",
  studienniveau: :masterarbeit,
  status: :nichtbestanden,
  korrekturdatum: ~D[2024-02-01],
  note: 5.0,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit7.id
})

abstrakte_abschlussarbeit8 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter1.id
})

konkrete_abschlussarbeit8 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  matrikelnummer: "5632810",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-03-22],
  studienniveau: :master,
  student_id: student8.id,
  mitarbeiter_id: mitarbeiter1.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit8.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "5632810",
  studienniveau: :masterarbeit,
  status: :nichtbestanden,
  korrekturdatum: ~D[2022-06-11],
  note: 5.0,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit8.id
})

abstrakte_abschlussarbeit9 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS22/23",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter2.id
})

konkrete_abschlussarbeit9 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS22/23",
  matrikelnummer: "6538921",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-12-01],
  abgabedatum: ~D[2023-01-01],
  studienniveau: :master,
  student_id: student9.id,
  mitarbeiter_id: mitarbeiter2.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit9.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6538921",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.7,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit9.id
})

abstrakte_abschlussarbeit10 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter3.id
})

konkrete_abschlussarbeit10 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "S22",
  matrikelnummer: "7482390",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :bachelor,
  student_id: student10.id,
  mitarbeiter_id: mitarbeiter3.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit10.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7482390",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 2.6,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit10.id
})

abstrakte_abschlussarbeit11 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS23",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter4.id
})

konkrete_abschlussarbeit11 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "8291045",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :bachelor,
  student_id: student11.id,
  mitarbeiter_id: mitarbeiter4.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit11.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "8291045",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.7,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit11.id
})

abstrakte_abschlussarbeit12 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter5.id
})

konkrete_abschlussarbeit12 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  matrikelnummer: "9342156",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :bachelor,
  student_id: student12.id,
  mitarbeiter_id: mitarbeiter5.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit12.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "9342156",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 1.7,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit12.id
})

abstrakte_abschlussarbeit13 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "SS22",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter6.id
})

konkrete_abschlussarbeit13 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "SS22",
  matrikelnummer: "1023467",
  angepasste_themenskizze: "Modellierungsschwierigkeiten",
  gesetzte_schwerpunkte: "Literaturrecherche",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-08-01],
  studienniveau: :master,
  student_id: student13.id,
  mitarbeiter_id: mitarbeiter6.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit13.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1023467",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-08-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit13.id
})

abstrakte_abschlussarbeit14 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter7.id
})

konkrete_abschlussarbeit14 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "1134568",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Literaturrecherche",
  anmeldung_pruefungsamt: ~D[2023-04-01],
  abgabedatum: ~D[2024-01-01],
  studienniveau: :bachelor,
  student_id: student14.id,
  mitarbeiter_id: mitarbeiter7.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit14.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1134568",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2024-02-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit14.id
})

abstrakte_abschlussarbeit15 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter1.id
})

konkrete_abschlussarbeit15 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  matrikelnummer: "7245789",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Literaturrecherche",
  anmeldung_pruefungsamt: ~D[2022-04-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :master,
  student_id: student15.id,
  mitarbeiter_id: mitarbeiter1.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit15.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7245789",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-08-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit15.id
})

abstrakte_abschlussarbeit16 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter2.id
})

konkrete_abschlussarbeit16 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  matrikelnummer: "9356789",
  angepasste_themenskizze: "Optimierung von Datenmodellen",
  gesetzte_schwerpunkte: "Performance",
  anmeldung_pruefungsamt: ~D[2023-07-01],
  abgabedatum: ~D[2023-12-15],
  studienniveau: :bachelor,
  student_id: student16.id,
  mitarbeiter_id: mitarbeiter2.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit16.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "9356789",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2024-01-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit16.id
})

abstrakte_abschlussarbeit17 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS23",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter3.id
})

konkrete_abschlussarbeit17 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS23",
  matrikelnummer: "4678901",
  angepasste_themenskizze: "Entwicklung eines Analysetools",
  gesetzte_schwerpunkte: "Usability",
  anmeldung_pruefungsamt: ~D[2023-03-10],
  abgabedatum: ~D[2023-09-20],
  studienniveau: :master,
  student_id: student17.id,
  mitarbeiter_id: mitarbeiter3.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit17.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "4678901",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-10-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit17.id
})

abstrakte_abschlussarbeit18 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :tool,
  semester: "SS22",
  thema: "TOOL - Web App Development of Tooly, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Tooly mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter4.id
})

konkrete_abschlussarbeit18 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :tool,
  semester: "SS22",
  matrikelnummer: "7654321",
  angepasste_themenskizze: "Automatisierung von Prüfprozessen",
  gesetzte_schwerpunkte: "Skalierbarkeit",
  anmeldung_pruefungsamt: ~D[2022-03-01],
  abgabedatum: ~D[2022-09-15],
  studienniveau: :master,
  student_id: student18.id,
  mitarbeiter_id: mitarbeiter4.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit18.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7654321",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-10-01],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit18.id
})

abstrakte_abschlussarbeit19 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "SS23",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter5.id
})

konkrete_abschlussarbeit19 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "7788990",
  angepasste_themenskizze: "Implementierung von Machine-Learning-Modellen",
  gesetzte_schwerpunkte: "Genauigkeit",
  anmeldung_pruefungsamt: ~D[2023-03-15],
  abgabedatum: ~D[2023-09-30],
  studienniveau: :bachelor,
  student_id: student19.id,
  mitarbeiter_id: mitarbeiter5.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit19.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7788990",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-10-15],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit19.id
})

abstrakte_abschlussarbeit20 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter6.id
})

konkrete_abschlussarbeit20 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "7901234",
  angepasste_themenskizze: "Analyse von Trainingseffekten",
  gesetzte_schwerpunkte: "Datenanalyse",
  anmeldung_pruefungsamt: ~D[2023-06-15],
  abgabedatum: ~D[2023-12-20],
  studienniveau: :bachelor,
  student_id: student20.id,
  mitarbeiter_id: mitarbeiter6.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit20.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7901234",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2024-01-15],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit20.id
})

abstrakte_abschlussarbeit21 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :imp,
  semester: "SS23",
  thema: "IMP - Web App Development of Impy, a web app for software developers",
  themenskizze: "Weiter-Entwicklung der Web-App Impy mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter7.id
})

konkrete_abschlussarbeit21 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "9876543",
  angepasste_themenskizze: "Integration neuer Softwaremodule",
  gesetzte_schwerpunkte: "Modularität",
  anmeldung_pruefungsamt: ~D[2023-04-10],
  abgabedatum: ~D[2023-09-10],
  studienniveau: :master,
  student_id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1",
  mitarbeiter_id: mitarbeiter7.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit21.id
})
Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "9876543",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-10-10],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit21.id
})

abstrakte_abschlussarbeit22 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS23",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter8.id
})

konkrete_abschlussarbeit22 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  matrikelnummer: "6543210",
  angepasste_themenskizze: "Erstellung eines Prüfungsverwaltungstools",
  gesetzte_schwerpunkte: "Benutzeroberfläche",
  anmeldung_pruefungsamt: ~D[2022-10-05],
  abgabedatum: ~D[2023-03-15],
  studienniveau: :bachelor,
  student_id: student19.id,
  mitarbeiter_id: mitarbeiter8.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit22.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6543210",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-04-15],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit22.id
})

abstrakte_abschlussarbeit23 = Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :sport,
  semester: "SS22",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests",
  mitarbeiter_id: mitarbeiter1.id
})

konkrete_abschlussarbeit23 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  matrikelnummer: "3456789",
  angepasste_themenskizze: "Entwicklung eines Feedbacksystems",
  gesetzte_schwerpunkte: "Kundenzufriedenheit",
  anmeldung_pruefungsamt: ~D[2022-02-20],
  abgabedatum: ~D[2022-08-30],
  studienniveau: :master,
  student_id: student20.id,
  mitarbeiter_id: mitarbeiter1.id,
  abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit23.id
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "3456789",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-09-15],
  note: 1.5,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit23.id
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "8765432",
  angepasste_themenskizze: "Entwicklung einer Sportanalyse-Software",
  gesetzte_schwerpunkte: "Präzision",
  anmeldung_pruefungsamt: ~D[2023-06-25],
  abgabedatum: ~D[2023-12-10],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :tool,
  semester: "SS23",
  matrikelnummer: "1122334",
  angepasste_themenskizze: "Design und Implementierung eines Dashboards",
  gesetzte_schwerpunkte: "Visualisierung",
  anmeldung_pruefungsamt: ~D[2023-04-01],
  abgabedatum: ~D[2023-09-15],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "WS22/23",
  matrikelnummer: "2233445",
  angepasste_themenskizze: "Optimierung eines Suchalgorithmus",
  gesetzte_schwerpunkte: "Effizienz",
  anmeldung_pruefungsamt: ~D[2022-11-01],
  abgabedatum: ~D[2023-03-01],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :sport,
  semester: "SS22",
  matrikelnummer: "3344556",
  angepasste_themenskizze: "Analyse von Sportdaten mittels KI",
  gesetzte_schwerpunkte: "Algorithmen",
  anmeldung_pruefungsamt: ~D[2022-03-15],
  abgabedatum: ~D[2022-08-25],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  matrikelnummer: "4455667",
  angepasste_themenskizze: "Evaluierung von Sicherheitssystemen",
  gesetzte_schwerpunkte: "Robustheit",
  anmeldung_pruefungsamt: ~D[2023-07-01],
  abgabedatum: ~D[2023-12-10],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  matrikelnummer: "5566778",
  angepasste_themenskizze: "Entwicklung eines automatisierten Testtools",
  gesetzte_schwerpunkte: "Automatisierung",
  anmeldung_pruefungsamt: ~D[2022-10-20],
  abgabedatum: ~D[2023-03-30],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "6677889",
  angepasste_themenskizze: "Integration eines neuen Datenbanksystems",
  gesetzte_schwerpunkte: "Kompatibilität",
  anmeldung_pruefungsamt: ~D[2023-04-15],
  abgabedatum: ~D[2023-09-25],
  studienniveau: :bachelor
})

konkrete_abschlussarbeit30 = Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS22",
  matrikelnummer: "7788990",
  angepasste_themenskizze: "Entwicklung eines Fitness-Trackers",
  gesetzte_schwerpunkte: "Genauigkeit",
  anmeldung_pruefungsamt: ~D[2022-03-01],
  abgabedatum: ~D[2022-08-20],
  studienniveau: :master
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7788990",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 2.7,
  konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit30.id
})

#Seminare

Repo.insert!(%Seminar{
  titel: "Entwicklung von Informationnssystemen",
    aufnahmekapazitaet: 25,
    semester: "WS24/25",
    praesenzdatum: ~D[2025-02-10],
    ort: "Hagen"
})

Repo.insert!(%Seminar{
  titel: "Künstliche Intelligenz",
    aufnahmekapazitaet: 21,
    semester: "SS25",
    praesenzdatum: ~D[2025-09-12],
    ort: "Hagen"
})

Repo.insert!(%Seminar{
  titel: "Datenbanken und Datenmodelle",
  aufnahmekapazitaet: 30,
  semester: "SS22",
  praesenzdatum: ~D[2022-05-10],
  ort: "Berlin"
})

Repo.insert!(%Seminar{
  titel: "Big Data und Cloud Computing",
  aufnahmekapazitaet: 28,
  semester: "WS22/23",
  praesenzdatum: ~D[2022-12-05],
  ort: "Hamburg"
})

Repo.insert!(%Seminar{
  titel: "Maschinelles Lernen",
  aufnahmekapazitaet: 20,
  semester: "SS23",
  praesenzdatum: ~D[2023-06-15],
  ort: "Köln"
})

Repo.insert!(%Seminar{
  titel: "Webentwicklung und Frameworks",
  aufnahmekapazitaet: 22,
  semester: "WS23/24",
  praesenzdatum: ~D[2023-11-22],
  ort: "Dortmund"
})

Repo.insert!(%Seminar{
  titel: "Ethik der Künstlichen Intelligenz",
  aufnahmekapazitaet: 18,
  semester: "SS24",
  praesenzdatum: ~D[2024-05-20],
  ort: "München"
})

Repo.insert!(%Seminar{
  titel: "Cybersicherheit und Datenschutz",
  aufnahmekapazitaet: 25,
  semester: "WS24/25",
  praesenzdatum: ~D[2024-12-10],
  ort: "Hannover"
})

Repo.insert!(%Seminar{
  titel: "Softwarearchitektur",
  aufnahmekapazitaet: 24,
  semester: "SS25",
  praesenzdatum: ~D[2025-05-18],
  ort: "Frankfurt"
})

Repo.insert!(%Seminar{
  titel: "Robotik und Automatisierung",
  aufnahmekapazitaet: 19,
  semester: "WS25/26",
  praesenzdatum: ~D[2025-11-25],
  ort: "Stuttgart"
})

Repo.insert!(%Seminar{
  titel: "Digitale Transformation",
  aufnahmekapazitaet: 26,
  semester: "SS26",
  praesenzdatum: ~D[2026-06-08],
  ort: "Leipzig"
})

Repo.insert!(%Seminar{
  titel: "Mensch-Maschine-Interaktion",
  aufnahmekapazitaet: 21,
  semester: "SS22",
  praesenzdatum: ~D[2022-04-20],
  ort: "Bonn"
})

Repo.insert!(%Seminar{
  titel: "Kryptographie und Netzwerksicherheit",
  aufnahmekapazitaet: 27,
  semester: "WS22/23",
  praesenzdatum: ~D[2022-11-15],
  ort: "Dresden"
})

Repo.insert!(%Seminar{
  titel: "Mobile App Entwicklung",
  aufnahmekapazitaet: 23,
  semester: "SS23",
  praesenzdatum: ~D[2023-05-25],
  ort: "Karlsruhe"
})

Repo.insert!(%Seminar{
  titel: "Sprachverarbeitung und NLP",
  aufnahmekapazitaet: 20,
  semester: "WS23/24",
  praesenzdatum: ~D[2023-12-01],
  ort: "Würzburg"
})

Repo.insert!(%Seminar{
  titel: "Virtuelle Realität und Augmented Reality",
  aufnahmekapazitaet: 22,
  semester: "SS24",
  praesenzdatum: ~D[2024-05-12],
  ort: "Mannheim"
})

Repo.insert!(%Seminar{
  titel: "Blockchain-Technologie",
  aufnahmekapazitaet: 25,
  semester: "WS24/25",
  praesenzdatum: ~D[2024-12-15],
  ort: "Freiburg"
})

#Seminarergebnisse

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Elixir Basics",
  fachvortrag_datum: ~D[2024-01-15],
  fachvortrag_start: ~T[09:00:00],
  fachvortrag_stop: ~T[10:30:00],
  fachvortrag_notenvorschlag: 1.3,
  fachvortrag_teilnote: 1.3,
  seminararbeit_titel: "Concurrent Programming with Elixir",
  seminararbeit_einreichung: ~D[2024-01-01],
  seminararbeit_notenvorschlag: 1.5,
  seminararbeit_teilnote: 1.5,
  gesamtergebnis: 1.4
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Phoenix Framework",
  fachvortrag_datum: ~D[2024-02-10],
  fachvortrag_start: ~T[11:00:00],
  fachvortrag_stop: ~T[12:30:00],
  fachvortrag_notenvorschlag: 1.0,
  fachvortrag_teilnote: 1.0,
  seminararbeit_titel: "Building Web Applications",
  seminararbeit_einreichung: ~D[2024-01-20],
  seminararbeit_notenvorschlag: 1.2,
  seminararbeit_teilnote: 1.2,
  gesamtergebnis: 1.1
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Functional Programming Concepts",
  fachvortrag_datum: ~D[2024-03-12],
  fachvortrag_start: ~T[13:00:00],
  fachvortrag_stop: ~T[14:30:00],
  fachvortrag_notenvorschlag: 2.0,
  fachvortrag_teilnote: 2.0,
  seminararbeit_titel: "Immutable Data Structures",
  seminararbeit_einreichung: ~D[2024-02-28],
  seminararbeit_notenvorschlag: 1.8,
  seminararbeit_teilnote: 1.8,
  gesamtergebnis: 1.9
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Distributed Systems",
  fachvortrag_datum: ~D[2024-04-05],
  fachvortrag_start: ~T[10:00:00],
  fachvortrag_stop: ~T[11:30:00],
  fachvortrag_notenvorschlag: 1.7,
  fachvortrag_teilnote: 1.7,
  seminararbeit_titel: "Scalable Applications",
  seminararbeit_einreichung: ~D[2024-03-15],
  seminararbeit_notenvorschlag: 1.6,
  seminararbeit_teilnote: 1.6,
  gesamtergebnis: 1.65
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Real-Time Communication",
  fachvortrag_datum: ~D[2024-05-18],
  fachvortrag_start: ~T[15:00:00],
  fachvortrag_stop: ~T[16:30:00],
  fachvortrag_notenvorschlag: 1.4,
  fachvortrag_teilnote: 1.4,
  seminararbeit_titel: "WebSockets with Phoenix",
  seminararbeit_einreichung: ~D[2024-05-01],
  seminararbeit_notenvorschlag: 1.3,
  seminararbeit_teilnote: 1.3,
  gesamtergebnis: 1.35
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Testing Elixir Applications",
  fachvortrag_datum: ~D[2024-06-20],
  fachvortrag_start: ~T[10:00:00],
  fachvortrag_stop: ~T[11:30:00],
  fachvortrag_notenvorschlag: 1.2,
  fachvortrag_teilnote: 1.2,
  seminararbeit_titel: "Test Automation Strategies",
  seminararbeit_einreichung: ~D[2024-06-01],
  seminararbeit_notenvorschlag: 1.1,
  seminararbeit_teilnote: 1.1,
  gesamtergebnis: 1.15
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Advanced Pattern Matching",
  fachvortrag_datum: ~D[2024-07-15],
  fachvortrag_start: ~T[14:00:00],
  fachvortrag_stop: ~T[15:30:00],
  fachvortrag_notenvorschlag: 1.8,
  fachvortrag_teilnote: 1.8,
  seminararbeit_titel: "Patterns in Functional Programming",
  seminararbeit_einreichung: ~D[2024-07-01],
  seminararbeit_notenvorschlag: 1.7,
  seminararbeit_teilnote: 1.7,
  gesamtergebnis: 1.75
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Telemetry in Elixir",
  fachvortrag_datum: ~D[2024-08-22],
  fachvortrag_start: ~T[09:30:00],
  fachvortrag_stop: ~T[11:00:00],
  fachvortrag_notenvorschlag: 1.5,
  fachvortrag_teilnote: 1.5,
  seminararbeit_titel: "Monitoring Applications",
  seminararbeit_einreichung: ~D[2024-08-01],
  seminararbeit_notenvorschlag: 1.4,
  seminararbeit_teilnote: 1.4,
  gesamtergebnis: 1.45
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Metaprogramming in Elixir",
  fachvortrag_datum: ~D[2024-09-10],
  fachvortrag_start: ~T[10:00:00],
  fachvortrag_stop: ~T[11:30:00],
  fachvortrag_notenvorschlag: 1.1,
  fachvortrag_teilnote: 1.1,
  seminararbeit_titel: "Macros and Code Generation",
  seminararbeit_einreichung: ~D[2024-09-01],
  seminararbeit_notenvorschlag: 1.0,
  seminararbeit_teilnote: 1.0,
  gesamtergebnis: 1.05
})

Repo.insert!(%Seminarergebnis{
  fachvortrag_titel: "Erlang Ecosystem",
  fachvortrag_datum: ~D[2024-10-05],
  fachvortrag_start: ~T[09:00:00],
  fachvortrag_stop: ~T[10:30:00],
  fachvortrag_notenvorschlag: 1.9,
  fachvortrag_teilnote: 1.9,
  seminararbeit_titel: "Interoperability in Elixir",
  seminararbeit_einreichung: ~D[2024-09-20],
  seminararbeit_notenvorschlag: 1.8,
  seminararbeit_teilnote: 1.8,
  gesamtergebnis: 1.85
})

#Abstrakte Seminare
