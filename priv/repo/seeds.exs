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


Repo.insert!(%Mitarbeiter{
  id: "11e68b9e-069e-4e28-96d5-3d85c5849fba",
  email: "mitarbeiter@eins.de",
  nachname: "müller",
  vorname: "johanna",
  rolle: :wissenschaftlicher_mitarbeiter
})

Repo.insert!(%Mitarbeiter{
  id: "22e68a9e-069e-4e28-96d5-3d85c5849fbb",
  email: "mitarbeiter@zwei.de",
  nachname: "hansen",
  vorname: "peter",
  rolle: :wissenschaftlicher_mitarbeiter
})

Repo.insert!(%Mitarbeiter{
  id: "33e68a9e-069e-4e28-96d5-3d85c5849fbc",
  email: "mitarbeiter@drei.de",
  nachname: "becker",
  vorname: "karl",
  rolle: :wissenschaftlicher_mitarbeiter
})

Repo.insert!(%Mitarbeiter{
  id: "23e58a9e-069e-4e28-96d5-3d85c5849fbc",
  email: "mitarbeiter@vier.de",
  nachname: "brenner",
  vorname: "johann",
  rolle: :professor
})

Repo.insert!(%Mitarbeiter{
  id: "31e48a9e-069e-4e28-96d5-3d85c5849fbc",
  email: "mitarbeiter@fünf.de",
  nachname: "fischer",
  vorname: "leon",
  rolle: :wissenschaftlicher_mitarbeiter
})


# Students

Repo.insert!(%Student{
  id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1",
  email: "student@eins.de",
  matrikelnummer: "7967990",
  nachname: "Student",
  vorname: "Eins",
  geburtsdatum: ~D[2001-10-12]
})

Repo.insert!(%Student{
  id: "55e68a9e-069e-4e28-96d5-3d85c5849fb2",
  email: "student@zwei.de",
  matrikelnummer: "8887777",
  nachname: "Student",
  vorname: "Zwei",
  geburtsdatum: ~D[1980-09-12]
})

Repo.insert!(%Student{
  id: "44e35a9e-069e-4e28-96d5-3d85c5849fb2",
  email: "student@drei.de",
  matrikelnummer: "1837675",
  nachname: "Student",
  vorname: "Drei",
  geburtsdatum: ~D[1984-02-19]
})


Repo.insert!(%Student{
  id: "77e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "student@vier.de",
  matrikelnummer: "7647910",
  nachname: "Student",
  vorname: "Vier",
  geburtsdatum: ~D[2000-08-12]
})

Repo.insert!(%Student{
  id: "97e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "student@fünf.de",
  matrikelnummer: "6767877",
  nachname: "Student",
  vorname: "Fünf",
  geburtsdatum: ~D[1995-08-12]
})

Repo.insert!(%Student{
  id: "10e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "student@sechs.de",
  matrikelnummer: "4447227",
  nachname: "Student",
  vorname: "Sechs",
  geburtsdatum: ~D[1993-07-11]
})

Repo.insert!(%Student{
  id: "18e68a9e-069e-4e28-96d5-3d85c5849fb3",
  email: "student@sieben.de",
  matrikelnummer: "8189911",
  nachname: "Student",
  vorname: "Sieben",
  geburtsdatum: ~D[1991-03-03]
})

#Abstrakte Abschlussarbeiten

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS22/23",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS23",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS23/24",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Moderne Softwarearchitekturen für webbasierte Anwendungen: Untersuchung von Build-Prozessen mit Jenkins (u.a. mit Docker und NPM) sowie Migrationsstrategien (u.a. Aktualisierung von JavaScript-Frameworks)"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS23/24",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Weiterentwicklung und Erprobung eines Natural Language Processing (NLP) Assistenten für die Identifikation von gehaltvollen Bezeichnern für Entitätstypen, Beziehungstypen und zugehörige Attribute..."
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS22",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Evaluation eines Natural Language Processing (NLP)-basierten Feedback-Assistenten für die Identifikation von gehaltvollen Bezeichnern für Modellelemente in Datenmodellen"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Beispielhafte Rekonstruktion eines Geschäftsprozessmodells mit der Business Process Model and Notation (BPMN 2.0) in TOOL unter Einbeziehung einer natürlichsprachlichen Sachverhaltsbeschreibung bzw. eines entsprechenden Referenzmodells"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  thema: "Individual Modeling Processes",
  themenskizze: "Modellierungsschwierigkeiten von Experten und Novizen"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  thema: "Individual Modeling Processes",
  themenskizze: "Modellierungsschwierigkeiten bei der Erstellung von Datenmodellen"
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "7647910",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2023-06-05],
  abgabedatum: ~D[2023-12-25],
  studienniveau: :bachelor
})


Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS22/23",
  matrikelnummer: "8889911",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2022-06-05],
  abgabedatum: ~D[2022-12-25],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS22",
  matrikelnummer: "7997910",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2023-06-05],
  abgabedatum: ~D[2023-12-25],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "SS23",
  matrikelnummer: "7966910",
  angepasste_themenskizze: "Erstellung einer Verwaltung von Gebühren",
  gesetzte_schwerpunkte: "Funktionalität",
  anmeldung_pruefungsamt: ~D[2023-06-05],
  abgabedatum: ~D[2023-12-25],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS23",
  matrikelnummer: "8189911",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2023-02-01],
  abgabedatum: ~D[2023-06-25],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS22",
  matrikelnummer: "7967990",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2023-02-01],
  abgabedatum: ~D[2023-06-25],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS23/24",
  matrikelnummer: "8867110",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2023-02-01],
  abgabedatum: ~D[2023-06-25],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  matrikelnummer: "4112250",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Funktionalität und Erscheinung",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-03-22],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS22/23",
  matrikelnummer: "6767877",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-12-01],
  abgabedatum: ~D[2023-01-01],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "S22",
  matrikelnummer: "6667777",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "4447227",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  matrikelnummer: "8887777",
  angepasste_themenskizze: "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
  gesetzte_schwerpunkte: "Auswertung von Daten",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "SS22",
  matrikelnummer: "1247527",
  angepasste_themenskizze: "Modellierungsschwierigkeiten",
  gesetzte_schwerpunkte: "Literaturrecherche",
  anmeldung_pruefungsamt: ~D[2022-02-01],
  abgabedatum: ~D[2022-08-01],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "8681732",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Literaturrecherche",
  anmeldung_pruefungsamt: ~D[2023-04-01],
  abgabedatum: ~D[2024-01-01],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  matrikelnummer: "9641742",
  angepasste_themenskizze: "Erstellung einer neuen Zeichenfunktion",
  gesetzte_schwerpunkte: "Literaturrecherche",
  anmeldung_pruefungsamt: ~D[2022-04-01],
  abgabedatum: ~D[2022-01-01],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "WS23/24",
  matrikelnummer: "7641234",
  angepasste_themenskizze: "Optimierung von Datenmodellen",
  gesetzte_schwerpunkte: "Performance",
  anmeldung_pruefungsamt: ~D[2023-07-01],
  abgabedatum: ~D[2023-12-15],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS23",
  matrikelnummer: "8812345",
  angepasste_themenskizze: "Entwicklung eines Analysetools",
  gesetzte_schwerpunkte: "Usability",
  anmeldung_pruefungsamt: ~D[2023-03-10],
  abgabedatum: ~D[2023-09-20],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS22/23",
  matrikelnummer: "7995678",
  angepasste_themenskizze: "Entwicklung einer mobilen Fitness-App",
  gesetzte_schwerpunkte: "Benutzerfreundlichkeit",
  anmeldung_pruefungsamt: ~D[2022-09-15],
  abgabedatum: ~D[2023-03-25],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :tool,
  semester: "SS22",
  matrikelnummer: "7654321",
  angepasste_themenskizze: "Automatisierung von Prüfprozessen",
  gesetzte_schwerpunkte: "Skalierbarkeit",
  anmeldung_pruefungsamt: ~D[2022-03-01],
  abgabedatum: ~D[2022-09-15],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "7788990",
  angepasste_themenskizze: "Implementierung von Machine-Learning-Modellen",
  gesetzte_schwerpunkte: "Genauigkeit",
  anmeldung_pruefungsamt: ~D[2023-03-15],
  abgabedatum: ~D[2023-09-30],
  studienniveau: :bachelor
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "8887777",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 2.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6763877",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-08-01],
  note: 1.5
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "4323550",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.1
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "8867110",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-07-01],
  note: 2.3
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "8189911",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-05-01],
  note: 2.9
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "4447227",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-03-01],
  note: 2.3
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1667997",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2020-09-01],
  note: 1.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6167773",
  studienniveau: :masterarbeit,
  status: :nichtbestanden,
  korrekturdatum: ~D[2019-02-01],
  note: 5.0
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1332787",
  studienniveau: :bachelorarbeit,
  status: :nichtbestanden,
  korrekturdatum: ~D[2022-06-11],
  note: 5.0
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6197877",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-02-01],
  note: 2.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "5157777",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 2.6
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6317777",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-02-01],
  note: 2.4
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6617757",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "2214477",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 1.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "34164877",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 1.5
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "4317757",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-09-06],
  note: 2.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1664777",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 2.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6747817",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-08-01],
  note: 1.5
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1327450",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.1
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1967210",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-07-01],
  note: 2.3
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "1859911",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-05-01],
  note: 2.9
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6167999",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-03-01],
  note: 2.3
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6661997",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2020-09-01],
  note: 1.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6767877",
  studienniveau: :masterarbeit,
  status: :nichtbestanden,
  korrekturdatum: ~D[2019-02-01],
  note: 5.0
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "9362787",
  studienniveau: :bachelorarbeit,
  status: :nichtbestanden,
  korrekturdatum: ~D[2022-06-11],
  note: 5.0
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6297677",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-02-01],
  note: 2.7
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "5554777",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 2.6
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6363777",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2021-02-01],
  note: 2.2
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "6655757",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-02-01],
  note: 2.1
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "2263477",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 1.4
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "7967110",
  studienniveau: :masterarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2022-02-01],
  note: 1.3
})

Repo.insert!(%ErgebnisseAbschlussarbeiten{
  matrikelnummer: "4361757",
  studienniveau: :bachelorarbeit,
  status: :bestanden,
  korrekturdatum: ~D[2023-09-06],
  note: 2.0
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  matrikelnummer: "1234567",
  angepasste_themenskizze: "Analyse von Trainingseffekten",
  gesetzte_schwerpunkte: "Datenanalyse",
  anmeldung_pruefungsamt: ~D[2023-06-15],
  abgabedatum: ~D[2023-12-20],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :imp,
  semester: "SS23",
  matrikelnummer: "9876543",
  angepasste_themenskizze: "Integration neuer Softwaremodule",
  gesetzte_schwerpunkte: "Modularität",
  anmeldung_pruefungsamt: ~D[2023-04-10],
  abgabedatum: ~D[2023-09-10],
  studienniveau: :master
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  matrikelnummer: "6543210",
  angepasste_themenskizze: "Erstellung eines Prüfungsverwaltungstools",
  gesetzte_schwerpunkte: "Benutzeroberfläche",
  anmeldung_pruefungsamt: ~D[2022-10-05],
  abgabedatum: ~D[2023-03-15],
  studienniveau: :bachelor
})

Repo.insert!(%KonkreteAbschlussarbeiten{
  betreuer: :müller,
  forschungsprojekt: :imp,
  semester: "SS22",
  matrikelnummer: "3456789",
  angepasste_themenskizze: "Entwicklung eines Feedbacksystems",
  gesetzte_schwerpunkte: "Kundenzufriedenheit",
  anmeldung_pruefungsamt: ~D[2022-02-20],
  abgabedatum: ~D[2022-08-30],
  studienniveau: :master
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

Repo.insert!(%KonkreteAbschlussarbeiten{
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
