defmodule Lehrstuhl.AbschlussarbeitenFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lehrstuhl.Abschlussarbeiten` context.
  """

  @doc """
  Generate a abstrakte_abschlussarbeiten.
  """
  def abstrakte_abschlussarbeiten_fixture(attrs \\ %{}) do

    {:ok, abstrakte_abschlussarbeiten} =
      attrs
      |> Enum.into(%{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "SS-23",
        thema: "some thema",
        themenskizze: "some themenskizze",
        mitarbeiter_id: "33e68a9e-069e-4e28-96d5-3d85c5849fbc"
      })
      |> Lehrstuhl.Abschlussarbeiten.create_abstrakte_abschlussarbeiten()

    abstrakte_abschlussarbeiten
  end

  @doc """
  Generate a konkrete_abschlussarbeiten.
  """
  def konkrete_abschlussarbeiten_fixture(attrs \\ %{}) do
    {:ok, konkrete_abschlussarbeiten} =
      attrs
      |> Enum.into(%{
        betreuer: :hansen,
        forschungsprojekt: :sport,
        semester: "SS-23",
        matrikelnummer: "some matrikelnummer",
        angepasste_themenskizze: "some angepasste_themenskizze",
        gesetzte_schwerpunkte: "some gesetzte_schwerpunkte",
        anmeldung_pruefungsamt: ~D[2023-11-28],
        abgabedatum: ~D[2023-11-28],
        studienniveau: :bachelor,
        student_id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1",
        mitarbeiter_id: "33e68a9e-069e-4e28-96d5-3d85c5849fbc",
        abstrakte_abschlussarbeiten_id: "55e68a9e-069e-4e28-96d5-3d85c5849fbc"

      })
      |> Lehrstuhl.Abschlussarbeiten.create_konkrete_abschlussarbeiten()

    konkrete_abschlussarbeiten
  end

  @doc """
  Generate a ergebnisse_abschlussarbeiten.
  """
  def ergebnisse_abschlussarbeiten_fixture(attrs \\ %{}) do
    {:ok, ergebnisse_abschlussarbeiten} =
      attrs
      |> Enum.into(%{
        status: :bestanden,
        matrikelnummer: "some matrikelnummer",
        studienniveau: :bachelorarbeit,
        korrekturdatum: ~D[2023-12-24],
        note: "120.5",
        student_id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1"
      })
      |> Lehrstuhl.Abschlussarbeiten.create_ergebnisse_abschlussarbeiten()

    ergebnisse_abschlussarbeiten
  end
end
