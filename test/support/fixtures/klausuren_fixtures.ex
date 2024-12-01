defmodule Lehrstuhl.KlausurenFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lehrstuhl.Klausuren` context.
  """

  @doc """
  Generate a klausur.
  """
  def klausur_fixture(attrs \\ %{}) do
    modul = modul_fixture()

    {:ok, klausur} =
      attrs
      |> Enum.into(%{
        modul_id: modul.id,
        kenner: "some kenner",
        beschreibung: "some beschreibung",
        punkteGesamt: 42,
        semester: "WS-2020",
        praesenzdatum: ~D[2023-10-28],
        ort: "some ort"
      })
      |> Lehrstuhl.Klausuren.create_klausur()

    klausur
  end

  import Lehrstuhl.PersonsFixtures

  @doc """
  Generate a modul.
  """
  def modul_fixture(attrs \\ %{}) do
    mitarbeiter = mitarbeiter_fixture()

    {:ok, modul} =
      attrs
      |> Enum.into(%{
        id: "66e68a9e-069e-4e28-96d5-3d85c5849fba",
        name: "some name",
        mitarbeiter_id: mitarbeiter.id,
        lehrstuhlinhaber_id: mitarbeiter.id
      })
      |> Lehrstuhl.Klausuren.create_modul()

    modul
  end

  @doc """
  Generate a klausurergebnis.
  """
  def klausurergebnis_fixture(attrs \\ %{}) do
    student = student_fixture()
    klausur = klausur_fixture()

    {:ok, klausurergebnis} =
      attrs
      |> Enum.into(%{
        punkte: 42,
        student_id: student.id,
        klausur_id: klausur.id
      })
      |> Lehrstuhl.Klausuren.create_klausurergebnis()

    klausurergebnis
  end
end
