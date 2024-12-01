defmodule Lehrstuhl.SeminareTest do
  use Lehrstuhl.DataCase

  alias Lehrstuhl.Seminare

  describe "seminarergebnisse" do
    alias Lehrstuhl.Seminare.Seminarergebnis

    import Lehrstuhl.SeminareFixtures
    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{
      seminar_id: nil,
      fachvortrag_titel: nil,
      fachvortrag_datum: nil,
      fachvortrag_start: nil,
      fachvortrag_stop: nil,
      fachvortrag_notenvorschlag: nil,
      fachvortrag_teilnote: nil,
      seminararbeit_titel: nil,
      seminararbeit_einreichung: nil,
      seminararbeit_notenvorschlag: nil,
      seminararbeit_teilnote: nil,
      gesamtergebnis: nil
    }

    test "list_seminarergebnisse/0 returns all seminarergebnisse" do
      seminarergebnis = seminarergebnis_fixture()
      assert Seminare.list_seminarergebnisse_wo_preload() == [seminarergebnis]
    end

    test "get_seminarergebnis!/1 returns the seminarergebnis with given id" do
      seminarergebnis = seminarergebnis_fixture()
      assert Seminare.get_seminarergebnis_wo_preload!(seminarergebnis.id) == seminarergebnis
    end

    test "create_seminarergebnis/1 with valid data creates a seminarergebnis" do
      student = student_fixture()
      seminar = seminar_fixture()

      valid_attrs = %{
        fachvortrag_titel: "some fachvortrag_titel",
        fachvortrag_datum: ~D[2023-10-24],
        fachvortrag_start: ~T[14:00:00],
        fachvortrag_stop: ~T[14:00:00],
        fachvortrag_notenvorschlag: "120.5",
        fachvortrag_teilnote: "120.5",
        seminararbeit_titel: "some seminararbeit_titel",
        seminararbeit_einreichung: ~D[2023-10-24],
        seminararbeit_notenvorschlag: "120.5",
        seminararbeit_teilnote: "120.5",
        gesamtergebnis: "120.5",
        student_id: student.id,
        seminar_id: seminar.id
      }

      assert {:ok, %Seminarergebnis{} = seminarergebnis} =
               Seminare.create_seminarergebnis(valid_attrs)

      assert seminarergebnis.fachvortrag_titel == "some fachvortrag_titel"
      assert seminarergebnis.fachvortrag_datum == ~D[2023-10-24]
      assert seminarergebnis.fachvortrag_start == ~T[14:00:00]
      assert seminarergebnis.fachvortrag_stop == ~T[14:00:00]
      assert seminarergebnis.fachvortrag_notenvorschlag == Decimal.new("120.5")
      assert seminarergebnis.fachvortrag_teilnote == Decimal.new("120.5")
      assert seminarergebnis.seminararbeit_titel == "some seminararbeit_titel"
      assert seminarergebnis.seminararbeit_einreichung == ~D[2023-10-24]
      assert seminarergebnis.seminararbeit_notenvorschlag == Decimal.new("120.5")
      assert seminarergebnis.seminararbeit_teilnote == Decimal.new("120.5")
      assert seminarergebnis.gesamtergebnis == Decimal.new("120.5")
    end

    test "create_seminarergebnis/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seminare.create_seminarergebnis(@invalid_attrs)
    end

    test "update_seminarergebnis/2 with valid data updates the seminarergebnis" do
      seminarergebnis = seminarergebnis_fixture()

      update_attrs = %{
        fachvortrag_titel: "some updated fachvortrag_titel",
        fachvortrag_datum: ~D[2023-10-25],
        fachvortrag_start: ~T[15:01:01],
        fachvortrag_stop: ~T[15:01:01],
        fachvortrag_notenvorschlag: "456.7",
        fachvortrag_teilnote: "456.7",
        seminararbeit_titel: "some updated seminararbeit_titel",
        seminararbeit_einreichung: ~D[2023-10-25],
        seminararbeit_notenvorschlag: "456.7",
        seminararbeit_teilnote: "456.7",
        gesamtergebnis: "456.7"
      }

      assert {:ok, %Seminarergebnis{} = seminarergebnis} =
               Seminare.update_seminarergebnis(seminarergebnis, update_attrs)

      assert seminarergebnis.fachvortrag_titel == "some updated fachvortrag_titel"
      assert seminarergebnis.fachvortrag_datum == ~D[2023-10-25]
      assert seminarergebnis.fachvortrag_start == ~T[15:01:01]
      assert seminarergebnis.fachvortrag_stop == ~T[15:01:01]
      assert seminarergebnis.fachvortrag_notenvorschlag == Decimal.new("456.7")
      assert seminarergebnis.fachvortrag_teilnote == Decimal.new("456.7")
      assert seminarergebnis.seminararbeit_titel == "some updated seminararbeit_titel"
      assert seminarergebnis.seminararbeit_einreichung == ~D[2023-10-25]
      assert seminarergebnis.seminararbeit_notenvorschlag == Decimal.new("456.7")
      assert seminarergebnis.seminararbeit_teilnote == Decimal.new("456.7")
      assert seminarergebnis.gesamtergebnis == Decimal.new("456.7")
    end

    test "update_seminarergebnis/2 with invalid data returns error changeset" do
      seminarergebnis = seminarergebnis_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Seminare.update_seminarergebnis(seminarergebnis, @invalid_attrs)

      assert seminarergebnis == Seminare.get_seminarergebnis_wo_preload!(seminarergebnis.id)
    end

    test "delete_seminarergebnis/1 deletes the seminarergebnis" do
      seminarergebnis = seminarergebnis_fixture()
      assert {:ok, %Seminarergebnis{}} = Seminare.delete_seminarergebnis(seminarergebnis)

      assert_raise Ecto.NoResultsError, fn ->
        Seminare.get_seminarergebnis_wo_preload!(seminarergebnis.id)
      end
    end

    test "change_seminarergebnis/1 returns a seminarergebnis changeset" do
      seminarergebnis = seminarergebnis_fixture()
      assert %Ecto.Changeset{} = Seminare.change_seminarergebnis(seminarergebnis)
    end
  end

  describe "seminare" do
    alias Lehrstuhl.Seminare.Seminar

    import Lehrstuhl.SeminareFixtures
    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{
      abstraktes_seminar_id: nil,
      titel: nil,
      aufnahmekapazitaet: nil,
      semester: nil,
      praesenzdatum: nil,
      ort: nil
    }

    test "list_seminare/0 returns all seminare" do
      seminar = seminar_fixture()
      assert Seminare.list_seminare_without_preload() == [seminar]
    end

    test "get_seminar!/1 returns the seminar with given id" do
      seminar = seminar_fixture()
      assert Seminare.get_seminar_without_preload!(seminar.id) == seminar
    end

    test "create_seminar/1 with valid data creates a seminar" do
      mitarbeiter = mitarbeiter_fixture()
      abstraktes_seminar = abstraktes_seminar_fixture()

      valid_attrs = %{
        abstraktes_seminar_id: abstraktes_seminar.id,
        mitarbeiter_id: mitarbeiter.id,
        titel: "some titel",
        aufnahmekapazitaet: 42,
        semester: "WS-2020",
        praesenzdatum: ~D[2023-10-25],
        ort: "some ort"
      }

      assert {:ok, %Seminar{} = seminar} = Seminare.create_seminar(valid_attrs)
      assert seminar.abstraktes_seminar_id == abstraktes_seminar.id
      assert seminar.titel == "some titel"
      assert seminar.aufnahmekapazitaet == 42
      assert seminar.semester == "WS-2020"
      assert seminar.praesenzdatum == ~D[2023-10-25]
      assert seminar.ort == "some ort"
    end

    test "create_seminar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seminare.create_seminar(@invalid_attrs)
    end

    test "update_seminar/2 with valid data updates the seminar" do
      seminar = seminar_fixture()
      abstraktes_seminar = abstraktes_seminar_fixture()

      update_attrs = %{
        abstraktes_seminar_id: abstraktes_seminar.id,
        titel: "some updated titel",
        aufnahmekapazitaet: 43,
        semester: "some updated semester",
        praesenzdatum: ~D[2023-10-26],
        ort: "some updated ort"
      }

      assert {:ok, %Seminar{} = seminar} = Seminare.update_seminar(seminar, update_attrs)
      assert seminar.abstraktes_seminar_id == abstraktes_seminar.id
      assert seminar.titel == "some updated titel"
      assert seminar.aufnahmekapazitaet == 43
      assert seminar.semester == "some updated semester"
      assert seminar.praesenzdatum == ~D[2023-10-26]
      assert seminar.ort == "some updated ort"
    end

    test "update_seminar/2 with invalid data returns error changeset" do
      seminar = seminar_fixture()
      assert {:error, %Ecto.Changeset{}} = Seminare.update_seminar(seminar, @invalid_attrs)
      assert seminar == Seminare.get_seminar_without_preload!(seminar.id)
    end

    test "delete_seminar/1 deletes the seminar" do
      seminar = seminar_fixture()
      assert {:ok, %Seminar{}} = Seminare.delete_seminar(seminar)
      assert_raise Ecto.NoResultsError, fn -> Seminare.get_seminar!(seminar.id) end
    end

    test "change_seminar/1 returns a seminar changeset" do
      seminar = seminar_fixture()
      assert %Ecto.Changeset{} = Seminare.change_seminar(seminar)
    end
  end

  describe "abstrakte_seminare" do
    alias Lehrstuhl.Seminare.AbstraktesSeminar

    import Lehrstuhl.SeminareFixtures
    import Lehrstuhl.PersonsFixtures

    @invalid_attrs %{thema: nil, beschreibung: nil}

    test "list_abstrakte_seminare/0 returns all abstrakte_seminare" do
      abstraktes_seminar = abstraktes_seminar_fixture()
      assert Seminare.list_abstrakte_seminare_without_preload() == [abstraktes_seminar]
    end

    test "get_abstraktes_seminar!/1 returns the abstraktes_seminar with given id" do
      abstraktes_seminar = abstraktes_seminar_fixture()

      assert Seminare.get_abstraktes_seminar_without_preload!(abstraktes_seminar.id) ==
               abstraktes_seminar
    end

    test "create_abstraktes_seminar/1 with valid data creates a abstraktes_seminar" do
      mitarbeiter = mitarbeiter_fixture()

      valid_attrs = %{
        thema: "some thema",
        beschreibung: "some beschreibung",
        mitarbeiter_id: mitarbeiter.id
      }

      assert {:ok, %AbstraktesSeminar{} = abstraktes_seminar} =
               Seminare.create_abstraktes_seminar(valid_attrs)

      assert abstraktes_seminar.thema == "some thema"
      assert abstraktes_seminar.beschreibung == "some beschreibung"
    end

    test "create_abstraktes_seminar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Seminare.create_abstraktes_seminar(@invalid_attrs)
    end

    test "update_abstraktes_seminar/2 with valid data updates the abstraktes_seminar" do
      abstraktes_seminar = abstraktes_seminar_fixture()
      update_attrs = %{thema: "some updated thema", beschreibung: "some updated beschreibung"}

      assert {:ok, %AbstraktesSeminar{} = abstraktes_seminar} =
               Seminare.update_abstraktes_seminar(abstraktes_seminar, update_attrs)

      assert abstraktes_seminar.thema == "some updated thema"
      assert abstraktes_seminar.beschreibung == "some updated beschreibung"
    end

    test "update_abstraktes_seminar/2 with invalid data returns error changeset" do
      abstraktes_seminar = abstraktes_seminar_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Seminare.update_abstraktes_seminar(abstraktes_seminar, @invalid_attrs)

      assert abstraktes_seminar ==
               Seminare.get_abstraktes_seminar_without_preload!(abstraktes_seminar.id)
    end

    test "delete_abstraktes_seminar/1 deletes the abstraktes_seminar" do
      abstraktes_seminar = abstraktes_seminar_fixture()
      assert {:ok, %AbstraktesSeminar{}} = Seminare.delete_abstraktes_seminar(abstraktes_seminar)

      assert_raise Ecto.NoResultsError, fn ->
        Seminare.get_abstraktes_seminar!(abstraktes_seminar.id)
      end
    end

    test "change_abstraktes_seminar/1 returns a abstraktes_seminar changeset" do
      abstraktes_seminar = abstraktes_seminar_fixture()
      assert %Ecto.Changeset{} = Seminare.change_abstraktes_seminar(abstraktes_seminar)
    end
  end
end
