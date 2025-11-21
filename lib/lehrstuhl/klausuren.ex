defmodule Lehrstuhl.Klausuren do
  @moduledoc """
  The Klausuren context.
  """

  import Ecto.Query, warn: false
  alias Lehrstuhl.Repo

  alias Lehrstuhl.Klausuren.Klausur
  alias Lehrstuhl.Klausuren.Klausurergebnis

  @doc """
  Returns the list of klausuren.

  ## Examples

      iex> list_klausuren()
      [%Klausur{}, ...]

  """

# lib/lehrstuhl/klausuren.ex

alias Lehrstuhl.Persons
# Zählt alle Klausuren (gesamt)
  def count_klausuren do
    Repo.aggregate(Klausur, :count, :id)
  end

  # Zählt anstehende Klausuren (muss Ecto.Query importiert haben)
  def count_upcoming_klausuren do
    today = Date.utc_today()
    from(k in Klausur, where: k.klausurdatum >= ^today)
    |> Repo.aggregate(:count, :id)
  end
# Das erzeugt ein Modul namens Lehrstuhl.Klausuren.MyParser
  NimbleCSV.define(MyParser, separator: ";", escape: "\"")
  # ----

def import_klausurergebnisse(klausur_id, file_path) do
    IO.puts("--- STARTE IMPORT ---")
    # Debug Ausgabe
    IO.inspect(File.read!(file_path), label: "Datei-Inhalt Raw")

    # WICHTIG: Hier rufen wir jetzt den lokalen Parser auf
    MyParser.parse_stream(File.stream!(file_path))
    |> Enum.reduce({0, 0}, fn row, {created, errors} ->
      IO.inspect(row, label: "Geparste Zeile")

      case row do
        [matrikelnummer, punkte] ->
          # Matrikelnummer bereinigen (falls Leerzeichen drin sind)
          matrikelnummer = String.trim(matrikelnummer)
          punkte = String.trim(punkte)

          case Persons.get_student_by_matrikelnummer(matrikelnummer) do
            nil ->
              IO.puts("FEHLER: Student #{matrikelnummer} nicht gefunden.")
              {created, errors + 1}

            student ->
              punkte_int = String.to_integer(punkte)

              # Note berechnen (Beispiel-Logik)
              note =
                cond do
                  punkte_int >= 90 -> 1.0
                  punkte_int >= 80 -> 2.0
                  punkte_int >= 65 -> 3.0
                  punkte_int >= 50 -> 4.0
                  true -> 5.0
                end

              attrs = %{
                student_id: student.id,
                klausur_id: klausur_id,
                punkte: punkte_int,
                note: note,
                status: if(punkte_int >= 50, do: :bestanden, else: :nicht_bestanden),
                versuche: 1,
                pruefungsdatum: Date.utc_today() # Oder das der Klausur nehmen
              }

              case create_klausurergebnis(attrs) do
                {:ok, _} -> {created + 1, errors}
                {:error, changeset} ->
                  IO.inspect(changeset.errors, label: "DB Error")
                  {created, errors + 1}
              end
          end

        _ ->
          IO.puts("FORMAT FEHLER")
          {created, errors + 1}
      end
    end)
  end

# lib/lehrstuhl/persons.ex
def get_student_by_matrikelnummer(matnr) do
  Repo.get_by(Student, matrikelnummer: matnr)
end

def list_klausuren_for_modul(modul_id) do
  Klausur
  |> where([k], k.modul_id == ^modul_id)
  |> Repo.all()
  |> Repo.preload(:klausurergebnisse)
end

def notenverteilung(klausur_id) do
  from(ke in Klausurergebnis,
    where: ke.klausur_id == ^klausur_id,
    group_by: ke.note,
    select: {ke.note, count(ke.id)}
  )
  |> Repo.all()
end

def versuche_und_punkte(student_id, klausur_id) do
  from(k in Klausurergebnis,
    where: k.student_id == ^student_id and k.klausur_id == ^klausur_id,
    select: {count(k.id), max(k.punkte)}
  )
  |> Repo.one()
end

  def list_klausuren do
    Klausur
    |> Repo.all()
    |> Repo.preload(:modul)
  end

  def list_klausuren_without_preload do
    Klausur
    |> Repo.all()
  end

  @doc """
  Gets a single klausur.

  Raises `Ecto.NoResultsError` if the Klausur does not exist.

  ## Examples

      iex> get_klausur!(123)
      %Klausur{}

      iex> get_klausur!(456)
      ** (Ecto.NoResultsError)

  """
  def get_klausur!(id), do: Repo.get!(Klausur, id) |> Repo.preload(:modul)

  def get_klausur_without_preload!(id), do: Repo.get!(Klausur, id)

  @doc """
  Creates a klausur.

  ## Examples

      iex> create_klausur(%{field: value})
      {:ok, %Klausur{}}

      iex> create_klausur(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_klausur(attrs \\ %{}) do
    %Klausur{}
    |> Klausur.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a klausur.

  ## Examples

      iex> update_klausur(klausur, %{field: new_value})
      {:ok, %Klausur{}}

      iex> update_klausur(klausur, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_klausur(%Klausur{} = klausur, attrs) do
    klausur
    |> Klausur.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, klausur} -> {:ok, Repo.preload(klausur, :modul)}
      error -> error
    end
  end

  @doc """
  Deletes a klausur.

  ## Examples

      iex> delete_klausur(klausur)
      {:ok, %Klausur{}}

      iex> delete_klausur(klausur)
      {:error, %Ecto.Changeset{}}

  """
  def delete_klausur(%Klausur{} = klausur) do
    Repo.delete(klausur)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking klausur changes.

  ## Examples

      iex> change_klausur(klausur)
      %Ecto.Changeset{data: %Klausur{}}

  """
  def change_klausur(%Klausur{} = klausur, attrs \\ %{}) do
    Klausur.changeset(klausur, attrs)
  end

  alias Lehrstuhl.Klausuren.Modul

  @doc """
  Returns the list of module.

  ## Examples

      iex> list_module()
      [%Modul{}, ...]

  """
  def list_module do
    Modul
    |> Repo.all()
    |> Repo.preload([:mitarbeiter, :lehrstuhlinhaber])
  end

  def list_module_without_preload do
    Modul
    |> Repo.all()
  end

  @doc """
  Gets a single modul.

  Raises `Ecto.NoResultsError` if the Modul does not exist.

  ## Examples

      iex> get_modul!(123)
      %Modul{}

      iex> get_modul!(456)
      ** (Ecto.NoResultsError)

  """
  def get_modul!(id) do
  Repo.get!(Modul, id)
  |> Repo.preload([
    :mitarbeiter,
    :lehrstuhlinhaber,
    klausuren: [:klausurergebnisse]
  ])
end

  def get_modul_without_preload!(id), do: Repo.get!(Modul, id)

  @doc """
  Creates a modul.

  ## Examples

      iex> create_modul(%{field: value})
      {:ok, %Modul{}}

      iex> create_modul(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_modul(attrs \\ %{}) do
    %Modul{}
    |> Modul.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a modul.

  ## Examples

      iex> update_modul(modul, %{field: new_value})
      {:ok, %Modul{}}

      iex> update_modul(modul, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_modul(%Modul{} = modul, attrs) do
    modul
    |> Modul.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, modul} -> {:ok, Repo.preload(modul, [:mitarbeiter, :lehrstuhlinhaber])}
      error -> error
    end
  end

  @doc """
  Deletes a modul.

  ## Examples

      iex> delete_modul(modul)
      {:ok, %Modul{}}

      iex> delete_modul(modul)
      {:error, %Ecto.Changeset{}}

  """
  def delete_modul(%Modul{} = modul) do
    Repo.delete(modul)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking modul changes.

  ## Examples

      iex> change_modul(modul)
      %Ecto.Changeset{data: %Modul{}}

  """
  def change_modul(%Modul{} = modul, attrs \\ %{}) do
    Modul.changeset(modul, attrs)
  end

  alias Lehrstuhl.Klausuren.Klausurergebnis

  @doc """
  Returns the list of klausurergebnisse.

  ## Examples

      iex> list_klausurergebnisse()
      [%Klausurergebnis{}, ...]

  """
  def list_klausurergebnisse do
    Klausurergebnis
    |> Repo.all()
    |> Repo.preload([:student, :klausur])
  end

  def list_klausurergebnisse_without_preload do
    Repo.all(Klausurergebnis)
  end

  def list_klausurergebnisse_for_klausur(klausur_id) do
    query =
      from(ke in Klausurergebnis,
        where: ke.klausur_id == ^klausur_id,
        join: p in assoc(ke, :student),
        preload: [student: p]
      )

    Repo.all(query)
  end

  @doc """
  Gets a single klausurergebnis.

  Raises `Ecto.NoResultsError` if the Klausurergebnis does not exist.

  ## Examples

      iex> get_klausurergebnis!(123)
      %Klausurergebnis{}

      iex> get_klausurergebnis!(456)
      ** (Ecto.NoResultsError)

  """
  def get_klausurergebnis!(id),
    do: Repo.get!(Klausurergebnis, id) |> Repo.preload([:student, :klausur])

  def get_klausurergebnis_without_preload!(id), do: Repo.get!(Klausurergebnis, id)

  @doc """
  Creates a klausurergebnis.

  ## Examples

      iex> create_klausurergebnis(%{field: value})
      {:ok, %Klausurergebnis{}}

      iex> create_klausurergebnis(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_klausurergebnis(attrs \\ %{}) do
    %Klausurergebnis{}
    |> Klausurergebnis.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a klausurergebnis.

  ## Examples

      iex> update_klausurergebnis(klausurergebnis, %{field: new_value})
      {:ok, %Klausurergebnis{}}

      iex> update_klausurergebnis(klausurergebnis, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_klausurergebnis(%Klausurergebnis{} = klausurergebnis, attrs) do
    klausurergebnis
    |> Klausurergebnis.changeset(attrs)
    |> Repo.update()
    |> case do
      {:ok, klausurergebnis} -> {:ok, Repo.preload(klausurergebnis, [:klausur, :student])}
      error -> error
    end
  end

  # unused
  def update_klausurergebnis_without_preload(%Klausurergebnis{} = klausurergebnis, attrs) do
    klausurergebnis
    |> Klausurergebnis.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a klausurergebnis.

  ## Examples

      iex> delete_klausurergebnis(klausurergebnis)
      {:ok, %Klausurergebnis{}}

      iex> delete_klausurergebnis(klausurergebnis)
      {:error, %Ecto.Changeset{}}

  """
  def delete_klausurergebnis(%Klausurergebnis{} = klausurergebnis) do
    Repo.delete(klausurergebnis)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking klausurergebnis changes.

  ## Examples

      iex> change_klausurergebnis(klausurergebnis)
      %Ecto.Changeset{data: %Klausurergebnis{}}

  """
  def change_klausurergebnis(%Klausurergebnis{} = klausurergebnis, attrs \\ %{}) do
    Klausurergebnis.changeset(klausurergebnis, attrs)
  end
end
