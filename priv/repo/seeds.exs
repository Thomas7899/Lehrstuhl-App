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

Repo.insert!(%Mitarbeiter{
  id: "11e68a9e-069e-4e28-96d5-3d85c5849fba",
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

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :hansen,
  forschungsprojekt: :sport,
  semester: "WS23/24",
  thema: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
  themenskizze: "Weiter-Entwicklung der Web-App Sportyweb mit Elixir/Phoenix, PostgreSQL, TailwindCSS – Ausgewählte Features & Feature Requests"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS22/23",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Weiterentwicklung und Erprobung des grafischen BPMN 2.0-Editors sowie der korrespondierenden implementierten Sprachspezifikation in TOOL"
})

Repo.insert!(%AbstrakteAbschlussarbeiten{
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "SS23",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Weiterentwicklung und Erprobung des grafischen ERM-Editors sowie der korrespondierenden implementierten Sprachspezifikation in TOOL"
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
  semester: "WS22/23",
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
  betreuer: :becker,
  forschungsprojekt: :tool,
  semester: "WS23/24",
  thema: "TOOL - A web browser-based modeling tool and observatory",
  themenskizze: "Entwicklung einer Softwaredokumentationsstrategie für TOOL basierend auf dem C4-Modell"
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
