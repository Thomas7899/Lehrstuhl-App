defmodule Lehrstuhl.AbschlussarbeitenTest do
  use Lehrstuhl.DataCase

  alias Lehrstuhl.Abschlussarbeiten

  describe "abstrakte_abschlussarbeiten" do
    alias Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten

    import Lehrstuhl.AbschlussarbeitenFixtures
    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{
      betreuer: nil,
      forschungsprojekt: nil,
      semester: nil,
      thema: nil,
      themenskizze: nil,
      mitarbeiter_id: nil
  }

    test "list_abstrakte_abschlussarbeiten/0 returns all abstrakte_abschlussarbeiten" do
      abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
      mitarbeiter = mitarbeiter_fixture()
      assert Abschlussarbeiten.list_abstrakte_abschlussarbeiten() == [abstrakte_abschlussarbeiten]
    end

    test "get_abstrakte_abschlussarbeiten!/1 returns the abstrakte_abschlussarbeiten with given id" do
      abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
      mitarbeiter = mitarbeiter_fixture()
      assert Abschlussarbeiten.get_abstrakte_abschlussarbeiten!(abstrakte_abschlussarbeiten.id) == abstrakte_abschlussarbeiten
    end

    test "create_abstrakte_abschlussarbeiten/1 with valid data creates a abstrakte_abschlussarbeiten" do
      mitarbeiter = mitarbeiter_fixture()
      valid_attrs = %{
       betreuer: :müller,
       forschungsprojekt: :sport,
       semester: "SS-23",
       thema: "some thema",
       themenskizze: "some themenskizze",
       mitarbeiter_id: mitarbeiter.id
      }

      assert {:ok, %AbstrakteAbschlussarbeiten{} = abstrakte_abschlussarbeiten} = Abschlussarbeiten.create_abstrakte_abschlussarbeiten(valid_attrs)
      assert abstrakte_abschlussarbeiten.betreuer == :müller
      assert abstrakte_abschlussarbeiten.forschungsprojekt == :sport
      assert abstrakte_abschlussarbeiten.semester == "SS-23"
      assert abstrakte_abschlussarbeiten.thema == "some thema"
      assert abstrakte_abschlussarbeiten.themenskizze == "some themenskizze"
      assert abstrakte_abschlussarbeiten.mitarbeiter_id == mitarbeiter.id
    end

    test "create_abstrakte_abschlussarbeiten/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Abschlussarbeiten.create_abstrakte_abschlussarbeiten(@invalid_attrs)
    end

    test "update_abstrakte_abschlussarbeiten/2 with valid data updates the abstrakte_abschlussarbeiten" do
      abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
      mitarbeiter = mitarbeiter_fixture()
      update_attrs = %{betreuer: :hansen, forschungsprojekt: :tool, semester: "SS-23", thema: "some updated thema", themenskizze: "some updated themenskizze"}

      assert {:ok, %AbstrakteAbschlussarbeiten{} = abstrakte_abschlussarbeiten} = Abschlussarbeiten.update_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten, update_attrs)
      assert abstrakte_abschlussarbeiten.betreuer == :hansen
      assert abstrakte_abschlussarbeiten.forschungsprojekt == :tool
      assert abstrakte_abschlussarbeiten.semester == "SS-23"
      assert abstrakte_abschlussarbeiten.thema == "some updated thema"
      assert abstrakte_abschlussarbeiten.themenskizze == "some updated themenskizze"
    end

    test "update_abstrakte_abschlussarbeiten/2 with invalid data returns error changeset" do
      mitarbeiter = mitarbeiter_fixture()
      abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
      assert {:error, %Ecto.Changeset{}} = Abschlussarbeiten.update_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten, @invalid_attrs)
      assert abstrakte_abschlussarbeiten == Abschlussarbeiten.get_abstrakte_abschlussarbeiten!(abstrakte_abschlussarbeiten.id)
    end

    test "delete_abstrakte_abschlussarbeiten/1 deletes the abstrakte_abschlussarbeiten" do
      mitarbeiter = mitarbeiter_fixture()
      abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
      assert {:ok, %AbstrakteAbschlussarbeiten{}} = Abschlussarbeiten.delete_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)
      assert_raise Ecto.NoResultsError, fn -> Abschlussarbeiten.get_abstrakte_abschlussarbeiten!(abstrakte_abschlussarbeiten.id) end
    end

    test "change_abstrakte_abschlussarbeiten/1 returns a abstrakte_abschlussarbeiten changeset" do
      mitarbeiter = mitarbeiter_fixture()
      abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
      assert %Ecto.Changeset{} = Abschlussarbeiten.change_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)
    end
  end

  describe "konkrete_abschlussarbeiten" do
    alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

    import Lehrstuhl.AbschlussarbeitenFixtures
    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{betreuer: nil, forschungsprojekt: nil, semester: nil, matrikelnummer: nil, angepasste_themenskizze: nil, gesetzte_schwerpunkte: nil, anmeldung_pruefungsamt: nil, abgabedatum: nil, studienniveau: nil, student_id: nil, mitarbeiter_id: nil, abstrakte_abschlussarbeit_id: nil}

    test "list_konkrete_abschlussarbeiten/0 returns all konkrete_abschlussarbeiten" do
      konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
      assert Abschlussarbeiten.list_konkrete_abschlussarbeiten() == [konkrete_abschlussarbeiten]
    end

    test "get_konkrete_abschlussarbeiten!/1 returns the konkrete_abschlussarbeiten with given id" do
      konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
      assert Abschlussarbeiten.get_konkrete_abschlussarbeiten!(konkrete_abschlussarbeiten.id) == konkrete_abschlussarbeiten
    end

    test "create_konkrete_abschlussarbeiten/1 with valid data creates a konkrete_abschlussarbeiten" do

      valid_attrs = %{betreuer: :müller,
      forschungsprojekt: :sport,
      semester: "SS-23",
      matrikelnummer: "some matrikelnummer",
      angepasste_themenskizze: "some angepasste_themenskizze",
      gesetzte_schwerpunkte: "some gesetzte_schwerpunkte",
      anmeldung_pruefungsamt: ~D[2023-11-28],
      abgabedatum: ~D[2023-11-28], studienniveau: :bachelor}

      assert {:ok, %KonkreteAbschlussarbeiten{} = konkrete_abschlussarbeiten} = Abschlussarbeiten.create_konkrete_abschlussarbeiten(valid_attrs)
      assert konkrete_abschlussarbeiten.betreuer == :müller
      assert konkrete_abschlussarbeiten.forschungsprojekt == :sport
      assert konkrete_abschlussarbeiten.semester == "SS-23"
      assert konkrete_abschlussarbeiten.matrikelnummer == "some matrikelnummer"
      assert konkrete_abschlussarbeiten.angepasste_themenskizze == "some angepasste_themenskizze"
      assert konkrete_abschlussarbeiten.gesetzte_schwerpunkte == "some gesetzte_schwerpunkte"
      assert konkrete_abschlussarbeiten.anmeldung_pruefungsamt == ~D[2023-11-28]
      assert konkrete_abschlussarbeiten.abgabedatum == ~D[2023-11-28]
      assert konkrete_abschlussarbeiten.studienniveau == :bachelor
    end

    test "create_konkrete_abschlussarbeiten/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Abschlussarbeiten.create_konkrete_abschlussarbeiten(@invalid_attrs)
    end

    test "update_konkrete_abschlussarbeiten/2 with valid data updates the konkrete_abschlussarbeiten" do
      konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
      update_attrs = %{betreuer: :hansen, forschungsprojekt: :tool, semester: "SS-23", matrikelnummer: "some updated matrikelnummer", angepasste_themenskizze: "some updated angepasste_themenskizze", gesetzte_schwerpunkte: "some updated gesetzte_schwerpunkte", anmeldung_pruefungsamt: ~D[2023-11-29], abgabedatum: ~D[2023-11-29], studienniveau: :master}

      assert {:ok, %KonkreteAbschlussarbeiten{} = konkrete_abschlussarbeiten} = Abschlussarbeiten.update_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten, update_attrs)
      assert konkrete_abschlussarbeiten.betreuer == :hansen
      assert konkrete_abschlussarbeiten.forschungsprojekt == :tool
      assert konkrete_abschlussarbeiten.semester == "SS-23"
      assert konkrete_abschlussarbeiten.matrikelnummer == "some updated matrikelnummer"
      assert konkrete_abschlussarbeiten.angepasste_themenskizze == "some updated angepasste_themenskizze"
      assert konkrete_abschlussarbeiten.gesetzte_schwerpunkte == "some updated gesetzte_schwerpunkte"
      assert konkrete_abschlussarbeiten.anmeldung_pruefungsamt == ~D[2023-11-29]
      assert konkrete_abschlussarbeiten.abgabedatum == ~D[2023-11-29]
      assert konkrete_abschlussarbeiten.studienniveau == :master
    end

    test "update_konkrete_abschlussarbeiten/2 with invalid data returns error changeset" do
      konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
      assert {:error, %Ecto.Changeset{}} = Abschlussarbeiten.update_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten, @invalid_attrs)
      assert konkrete_abschlussarbeiten == Abschlussarbeiten.get_konkrete_abschlussarbeiten!(konkrete_abschlussarbeiten.id)
    end

    test "delete_konkrete_abschlussarbeiten/1 deletes the konkrete_abschlussarbeiten" do
      konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
      assert {:ok, %KonkreteAbschlussarbeiten{}} = Abschlussarbeiten.delete_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)
      assert_raise Ecto.NoResultsError, fn -> Abschlussarbeiten.get_konkrete_abschlussarbeiten!(konkrete_abschlussarbeiten.id) end
    end

    test "change_konkrete_abschlussarbeiten/1 returns a konkrete_abschlussarbeiten changeset" do
      konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
      assert %Ecto.Changeset{} = Abschlussarbeiten.change_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)
    end
  end

  describe "ergebnisse_abschlussarbeiten" do
    alias Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten

    import Lehrstuhl.AbschlussarbeitenFixtures
    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{status: nil, matrikelnummer: nil, studienniveau: nil, korrekturdatum: nil, note: nil, student_id: nil}

    test "list_ergebnisse_abschlussarbeiten/0 returns all ergebnisse_abschlussarbeiten" do
      ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
      assert Abschlussarbeiten.list_ergebnisse_abschlussarbeiten() == [ergebnisse_abschlussarbeiten]
    end

    test "get_ergebnisse_abschlussarbeiten!/1 returns the ergebnisse_abschlussarbeiten with given id" do
      ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
      assert Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(ergebnisse_abschlussarbeiten.id) == ergebnisse_abschlussarbeiten
    end

    test "create_ergebnisse_abschlussarbeiten/1 with valid data creates a ergebnisse_abschlussarbeiten" do
      valid_attrs = %{status: :bestanden, matrikelnummer: "some matrikelnummer", studienniveau: :bachelorarbeit, korrekturdatum: ~D[2023-12-24], note: "120.5"}

      assert {:ok, %ErgebnisseAbschlussarbeiten{} = ergebnisse_abschlussarbeiten} = Abschlussarbeiten.create_ergebnisse_abschlussarbeiten(valid_attrs)
      assert ergebnisse_abschlussarbeiten.status == :bestanden
      assert ergebnisse_abschlussarbeiten.matrikelnummer == "some matrikelnummer"
      assert ergebnisse_abschlussarbeiten.studienniveau == :bachelorarbeit
      assert ergebnisse_abschlussarbeiten.korrekturdatum == ~D[2023-12-24]
      assert ergebnisse_abschlussarbeiten.note == Decimal.new("120.5")
    end

    test "create_ergebnisse_abschlussarbeiten/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Abschlussarbeiten.create_ergebnisse_abschlussarbeiten(@invalid_attrs)
    end

    test "update_ergebnisse_abschlussarbeiten/2 with valid data updates the ergebnisse_abschlussarbeiten" do
      ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
      update_attrs = %{status: :nichtbestanden, matrikelnummer: "some updated matrikelnummer", studienniveau: :masterarbeit, korrekturdatum: ~D[2023-12-25], note: "456.7"}

      assert {:ok, %ErgebnisseAbschlussarbeiten{} = ergebnisse_abschlussarbeiten} = Abschlussarbeiten.update_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten, update_attrs)
      assert ergebnisse_abschlussarbeiten.status == :nichtbestanden
      assert ergebnisse_abschlussarbeiten.matrikelnummer == "some updated matrikelnummer"
      assert ergebnisse_abschlussarbeiten.studienniveau == :masterarbeit
      assert ergebnisse_abschlussarbeiten.korrekturdatum == ~D[2023-12-25]
      assert ergebnisse_abschlussarbeiten.note == Decimal.new("456.7")
    end

    test "update_ergebnisse_abschlussarbeiten/2 with invalid data returns error changeset" do
      ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
      assert {:error, %Ecto.Changeset{}} = Abschlussarbeiten.update_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten, @invalid_attrs)
      assert ergebnisse_abschlussarbeiten == Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(ergebnisse_abschlussarbeiten.id)
    end

    test "delete_ergebnisse_abschlussarbeiten/1 deletes the ergebnisse_abschlussarbeiten" do
      ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
      assert {:ok, %ErgebnisseAbschlussarbeiten{}} = Abschlussarbeiten.delete_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)
      assert_raise Ecto.NoResultsError, fn -> Abschlussarbeiten.get_ergebnisse_abschlussarbeiten!(ergebnisse_abschlussarbeiten.id) end
    end

    test "change_ergebnisse_abschlussarbeiten/1 returns a ergebnisse_abschlussarbeiten changeset" do
      ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
      assert %Ecto.Changeset{} = Abschlussarbeiten.change_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)
    end
  end
end
