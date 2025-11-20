defmodule Lehrstuhl.KlausurenTest do
  use Lehrstuhl.DataCase

  alias Lehrstuhl.Klausuren
  import Lehrstuhl.PersonsFixtures

  describe "klausuren" do
    alias Lehrstuhl.Klausuren.Klausur
    import Lehrstuhl.KlausurenFixtures

    @invalid_attrs %{
      kenner: nil,
      beschreibung: nil,
      punkteGesamt: nil,
      semester: nil,
      praesenzdatum: nil,
      ort: nil
    }

    test "list_klausuren/0 returns all klausuren" do
      klausur = klausur_fixture()
      assert Klausuren.list_klausuren_without_preload() == [klausur]
    end

    test "get_klausur!/1 returns the klausur with given id" do
      klausur = klausur_fixture()
      assert Klausuren.get_klausur_without_preload!(klausur.id) == klausur
    end

    test "create_klausur/1 with valid data creates a klausur" do
      modul = modul_fixture()

      valid_attrs = %{
        kenner: "some kenner",
        modul_id: modul.id,
        beschreibung: "some beschreibung",
        punkteGesamt: 42,
        semester: "WS-2020",
        praesenzdatum: ~D[2023-10-28],
        ort: "some ort"
      }

      assert {:ok, %Klausur{} = klausur} = Klausuren.create_klausur(valid_attrs)
      assert klausur.kenner == "some kenner"
      assert klausur.beschreibung == "some beschreibung"
      assert klausur.punkteGesamt == 42
      assert klausur.modul_id == modul.id
      assert klausur.semester == "WS-2020"
      assert klausur.praesenzdatum == ~D[2023-10-28]
      assert klausur.ort == "some ort"
    end

    test "create_klausur/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Klausuren.create_klausur(@invalid_attrs)
    end

    test "update_klausur/2 with valid data updates the klausur" do
      klausur = klausur_fixture()

      update_attrs = %{
        kenner: "some updated kenner",
        beschreibung: "some updated beschreibung",
        punkteGesamt: 43,
        semester: "WS-2021",
        praesenzdatum: ~D[2023-10-29],
        ort: "some updated ort"
      }

      assert {:ok, %Klausur{} = klausur} = Klausuren.update_klausur(klausur, update_attrs)
      assert klausur.kenner == "some updated kenner"
      assert klausur.beschreibung == "some updated beschreibung"
      assert klausur.punkteGesamt == 43
      assert klausur.semester == "WS-2021"
      assert klausur.praesenzdatum == ~D[2023-10-29]
      assert klausur.ort == "some updated ort"
    end

    test "update_klausur/2 with invalid data returns error changeset" do
      klausur = klausur_fixture()
      assert {:error, %Ecto.Changeset{}} = Klausuren.update_klausur(klausur, @invalid_attrs)
      assert klausur == Klausuren.get_klausur_without_preload!(klausur.id)
    end

    test "delete_klausur/1 deletes the klausur" do
      klausur = klausur_fixture()
      assert {:ok, %Klausur{}} = Klausuren.delete_klausur(klausur)

      assert_raise Ecto.NoResultsError, fn ->
        Klausuren.get_klausur_without_preload!(klausur.id)
      end
    end

    test "change_klausur/1 returns a klausur changeset" do
      klausur = klausur_fixture()
      assert %Ecto.Changeset{} = Klausuren.change_klausur(klausur)
    end
  end

  describe "module" do
    alias Lehrstuhl.Klausuren.Modul

    import Lehrstuhl.KlausurenFixtures

    @invalid_attrs %{name: nil, betreuer: nil, lehrstuhlinahber: nil}

    test "list_module/0 returns all module" do
      modul = modul_fixture()
      assert Klausuren.list_module_without_preload() == [modul]
    end

    test "get_modul!/1 returns the modul with given id" do
      modul = modul_fixture()
      assert Klausuren.get_modul_without_preload!(modul.id) == modul
    end

    test "create_modul/1 with valid data creates a modul" do
      mitarbeiter = mitarbeiter_fixture()

      valid_attrs = %{
        name: "some name",
        mitarbeiter_id: mitarbeiter.id,
        lehrstuhlinhaber_id: mitarbeiter.id
      }

      assert {:ok, %Modul{} = modul} = Klausuren.create_modul(valid_attrs)
      assert modul.name == "some name"
    end

    test "create_modul/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Klausuren.create_modul(@invalid_attrs)
    end

    test "update_modul/2 with valid data updates the modul" do
      modul = modul_fixture()

      update_attrs = %{
        name: "some updated name"
      }

      assert {:ok, %Modul{} = modul} = Klausuren.update_modul(modul, update_attrs)
      assert modul.name == "some updated name"
    end

    test "update_modul/2 with invalid data returns error changeset" do
      modul = modul_fixture()
      assert {:error, %Ecto.Changeset{}} = Klausuren.update_modul(modul, @invalid_attrs)
      assert modul == Klausuren.get_modul_without_preload!(modul.id)
    end

    test "delete_modul/1 deletes the modul" do
      modul = modul_fixture()
      assert {:ok, %Modul{}} = Klausuren.delete_modul(modul)
      assert_raise Ecto.NoResultsError, fn -> Klausuren.get_modul!(modul.id) end
    end

    test "change_modul/1 returns a modul changeset" do
      modul = modul_fixture()
      assert %Ecto.Changeset{} = Klausuren.change_modul(modul)
    end
  end

  describe "klausurergebnisse" do
    alias Lehrstuhl.Klausuren.Klausurergebnis

    import Lehrstuhl.KlausurenFixtures

    test "list_klausurergebnisse/0 returns all klausurergebnisse" do
      klausurergebnis = klausurergebnis_fixture()
      assert Klausuren.list_klausurergebnisse_without_preload() == [klausurergebnis]
    end

    test "get_klausurergebnis!/1 returns the klausurergebnis with given id" do
      klausurergebnis = klausurergebnis_fixture()
      assert Klausuren.get_klausurergebnis_without_preload!(klausurergebnis.id) == klausurergebnis
    end

    test "create_klausurergebnis/1 with valid data creates a klausurergebnis" do
      klausurergebnis = klausurergebnis_fixture()

      valid_attrs = %{
        punkte: 42,
        student_id: klausurergebnis.student_id,
        klausur_id: klausurergebnis.klausur_id
      }

      assert {:ok, %Klausurergebnis{} = klausurergebnis} =
               Klausuren.create_klausurergebnis(valid_attrs)

      assert klausurergebnis.punkte == 42
      assert klausurergebnis.student_id == klausurergebnis.student_id
      assert klausurergebnis.klausur_id == klausurergebnis.klausur_id
    end

    test "update_klausurergebnis/2 with valid data updates the klausurergebnis" do
      klausurergebnis = klausurergebnis_fixture()

      update_attrs = %{
        punkte: 43,
        student_id: klausurergebnis.student_id,
        klausur_id: klausurergebnis.klausur_id
      }

      assert {:ok, %Klausurergebnis{} = klausurergebnis} =
               Klausuren.update_klausurergebnis(klausurergebnis, update_attrs)

      assert klausurergebnis.punkte == 43
      assert klausurergebnis.student_id == klausurergebnis.student_id
      assert klausurergebnis.klausur_id == klausurergebnis.klausur_id
    end

    test "delete_klausurergebnis/1 deletes the klausurergebnis" do
      klausurergebnis = klausurergebnis_fixture()
      assert {:ok, %Klausurergebnis{}} = Klausuren.delete_klausurergebnis(klausurergebnis)

      assert_raise Ecto.NoResultsError, fn ->
        Klausuren.get_klausurergebnis!(klausurergebnis.id)
      end
    end

    test "change_klausurergebnis/1 returns a klausurergebnis changeset" do
      klausurergebnis = klausurergebnis_fixture()
      assert %Ecto.Changeset{} = Klausuren.change_klausurergebnis(klausurergebnis)
    end
  end
end
