defmodule Lehrstuhl.SeedsRuntime do
  alias Lehrstuhl.Repo

  alias Lehrstuhl.Persons.{Mitarbeiter, Student}

  alias Lehrstuhl.Abschlussarbeiten.{
    AbstrakteAbschlussarbeiten,
    KonkreteAbschlussarbeiten,
    ErgebnisseAbschlussarbeiten
  }

  alias Lehrstuhl.Seminare.{AbstraktesSeminar, Seminar, Seminarergebnis}
  alias Lehrstuhl.Klausuren.{Klausurergebnis, Klausur, Modul}
  alias Lehrstuhl.Accounts.User

  import Ecto.Query
  import Bcrypt, only: [hash_pwd_salt: 1]

  def run do
    #
    # ------------------------------------------------------------
    # Cleanup
    # ------------------------------------------------------------
    #
    Repo.delete_all(Klausurergebnis)
    Repo.delete_all(Klausur)
    Repo.delete_all(Modul)
    Repo.delete_all(Seminarergebnis)
    Repo.delete_all(Seminar)
    Repo.delete_all(AbstraktesSeminar)
    Repo.delete_all(ErgebnisseAbschlussarbeiten)
    Repo.delete_all(KonkreteAbschlussarbeiten)
    Repo.delete_all(AbstrakteAbschlussarbeiten)
    Repo.delete_all(Student)
    Repo.delete_all(Mitarbeiter)
    Repo.delete_all(User)

    #
    # ------------------------------------------------------------
    # User
    # ------------------------------------------------------------
    #
    hashed_password = hash_pwd_salt("password123")

    Repo.insert!(%User{
      email: "admin@example.com",
      hashed_password: hashed_password,
      confirmed_at: ~N[2025-02-17 00:00:00]
    })

    #
    # ------------------------------------------------------------
    # Mitarbeiter
    # ------------------------------------------------------------
    #
    mitarbeiter1 =
      Repo.insert!(%Mitarbeiter{
        id: "11e68b9e-069e-4e28-96d5-3d85c5849fba",
        email: "johanna.müller@studium.fernuni-hagen.de",
        nachname: "Müller",
        vorname: "Johanna",
        rolle: :wissenschaftlicher_mitarbeiter
      })

    mitarbeiter2 =
      Repo.insert!(%Mitarbeiter{
        id: "22e68a9e-069e-4e28-96d5-3d85c5849fbb",
        email: "peter.hansen@studium.fernuni-hagen.de",
        nachname: "Hansen",
        vorname: "Peter",
        rolle: :wissenschaftlicher_mitarbeiter
      })

    mitarbeiter3 =
      Repo.insert!(%Mitarbeiter{
        id: "33e68a9e-069e-4e28-96d5-3d85c5849fbc",
        email: "karl.becker@studium.fernuni-hagen.de",
        nachname: "Becker",
        vorname: "Karl",
        rolle: :wissenschaftlicher_mitarbeiter
      })

    mitarbeiter4 =
      Repo.insert!(%Mitarbeiter{
        id: "23e58a9e-069e-4e28-96d5-3d85c5849fbc",
        email: "johann.brenner@studium.fernuni-hagen.de",
        nachname: "Brenner",
        vorname: "Johann",
        rolle: :professor
      })

    mitarbeiter5 =
      Repo.insert!(%Mitarbeiter{
        id: "31e48a9e-069e-4e28-96d5-3d85c5849fbc",
        email: "leon.fischer@studium.fernuni-hagen.de",
        nachname: "Fischer",
        vorname: "Leon",
        rolle: :wissenschaftlicher_mitarbeiter
      })

    mitarbeiter6 =
      Repo.insert!(%Mitarbeiter{
        id: "41e58a9e-069e-4e28-96d5-3d85c5849fbd",
        email: "hannah.schmidt@studium.fernuni-hagen.de",
        nachname: "Schmidt",
        vorname: "Hannah",
        rolle: :nicht_wissenschaftlicher_mitarbeiter
      })

    mitarbeiter7 =
      Repo.insert!(%Mitarbeiter{
        id: "51e68a9e-069e-4e28-96d5-3d85c5849fbe",
        email: "max.krause@studium.fernuni-hagen.de",
        nachname: "Krause",
        vorname: "Max",
        rolle: :betreuer
      })

    mitarbeiter8 =
      Repo.insert!(%Mitarbeiter{
        id: "61e78a9e-069e-4e28-96d5-3d85c5849fbf",
        email: "lisa.wagner@studium.fernuni-hagen.de",
        nachname: "Wagner",
        vorname: "Lisa",
        rolle: :prüfer
      })

    # zusätzliche, aber thematisch passende Rollen
    mitarbeiter9 =
      Repo.insert!(%Mitarbeiter{
        id: "71f88a9e-069e-4e28-96d5-3d85c5849fbf",
        email: "tina.reichert@studium.fernuni-hagen.de",
        nachname: "Reichert",
        vorname: "Tina",
        rolle: :wissenschaftlicher_mitarbeiter
      })

    mitarbeiter10 =
      Repo.insert!(%Mitarbeiter{
        id: "81f98a9e-069e-4e28-96d5-3d85c5849fbf",
        email: "oliver.simon@studium.fernuni-hagen.de",
        nachname: "Simon",
        vorname: "Oliver",
        rolle: :betreuer
      })

    #
    # ------------------------------------------------------------
    # Studenten
    # ------------------------------------------------------------
    #
    student1 =
      Repo.insert!(%Student{
        id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1",
        email: "laura.schmidt@studium.fernuni-hagen.de",
        matrikelnummer: "7967990",
        nachname: "Schmidt",
        vorname: "Laura",
        geburtsdatum: ~D[2001-10-12]
      })

    student2 =
      Repo.insert!(%Student{
        id: "55e68a9e-069e-4e28-96d5-3d85c5849fb2",
        email: "marcus.bauer@studium.fernuni-hagen.de",
        matrikelnummer: "8887777",
        nachname: "Bauer",
        vorname: "Marcus",
        geburtsdatum: ~D[1980-09-12]
      })

    student3 =
      Repo.insert!(%Student{
        id: "44e35a9e-069e-4e28-96d5-3d85c5849fb2",
        email: "sophie.meyer@studium.fernuni-hagen.de",
        matrikelnummer: "1837675",
        nachname: "Meyer",
        vorname: "Sophie",
        geburtsdatum: ~D[1984-02-19]
      })

    student4 =
      Repo.insert!(%Student{
        id: "77e68a9e-069e-4e28-96d5-3d85c5849fb3",
        email: "daniel.fischer@studium.fernuni-hagen.de",
        matrikelnummer: "7647910",
        nachname: "Fischer",
        vorname: "Daniel",
        geburtsdatum: ~D[2000-08-12]
      })

    student5 =
      Repo.insert!(%Student{
        id: "97e68a9e-069e-4e28-96d5-3d85c5849fb3",
        email: "anna.krause@studium.fernuni-hagen.de",
        matrikelnummer: "6767877",
        nachname: "Krause",
        vorname: "Anna",
        geburtsdatum: ~D[1995-08-12]
      })

    student6 =
      Repo.insert!(%Student{
        id: "10e68a9e-069e-4e28-96d5-3d85c5849fb3",
        email: "felix.wagner@studium.fernuni-hagen.de",
        matrikelnummer: "4447227",
        nachname: "Wagner",
        vorname: "Felix",
        geburtsdatum: ~D[1993-07-11]
      })

    student7 =
      Repo.insert!(%Student{
        id: "18e68a9e-069e-4e28-96d5-3d85c5849fb3",
        email: "lena.schneider@studium.fernuni-hagen.de",
        matrikelnummer: "8189911",
        nachname: "Schneider",
        vorname: "Lena",
        geburtsdatum: ~D[1991-03-03]
      })

    student8 =
      Repo.insert!(%Student{
        id: "21a12a3e-5c3d-4f44-a13b-9e5f26d1c91e",
        email: "max.mueller@studium.fernuni-hagen.de",
        matrikelnummer: "5632810",
        nachname: "Müller",
        vorname: "Max",
        geburtsdatum: ~D[1998-04-15]
      })

    student9 =
      Repo.insert!(%Student{
        id: "32b41b2e-3d7f-4f22-b94b-1a6e72d3c84f",
        email: "julia.hoffmann@studium.fernuni-hagen.de",
        matrikelnummer: "6538921",
        nachname: "Hoffmann",
        vorname: "Julia",
        geburtsdatum: ~D[1997-12-30]
      })

    student10 =
      Repo.insert!(%Student{
        id: "ad3fc4f3-cd30-4012-89ef-fc029c0d42a0",
        email: "sebastian.schulz@studium.fernuni-hagen.de",
        matrikelnummer: "7482390",
        nachname: "Schulz",
        vorname: "Sebastian",
        geburtsdatum: ~D[1999-09-05]
      })

    student11 =
      Repo.insert!(%Student{
        id: "d3eaf256-ec56-48d4-a829-1a1f8d1aab43",
        email: "sandra.klein@studium.fernuni-hagen.de",
        matrikelnummer: "8291045",
        nachname: "Klein",
        vorname: "Sandra",
        geburtsdatum: ~D[1996-06-21]
      })

    student12 =
      Repo.insert!(%Student{
        id: "7d96d8bd-717d-4603-991f-7c4778f9f658",
        email: "lukas.neumann@studium.fernuni-hagen.de",
        matrikelnummer: "9342156",
        nachname: "Neumann",
        vorname: "Lukas",
        geburtsdatum: ~D[1995-11-17]
      })

    student13 =
      Repo.insert!(%Student{
        id: "76f85f6e-9c7d-4b66-f57b-5e8fb4d7c420",
        email: "lisa.koch@studium.fernuni-hagen.de",
        matrikelnummer: "1023467",
        nachname: "Koch",
        vorname: "Lisa",
        geburtsdatum: ~D[1994-08-09]
      })

    student14 =
      Repo.insert!(%Student{
        id: "a8b32561-63ed-40eb-afad-2b0924450d23",
        email: "tobias.lehmann@studium.fernuni-hagen.de",
        matrikelnummer: "1134568",
        nachname: "Lehmann",
        vorname: "Tobias",
        geburtsdatum: ~D[1993-02-14]
      })

    student15 =
      Repo.insert!(%Student{
        id: "697a7678-34ce-4fc1-8371-853ebedb7a99",
        email: "marina.schmidt@studium.fernuni-hagen.de",
        matrikelnummer: "7245789",
        nachname: "Schmidt",
        vorname: "Marina",
        geburtsdatum: ~D[1992-07-22]
      })

    student16 =
      Repo.insert!(%Student{
        id: "bea50865-0fe5-4167-804c-c9c2f6fe0e1e",
        email: "kevin.schubert@studium.fernuni-hagen.de",
        matrikelnummer: "9356789",
        nachname: "Schubert",
        vorname: "Kevin",
        geburtsdatum: ~D[1991-05-10]
      })

    student17 =
      Repo.insert!(%Student{
        id: "d4717012-d5b4-4ab5-9039-5c917f381115",
        email: "svenja.berger@studium.fernuni-hagen.de",
        matrikelnummer: "4678901",
        nachname: "Berger",
        vorname: "Svenja",
        geburtsdatum: ~D[1990-03-27]
      })

    student18 =
      Repo.insert!(%Student{
        id: "bacda517-e1e0-4371-aff6-3a3010cad22e",
        email: "manuel.walter@studium.fernuni-hagen.de",
        matrikelnummer: "7654321",
        nachname: "Walter",
        vorname: "Manuel",
        geburtsdatum: ~D[1989-12-15]
      })

    student19 =
      Repo.insert!(%Student{
        id: "6db5632f-a521-465e-9142-13573ab7cb13",
        email: "franziska.huber@studium.fernuni-hagen.de",
        matrikelnummer: "7788990",
        nachname: "Huber",
        vorname: "Franziska",
        geburtsdatum: ~D[1988-10-02]
      })

    student20 =
      Repo.insert!(%Student{
        id: "6b03a905-a7cd-4c17-95e3-3ccd889cbebe",
        email: "thomas.maier@studium.fernuni-hagen.de",
        matrikelnummer: "7901234",
        nachname: "Maier",
        vorname: "Thomas",
        geburtsdatum: ~D[1987-08-20]
      })

    # zusätzliche Studierende für mehr Aktivität
    student21 =
      Repo.insert!(%Student{
        id: "91b5632f-a521-465e-9142-13573ab7cb13",
        email: "carolin.frank@studium.fernuni-hagen.de",
        matrikelnummer: "8012345",
        nachname: "Frank",
        vorname: "Carolin",
        geburtsdatum: ~D[1998-05-02]
      })

    student22 =
      Repo.insert!(%Student{
        id: "92b5632f-a521-465e-9142-13573ab7cb13",
        email: "dennis.vogel@studium.fernuni-hagen.de",
        matrikelnummer: "8012346",
        nachname: "Vogel",
        vorname: "Dennis",
        geburtsdatum: ~D[1997-03-12]
      })

    student23 =
      Repo.insert!(%Student{
        id: "93b5632f-a521-465e-9142-13573ab7cb13",
        email: "jana.lopez@studium.fernuni-hagen.de",
        matrikelnummer: "8012347",
        nachname: "Lopez",
        vorname: "Jana",
        geburtsdatum: ~D[1999-09-09]
      })

    #
    # ------------------------------------------------------------
    # Abstrakte Abschlussarbeiten
    # ------------------------------------------------------------
    #
    abstrakte_abschlussarbeit1 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "SS22",
        thema: "SPORT - Research through development of a web application for managing sports clubs",
        themenskizze:
          "IT-Sicherheitskonzepte für webbasierte Vereinsverwaltungssoftware",
        mitarbeiter_id: mitarbeiter3.id
      })

    abstrakte_abschlussarbeit2 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "WS22/23",
        thema: "SPORT - Research through development of a web application for managing sports clubs",
        themenskizze:
          "Entwicklung eines intelligenten Mitgliederverwaltungssystems",
        mitarbeiter_id: mitarbeiter2.id
      })

    abstrakte_abschlussarbeit3 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "SS23",
        thema: "SPORT - Research through development of a web application for managing sports clubs",
        themenskizze:
          "Usability-Studie: Wie intuitiv ist die Vereinsverwaltung mit Sportyweb?",
        mitarbeiter_id: mitarbeiter5.id
      })

    abstrakte_abschlussarbeit4 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "WS23/24",
        thema: "SPORT - Research through development of a web application for managing sports clubs",
        themenskizze:
          "Digitalisierung von Vereinsverwaltungsprozessen: Chancen und Herausforderungens",
        mitarbeiter_id: mitarbeiter1.id
      })

    abstrakte_abschlussarbeit5 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :becker,
        forschungsprojekt: :tool,
        semester: "SS22",
        thema: "TOOL - A web browser-based modeling tool and research observatory",
        themenskizze:
          "Analyse von Modellierungsschwierigkeiten mit TOOL durch die Untersuchung von Nutzerinteraktionen und Fehlerverhalten.",
        mitarbeiter_id: mitarbeiter6.id
      })

    abstrakte_abschlussarbeit6 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :becker,
        forschungsprojekt: :tool,
        semester: "WS22/23",
        thema: "TOOL - A web browser-based modeling tool and research observatory",
        themenskizze:
          "Analyse von Modellierungsprozessen in Gruppen: Kollaboratives Modellieren mit TOOL.",
        mitarbeiter_id: mitarbeiter1.id
      })

    abstrakte_abschlussarbeit7 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :becker,
        forschungsprojekt: :tool,
        semester: "SS23",
        thema: "TOOL - A web browser-based modeling tool and research observatory",
        themenskizze:
          "Entwicklung einer taxonomischen Theorie zur Unterstützung von Modellierungsanfängern.",
        mitarbeiter_id: mitarbeiter6.id
      })

    abstrakte_abschlussarbeit8 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :becker,
        forschungsprojekt: :tool,
        semester: "WS23/24",
        thema: "TOOL - A web browser-based modeling tool and research observatory",
        themenskizze:
          "Entwicklung intelligenter Unterstützungssysteme in TOOL zur automatisierten Fehlererkennung und Korrektur in Modellierungsprozessen.",
        mitarbeiter_id: mitarbeiter7.id
      })

    abstrakte_abschlussarbeit9 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "SS22",
        thema: "IMP - Individual Modeling Processes",
        themenskizze:
          "Erforschung von Modellierungsschwierigkeiten zur Entwicklung gezielter Unterstützung für Modellierer.",
        mitarbeiter_id: mitarbeiter3.id
      })

    abstrakte_abschlussarbeit10 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "WS22/23",
        thema: "IMP - Individual Modeling Processes",
        themenskizze:
          "Untersuchung individueller Modellierungsprozesse zur Optimierung softwaregestützter Modellierungshilfen.",
        mitarbeiter_id: mitarbeiter2.id
      })

    abstrakte_abschlussarbeit11 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "SS23",
        thema: "IMP - Individual Modeling Processes",
        themenskizze:
          "Analyse kognitiver Prozesse beim konzeptuellen Modellieren zur Verbesserung von Modellierungsunterstützung.",
        mitarbeiter_id: mitarbeiter4.id
      })

    abstrakte_abschlussarbeit12 =
      Repo.insert!(%AbstrakteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "WS23/24",
        thema: "IMP - Individual Modeling Processes",
        themenskizze:
          "Identifikation von Herausforderungen und Entwicklung gezielter Unterstützung für konzeptuelles Modellieren.",
        mitarbeiter_id: mitarbeiter4.id
      })

    #
    # ------------------------------------------------------------
    # Konkrete Abschlussarbeiten + Ergebnisse
    # ------------------------------------------------------------
    #
    konkrete_abschlussarbeit1 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit4.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7967990",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2024-02-01],
      note: 1.5,
      versuche: 1,
      student_id: student1.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit1.id
    })

    konkrete_abschlussarbeit2 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit3.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "8887777",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-02-01],
      note: 2.1,
      versuche: 1,
      student_id: student2.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit2.id
    })

    konkrete_abschlussarbeit3 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit1.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "1837675",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-07-01],
      note: 2.3,
      versuche: 1,
      student_id: student3.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit3.id
    })

    konkrete_abschlussarbeit4 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit3.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7647910",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-05-01],
      note: 2.9,
      versuche: 1,
      student_id: student4.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit4.id
    })

    konkrete_abschlussarbeit5 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit7.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "6767877",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-03-01],
      note: 2.3,
      versuche: 1,
      student_id: student5.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit5.id
    })

    konkrete_abschlussarbeit6 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit5.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "4447227",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-09-01],
      note: 1.7,
      versuche: 1,
      student_id: student6.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit6.id
    })

    konkrete_abschlussarbeit7 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit8.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "8189911",
      studienniveau: :masterarbeit,
      status: :nichtbestanden,
      korrekturdatum: ~D[2024-02-01],
      note: 5.0,
      versuche: 1,
      student_id: student7.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit7.id
    })

    konkrete_abschlussarbeit8 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit6.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "5632810",
      studienniveau: :masterarbeit,
      status: :nichtbestanden,
      korrekturdatum: ~D[2022-06-11],
      note: 5.0,
      versuche: 1,
      student_id: student8.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit8.id
    })

    konkrete_abschlussarbeit9 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "WS22/23",
        matrikelnummer: "6538921",
        angepasste_themenskizze:
          "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
        gesetzte_schwerpunkte: "Auswertung von Daten",
        anmeldung_pruefungsamt: ~D[2022-12-01],
        abgabedatum: ~D[2023-01-01],
        studienniveau: :master,
        student_id: student9.id,
        mitarbeiter_id: mitarbeiter2.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit10.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "6538921",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-02-01],
      note: 2.7,
      versuche: 1,
      student_id: student9.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit9.id
    })

    konkrete_abschlussarbeit10 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "S22",
        matrikelnummer: "7482390",
        angepasste_themenskizze:
          "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
        gesetzte_schwerpunkte: "Auswertung von Daten",
        anmeldung_pruefungsamt: ~D[2022-02-01],
        abgabedatum: ~D[2022-01-01],
        studienniveau: :bachelor,
        student_id: student10.id,
        mitarbeiter_id: mitarbeiter3.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit9.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7482390",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2022-02-01],
      note: 2.6,
      versuche: 1,
      student_id: student10.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit10.id
    })

    konkrete_abschlussarbeit11 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "SS23",
        matrikelnummer: "8291045",
        angepasste_themenskizze:
          "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
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
      versuche: 1,
      student_id: student11.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit11.id
    })

    konkrete_abschlussarbeit12 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "WS23/24",
        matrikelnummer: "9342156",
        angepasste_themenskizze:
          "Modellierungsschwierigkeiten bei Entity-Relationship-Modellen",
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
      versuche: 1,
      student_id: student12.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit12.id
    })

    konkrete_abschlussarbeit13 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit9.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "1023467",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2022-08-01],
      note: 1.5,
      versuche: 1,
      student_id: student13.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit13.id
    })

    konkrete_abschlussarbeit14 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit4.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "1134568",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2024-02-01],
      note: 1.5,
      versuche: 1,
      student_id: student14.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit14.id
    })

    konkrete_abschlussarbeit15 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit9.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7245789",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2022-08-01],
      note: 1.5,
      versuche: 1,
      student_id: student15.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit15.id
    })

    konkrete_abschlussarbeit16 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit12.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "9356789",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2024-01-01],
      note: 1.5,
      versuche: 1,
      student_id: student16.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit16.id
    })

    konkrete_abschlussarbeit17 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit3.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "4678901",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-10-01],
      note: 1.5,
      versuche: 1,
      student_id: student17.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit17.id
    })

    konkrete_abschlussarbeit18 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit5.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7654321",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2022-10-01],
      note: 1.5,
      versuche: 1,
      student_id: student18.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit18.id
    })

    konkrete_abschlussarbeit19 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "SS23",
        matrikelnummer: "7788990",
        angepasste_themenskizze:
          "Implementierung von Machine-Learning-Modellen",
        gesetzte_schwerpunkte: "Genauigkeit",
        anmeldung_pruefungsamt: ~D[2023-03-15],
        abgabedatum: ~D[2023-09-30],
        studienniveau: :bachelor,
        student_id: student19.id,
        mitarbeiter_id: mitarbeiter5.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit11.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7788990",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-10-15],
      note: 1.5,
      versuche: 1,
      student_id: student19.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit19.id
    })

    konkrete_abschlussarbeit20 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :hansen,
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
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit4.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7901234",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2024-01-15],
      note: 1.5,
      versuche: 1,
      student_id: student20.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit20.id
    })

    konkrete_abschlussarbeit21 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "SS23",
        matrikelnummer: "9876543",
        angepasste_themenskizze: "Integration neuer Softwaremodule",
        gesetzte_schwerpunkte: "Modularität",
        anmeldung_pruefungsamt: ~D[2023-04-10],
        abgabedatum: ~D[2023-09-10],
        studienniveau: :master,
        student_id: student7.id,
        mitarbeiter_id: mitarbeiter7.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit11.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "9876543",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-10-10],
      note: 1.5,
      versuche: 1,
      student_id: student7.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit21.id
    })

    konkrete_abschlussarbeit22 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :becker,
        forschungsprojekt: :tool,
        semester: "WS22/23",
        matrikelnummer: "7788990",
        angepasste_themenskizze: "Erstellung eines Prüfungsverwaltungstools",
        gesetzte_schwerpunkte: "Benutzeroberfläche",
        anmeldung_pruefungsamt: ~D[2022-10-05],
        abgabedatum: ~D[2023-03-15],
        studienniveau: :bachelor,
        student_id: student19.id,
        mitarbeiter_id: mitarbeiter8.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit6.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7788990",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2023-04-15],
      note: 1.5,
      versuche: 1,
      student_id: student19.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit22.id
    })

    konkrete_abschlussarbeit23 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "SS22",
        matrikelnummer: "7901234",
        angepasste_themenskizze: "Entwicklung eines Feedbacksystems",
        gesetzte_schwerpunkte: "Kundenzufriedenheit",
        anmeldung_pruefungsamt: ~D[2022-02-20],
        abgabedatum: ~D[2022-08-30],
        studienniveau: :master,
        student_id: student20.id,
        mitarbeiter_id: mitarbeiter1.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit9.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7901234",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2022-09-15],
      note: 1.5,
      versuche: 1,
      student_id: student20.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit23.id
    })

    konkrete_abschlussarbeit24 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "WS23/24",
        matrikelnummer: "8765432",
        angepasste_themenskizze:
          "Entwicklung einer Sportanalyse-Software",
        gesetzte_schwerpunkte: "Präzision",
        anmeldung_pruefungsamt: ~D[2023-06-25],
        abgabedatum: ~D[2023-12-10],
        studienniveau: :bachelor,
        student_id: student18.id,
        mitarbeiter_id: mitarbeiter1.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit4.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "8765432",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2024-01-15],
      note: 1.5,
      versuche: 1,
      student_id: student18.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit24.id
    })

    konkrete_abschlussarbeit30 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "SS22",
        matrikelnummer: "7788990",
        angepasste_themenskizze: "Entwicklung eines Fitness-Trackers",
        gesetzte_schwerpunkte: "Genauigkeit",
        anmeldung_pruefungsamt: ~D[2022-03-01],
        abgabedatum: ~D[2022-08-20],
        studienniveau: :master,
        student_id: student8.id,
        mitarbeiter_id: mitarbeiter4.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit1.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "7788990",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2022-02-01],
      note: 2.7,
      versuche: 1,
      student_id: student8.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit30.id
    })

    # einige neue konkrete Arbeiten für zusätzliche Studierende,
    # damit sie später als Alumni auftauchen
    konkrete_abschlussarbeit31 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :becker,
        forschungsprojekt: :tool,
        semester: "WS24/25",
        matrikelnummer: "8012345",
        angepasste_themenskizze: "Erweiterung der TOOL-Auswertungsfunktionen",
        gesetzte_schwerpunkte: "Visualisierung",
        anmeldung_pruefungsamt: ~D[2024-10-01],
        abgabedatum: ~D[2025-03-01],
        studienniveau: :master,
        student_id: student21.id,
        mitarbeiter_id: mitarbeiter9.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit7.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "8012345",
      studienniveau: :masterarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2025-04-01],
      note: 1.8,
      versuche: 1,
      student_id: student21.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit31.id
    })

    konkrete_abschlussarbeit32 =
      Repo.insert!(%KonkreteAbschlussarbeiten{
        betreuer: :müller,
        forschungsprojekt: :imp,
        semester: "WS24/25",
        matrikelnummer: "8012346",
        angepasste_themenskizze:
          "Analyse individueller Modellierungssessions mit IMP-Daten",
        gesetzte_schwerpunkte: "Datenanalyse",
        anmeldung_pruefungsamt: ~D[2024-10-05],
        abgabedatum: ~D[2025-03-05],
        studienniveau: :bachelor,
        student_id: student22.id,
        mitarbeiter_id: mitarbeiter9.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeit12.id
      })

    Repo.insert!(%ErgebnisseAbschlussarbeiten{
      matrikelnummer: "8012346",
      studienniveau: :bachelorarbeit,
      status: :bestanden,
      korrekturdatum: ~D[2025-04-10],
      note: 2.0,
      versuche: 1,
      student_id: student22.id,
      konkrete_abschlussarbeiten_id: konkrete_abschlussarbeit32.id
    })

    #
    # ------------------------------------------------------------
    # Abstrakte Seminare
    # ------------------------------------------------------------
    #
    abstraktes_seminar1 =
      Repo.insert!(%AbstraktesSeminar{
        thema: "Fortgeschrittene Webentwicklung",
        beschreibung: "Ein Seminar über moderne Web-Technologien und Frameworks",
        mitarbeiter_id: mitarbeiter1.id
      })

    abstraktes_seminar2 =
      Repo.insert!(%AbstraktesSeminar{
        thema: "Datenanalyse mit Python",
        beschreibung: "Ein Seminar über Datenanalyse und Visualisierung mit Python",
        mitarbeiter_id: mitarbeiter2.id
      })

    abstraktes_seminar3 =
      Repo.insert!(%AbstraktesSeminar{
        thema: "Künstliche Intelligenz in der Praxis",
        beschreibung:
          "Ein Seminar über die Anwendung von KI in verschiedenen Bereichen",
        mitarbeiter_id: mitarbeiter3.id
      })

    abstraktes_seminar4 =
      Repo.insert!(%AbstraktesSeminar{
        thema: "Cloud Computing und DevOps",
        beschreibung:
          "Ein Seminar über Cloud-Architekturen und DevOps-Praktiken",
        mitarbeiter_id: mitarbeiter4.id
      })

    abstraktes_seminar5 =
      Repo.insert!(%AbstraktesSeminar{
        thema: "Mobile App Entwicklung",
        beschreibung:
          "Ein Seminar über die Entwicklung von mobilen Anwendungen",
        mitarbeiter_id: mitarbeiter5.id
      })

    #
    # ------------------------------------------------------------
    # Seminare
    # ------------------------------------------------------------
    #
    seminar1 =
      Repo.insert!(%Seminar{
        titel: "Entwicklung von Informationssystemen",
        aufnahmekapazitaet: 25,
        semester: "WS24/25",
        praesenzdatum: ~D[2025-02-10],
        ort: "Hagen",
        mitarbeiter_id: mitarbeiter1.id,
        abstraktes_seminar_id: abstraktes_seminar1.id
      })

    seminar2 =
      Repo.insert!(%Seminar{
        titel: "Künstliche Intelligenz",
        aufnahmekapazitaet: 21,
        semester: "SS25",
        praesenzdatum: ~D[2025-09-12],
        ort: "Hagen",
        mitarbeiter_id: mitarbeiter2.id,
        abstraktes_seminar_id: abstraktes_seminar2.id
      })

    seminar3 =
      Repo.insert!(%Seminar{
        titel: "Datenbanken und Datenmodelle",
        aufnahmekapazitaet: 30,
        semester: "SS22",
        praesenzdatum: ~D[2022-05-10],
        ort: "Berlin",
        mitarbeiter_id: mitarbeiter3.id,
        abstraktes_seminar_id: abstraktes_seminar3.id
      })

    seminar4 =
      Repo.insert!(%Seminar{
        titel: "Big Data und Cloud Computing",
        aufnahmekapazitaet: 28,
        semester: "WS22/23",
        praesenzdatum: ~D[2022-12-05],
        ort: "Hamburg",
        mitarbeiter_id: mitarbeiter4.id,
        abstraktes_seminar_id: abstraktes_seminar4.id
      })

    seminar5 =
      Repo.insert!(%Seminar{
        titel: "Maschinelles Lernen",
        aufnahmekapazitaet: 20,
        semester: "SS23",
        praesenzdatum: ~D[2023-06-15],
        ort: "Köln",
        mitarbeiter_id: mitarbeiter5.id,
        abstraktes_seminar_id: abstraktes_seminar5.id
      })

    seminar6 =
      Repo.insert!(%Seminar{
        titel: "Webentwicklung und Frameworks",
        aufnahmekapazitaet: 22,
        semester: "WS23/24",
        praesenzdatum: ~D[2023-11-22],
        ort: "Dortmund",
        mitarbeiter_id: mitarbeiter6.id,
        abstraktes_seminar_id: abstraktes_seminar1.id
      })

    seminar7 =
      Repo.insert!(%Seminar{
        titel: "Ethik der Künstlichen Intelligenz",
        aufnahmekapazitaet: 18,
        semester: "SS24",
        praesenzdatum: ~D[2024-05-20],
        ort: "München",
        mitarbeiter_id: mitarbeiter7.id,
        abstraktes_seminar_id: abstraktes_seminar2.id
      })

    seminar8 =
      Repo.insert!(%Seminar{
        titel: "Cybersicherheit und Datenschutz",
        aufnahmekapazitaet: 25,
        semester: "WS24/25",
        praesenzdatum: ~D[2024-12-10],
        ort: "Hannover",
        mitarbeiter_id: mitarbeiter8.id,
        abstraktes_seminar_id: abstraktes_seminar3.id
      })

    seminar9 =
      Repo.insert!(%Seminar{
        titel: "Softwarearchitektur",
        aufnahmekapazitaet: 24,
        semester: "SS25",
        praesenzdatum: ~D[2025-05-18],
        ort: "Frankfurt",
        mitarbeiter_id: mitarbeiter1.id,
        abstraktes_seminar_id: abstraktes_seminar4.id
      })

    seminar10 =
      Repo.insert!(%Seminar{
        titel: "Robotik und Automatisierung",
        aufnahmekapazitaet: 19,
        semester: "WS25/26",
        praesenzdatum: ~D[2025-11-25],
        ort: "Stuttgart",
        mitarbeiter_id: mitarbeiter2.id,
        abstraktes_seminar_id: abstraktes_seminar5.id
      })

    seminar11 =
      Repo.insert!(%Seminar{
        titel: "Digitale Transformation",
        aufnahmekapazitaet: 26,
        semester: "SS26",
        praesenzdatum: ~D[2026-06-08],
        ort: "Leipzig",
        mitarbeiter_id: mitarbeiter3.id,
        abstraktes_seminar_id: abstraktes_seminar1.id
      })

    # ein zusätzliches Seminar mit den neuen Mitarbeitenden
    seminar12 =
      Repo.insert!(%Seminar{
        titel: "Usability und Interaktionsdesign",
        aufnahmekapazitaet: 20,
        semester: "WS24/25",
        praesenzdatum: ~D[2024-11-15],
        ort: "Hagen",
        mitarbeiter_id: mitarbeiter9.id,
        abstraktes_seminar_id: abstraktes_seminar3.id
      })

    #
    # ------------------------------------------------------------
    # Seminarergebnisse
    # ------------------------------------------------------------
    #
    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.5,
      gesamt: 1.4,
      versuche: 1,
      seminar_id: seminar1.id,
      student_id: student1.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.2,
      gesamt: 1.1,
      versuche: 1,
      seminar_id: seminar2.id,
      student_id: student2.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.3,
      gesamt: 1.2,
      versuche: 1,
      seminar_id: seminar3.id,
      student_id: student3.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.5,
      schriftlich_note: 1.0,
      gesamt: 1.25,
      versuche: 1,
      seminar_id: seminar4.id,
      student_id: student4.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.4,
      schriftlich_note: 1.0,
      gesamt: 1.2,
      versuche: 1,
      seminar_id: seminar5.id,
      student_id: student5.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.5,
      gesamt: 1.25,
      versuche: 1,
      seminar_id: seminar6.id,
      student_id: student6.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.4,
      gesamt: 1.2,
      versuche: 1,
      seminar_id: seminar7.id,
      student_id: student7.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.3,
      gesamt: 1.15,
      versuche: 1,
      seminar_id: seminar8.id,
      student_id: student8.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.2,
      gesamt: 1.1,
      versuche: 1,
      seminar_id: seminar9.id,
      student_id: student9.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.5,
      gesamt: 1.25,
      versuche: 1,
      seminar_id: seminar10.id,
      student_id: student10.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.4,
      gesamt: 1.2,
      versuche: 1,
      seminar_id: seminar10.id,
      student_id: student11.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.3,
      gesamt: 1.15,
      versuche: 1,
      seminar_id: seminar10.id,
      student_id: student12.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.0,
      schriftlich_note: 1.2,
      gesamt: 1.1,
      versuche: 1,
      seminar_id: seminar10.id,
      student_id: student13.id
    })

    # Ergebnisse im neuen Seminar 12 für zusätzliche Studierende
    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.3,
      schriftlich_note: 1.3,
      gesamt: 1.3,
      versuche: 1,
      seminar_id: seminar12.id,
      student_id: student21.id
    })

    Repo.insert!(%Seminarergebnis{
      mündlich_note: 1.7,
      schriftlich_note: 1.9,
      gesamt: 1.8,
      versuche: 1,
      seminar_id: seminar12.id,
      student_id: student22.id
    })

    #
    # ------------------------------------------------------------
    # Module
    # ------------------------------------------------------------
    #
    modul1 =
      Repo.insert!(%Modul{
        modulnummer: "32561",
        titel: "Entwurf und Implementierung von Informationssystemen",
        einsendearbeiten: "2",
        ects: :zehn,
        hilfsmittel: "keine",
        stoffeingrenzung: "Kurs 8-10",
        mitarbeiter_id: mitarbeiter1.id,
        lehrstuhlinhaber_id: mitarbeiter1.id
      })

    modul2 =
      Repo.insert!(%Modul{
        modulnummer: "63016",
        titel: "Einführung in die objektorientierte Programmierung",
        einsendearbeiten: "keine Voraussetzung",
        ects: :zehn,
        hilfsmittel: "2-seitiges DIN-A4",
        stoffeingrenzung: "Kurs 7",
        mitarbeiter_id: mitarbeiter1.id,
        lehrstuhlinhaber_id: mitarbeiter5.id
      })

    modul3 =
      Repo.insert!(%Modul{
        modulnummer: "32563",
        titel: "Betriebswirtschaftslehre für Informatiker",
        einsendearbeiten: "keine Voraussetzung",
        ects: :zehn,
        hilfsmittel: "Formelsammlung, Taschenrechner",
        stoffeingrenzung: "Kurs 1-5",
        mitarbeiter_id: mitarbeiter2.id,
        lehrstuhlinhaber_id: mitarbeiter2.id
      })

    modul4 =
      Repo.insert!(%Modul{
        modulnummer: "31751",
        titel: "Modellierung betrieblicher Informationssysteme",
        einsendearbeiten: "2",
        ects: :zehn,
        hilfsmittel: "keine",
        stoffeingrenzung: "Kurs 1",
        mitarbeiter_id: mitarbeiter3.id,
        lehrstuhlinhaber_id: mitarbeiter3.id
      })

    modul5 =
      Repo.insert!(%Modul{
        modulnummer: "31001",
        titel: "Einführung in die Wirtschafts­wissen­schaft",
        einsendearbeiten:
          "2 (Klausurvoraussetzung: mindestens 1-mal bestanden)",
        ects: :zehn,
        hilfsmittel: "keine",
        stoffeingrenzung: "keine",
        mitarbeiter_id: mitarbeiter7.id,
        lehrstuhlinhaber_id: mitarbeiter4.id
      })

    #
    # ------------------------------------------------------------
    # Klausuren
    # ------------------------------------------------------------
    #
    klausur1 =
      Repo.insert!(%Klausur{
        id: "9a7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "MATH101",
        beschreibung: "Klausur über lineare Algebra und Analysis",
        punkteGesamt: 100,
        semester: "SS26",
        klausurdatum: ~D[2026-02-15],
        ort: "Raum A1",
        modul_id: modul1.id
      })

    klausur2 =
      Repo.insert!(%Klausur{
        id: "8b7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "INF102",
        beschreibung: "Klausur über Datenstrukturen und Algorithmen",
        punkteGesamt: 80,
        semester: "SS24",
        klausurdatum: ~D[2025-06-20],
        ort: "Raum B2",
        modul_id: modul2.id
      })

    klausur3 =
      Repo.insert!(%Klausur{
        id: "7c7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "BWL101",
        beschreibung:
          "Klausur über Grundlagen der Betriebswirtschaftslehre",
        punkteGesamt: 60,
        semester: "WS24/25",
        klausurdatum: ~D[2025-07-01],
        ort: "Raum C3",
        modul_id: modul3.id
      })

    klausur4 =
      Repo.insert!(%Klausur{
        id: "6d7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "PHY101",
        beschreibung: "Klausur über Mechanik und Thermodynamik",
        punkteGesamt: 75,
        semester: "WS24/25",
        klausurdatum: ~D[2025-07-10],
        ort: "Raum D4",
        modul_id: modul4.id
      })

    klausur5 =
      Repo.insert!(%Klausur{
        id: "5e7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "CHEM101",
        beschreibung:
          "Klausur über Organische und Anorganische Chemie",
        punkteGesamt: 90,
        semester: "SS25",
        klausurdatum: ~D[2025-08-12],
        ort: "Raum E5",
        modul_id: modul5.id
      })

    # zukünftige Klausuren
    klausur6 =
      Repo.insert!(%Klausur{
        id: "4f7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "INF201",
        beschreibung: "Fortgeschrittene objektorientierte Programmierung",
        punkteGesamt: 100,
        semester: "WS25/26",
        klausurdatum: ~D[2026-01-20],
        ort: "Raum F6",
        modul_id: modul2.id
      })

    klausur7 =
      Repo.insert!(%Klausur{
        id: "3a7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "MIS301",
        beschreibung:
          "Modellierung betrieblicher Informationssysteme - Vertiefung",
        punkteGesamt: 80,
        semester: "SS26",
        klausurdatum: ~D[2026-06-10],
        ort: "Raum G7",
        modul_id: modul4.id
      })

    # noch eine Klausur im Modul 31751, damit Stats etwas lebendiger sind
    klausur8 =
      Repo.insert!(%Klausur{
        id: "2a7b3300-ae7f-11eb-bcbc-0242ac130002",
        kenner: "MIS302",
        beschreibung: "Projektklausur Modellierung betrieblicher IS",
        punkteGesamt: 80,
        semester: "WS24/25",
        klausurdatum: ~D[2025-12-05],
        ort: "Raum H1",
        modul_id: modul4.id
      })

    #
    # ------------------------------------------------------------
    # Klausurergebnisse
    # ------------------------------------------------------------
    #
    Repo.insert!(%Klausurergebnis{
      punkte: 85,
      note: 2.0,
      status: :bestanden,
      pruefungsdatum: ~D[2025-06-15],
      student_id: student1.id,
      klausur_id: klausur1.id,
      versuche: 0
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 45,
      note: 5.0,
      status: :nicht_bestanden,
      pruefungsdatum: ~D[2025-06-15],
      student_id: student1.id,
      klausur_id: klausur1.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 25,
      note: 5.0,
      status: :nicht_bestanden,
      pruefungsdatum: ~D[2025-06-15],
      student_id: student1.id,
      klausur_id: klausur1.id,
      versuche: 2
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 90,
      note: 1.5,
      status: :bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student2.id,
      klausur_id: klausur1.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 49,
      note: 5.0,
      status: :nicht_bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student2.id,
      klausur_id: klausur1.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 78,
      note: 2.3,
      status: :bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student3.id,
      klausur_id: klausur2.id,
      versuche: 3
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 24,
      note: 5.0,
      status: :nicht_bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student3.id,
      klausur_id: klausur2.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 65,
      note: 3.0,
      status: :bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student4.id,
      klausur_id: klausur2.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 50,
      note: 4.0,
      status: :bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student5.id,
      klausur_id: klausur3.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 88,
      note: 1.7,
      status: :bestanden,
      pruefungsdatum: ~D[2025-06-20],
      student_id: student6.id,
      klausur_id: klausur3.id,
      versuche: 1
    })

    # INF201
    Repo.insert!(%Klausurergebnis{
      punkte: 92,
      note: 1.3,
      status: :bestanden,
      pruefungsdatum: ~D[2026-01-20],
      student_id: student1.id,
      klausur_id: klausur6.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 78,
      note: 2.3,
      status: :bestanden,
      pruefungsdatum: ~D[2026-01-20],
      student_id: student2.id,
      klausur_id: klausur6.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 41,
      note: 4.0,
      status: :bestanden,
      pruefungsdatum: ~D[2026-01-20],
      student_id: student3.id,
      klausur_id: klausur6.id,
      versuche: 2
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 35,
      note: 5.0,
      status: :nicht_bestanden,
      pruefungsdatum: ~D[2026-01-20],
      student_id: student4.id,
      klausur_id: klausur6.id,
      versuche: 1
    })

    # MIS301
    Repo.insert!(%Klausurergebnis{
      punkte: 70,
      note: 2.0,
      status: :bestanden,
      pruefungsdatum: ~D[2026-06-10],
      student_id: student5.id,
      klausur_id: klausur7.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 55,
      note: 3.3,
      status: :bestanden,
      pruefungsdatum: ~D[2026-06-10],
      student_id: student6.id,
      klausur_id: klausur7.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 38,
      note: 5.0,
      status: :nicht_bestanden,
      pruefungsdatum: ~D[2026-06-10],
      student_id: student7.id,
      klausur_id: klausur7.id,
      versuche: 1
    })

    # CHEM101
    Repo.insert!(%Klausurergebnis{
      punkte: 72,
      note: 2.3,
      status: :bestanden,
      pruefungsdatum: ~D[2025-08-12],
      student_id: student1.id,
      klausur_id: klausur5.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 60,
      note: 3.0,
      status: :bestanden,
      pruefungsdatum: ~D[2025-08-12],
      student_id: student2.id,
      klausur_id: klausur5.id,
      versuche: 1
    })

    # PHY101
    Repo.insert!(%Klausurergebnis{
      punkte: 68,
      note: 2.7,
      status: :bestanden,
      pruefungsdatum: ~D[2025-07-10],
      student_id: student3.id,
      klausur_id: klausur4.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 40,
      note: 4.0,
      status: :bestanden,
      pruefungsdatum: ~D[2025-07-10],
      student_id: student4.id,
      klausur_id: klausur4.id,
      versuche: 1
    })

    # MIS302 – zusätzliche Aktivität für neue Studierende
    Repo.insert!(%Klausurergebnis{
      punkte: 81,
      note: 2.0,
      status: :bestanden,
      pruefungsdatum: ~D[2025-12-05],
      student_id: student21.id,
      klausur_id: klausur8.id,
      versuche: 1
    })

    Repo.insert!(%Klausurergebnis{
      punkte: 74,
      note: 2.3,
      status: :bestanden,
      pruefungsdatum: ~D[2025-12-05],
      student_id: student22.id,
      klausur_id: klausur8.id,
      versuche: 1
    })

    #
    # ------------------------------------------------------------
    # Alumni-Felder aus Abschlussarbeiten ableiten
    # ------------------------------------------------------------
    #
    alumni_query =
      from e in ErgebnisseAbschlussarbeiten,
        where: e.status == :bestanden,
        join: s in assoc(e, :student),
        select: {s.id, e.studienniveau, e.korrekturdatum}

    alumni =
      alumni_query
      |> Repo.all()
      |> Enum.uniq_by(fn {student_id, _niveau, _datum} -> student_id end)

    Enum.each(alumni, fn {student_id, studienniveau, korrekturdatum} ->
      abschluss_art =
        case studienniveau do
          :bachelorarbeit -> :bachelor
          :masterarbeit -> :master
          :diplomarbeit -> :diplom
          _ -> nil
        end

      Repo.update_all(
        from(s in Student, where: s.id == ^student_id),
        set: [
          status: "alumni",
          abschluss_datum: korrekturdatum,
          abschluss_art:
            if(abschluss_art, do: Atom.to_string(abschluss_art), else: nil)
        ]
      )
    end)

    :ok
  end
end
