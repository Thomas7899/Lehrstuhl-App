defmodule Lehrstuhl.KlausurFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lehrstuhl.Klausur` context.
  """

  @doc """
  Generate a modul.
  """
  def modul_fixture(attrs \\ %{}) do
    {:ok, modul} =
      attrs
      |> Enum.into(%{
        name: "some name",
        beschreibung: "some beschreibung"
      })
      |> Lehrstuhl.Klausuren.create_modul()

    modul
  end
end
