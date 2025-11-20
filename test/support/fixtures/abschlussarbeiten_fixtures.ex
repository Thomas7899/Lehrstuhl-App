defmodule Lehrstuhl.AbschlussarbeitenFixtures do
  import Lehrstuhl.PersonsFixtures
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lehrstuhl.Abschlussarbeiten` context.
  """

  @doc """
  Generate a abstrakte_abschlussarbeiten.
  """
  def abstrakte_abschlussarbeiten_fixture(attrs \\ %{}) do
    mitarbeiter = mitarbeiter_fixture()
    {:ok, abstrakte_abschlussarbeiten} =
      attrs
      |> Enum.into(%{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "some semester",
        thema: "some thema",
        themenskizze: "some themenskizze",
        mitarbeiter_id: mitarbeiter.id
      })
      |> Lehrstuhl.Abschlussarbeiten.create_abstrakte_abschlussarbeiten()

    abstrakte_abschlussarbeiten

  end

  @doc """
  Generate a konkrete_abschlussarbeiten.
  """
  def konkrete_abschlussarbeiten_fixture(attrs \\ %{}) do
    student = student_fixture()
    mitarbeiter = mitarbeiter_fixture()
    abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
    {:ok, konkrete_abschlussarbeiten} =
      attrs
      |> Enum.into(%{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "some semester",
        matrikelnummer: "some matrikelnummer",
        angepasste_themenskizze: "some angepasste_themenskizze",
        gesetzte_schwerpunkte: "some gesetzte_schwerpunkte",
        anmeldung_pruefungsamt: ~D[2023-11-28],
        abgabedatum: ~D[2023-11-28],
        studienniveau: :bachelor,
        student_id: student.id,
        mitarbeiter_id: mitarbeiter.id,
        abstrakte_abschlussarbeiten_id: abstrakte_abschlussarbeiten.id

      })
      |> Lehrstuhl.Abschlussarbeiten.create_konkrete_abschlussarbeiten()

    konkrete_abschlussarbeiten
  end

  @doc """
  Generate a ergebnisse_abschlussarbeiten.
  """
  def ergebnisse_abschlussarbeiten_fixture(attrs \\ %{}) do
    student = student_fixture()
    {:ok, ergebnisse_abschlussarbeiten} =
      attrs
      |> Enum.into(%{
        status: :bestanden,
        matrikelnummer: "some matrikelnummer",
        studienniveau: :bachelorarbeit,
        korrekturdatum: ~D[2023-12-24],
        note: "120.5",
        student_id: student.id
      })
      |> Lehrstuhl.Abschlussarbeiten.create_ergebnisse_abschlussarbeiten()

    ergebnisse_abschlussarbeiten
  end
end
