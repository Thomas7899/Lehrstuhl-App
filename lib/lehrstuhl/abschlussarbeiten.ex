defmodule Lehrstuhl.Abschlussarbeiten do
  @moduledoc """
  The Abschlussarbeiten context.
  """

  import Ecto.Query, warn: false
  alias Lehrstuhl.Repo

  alias Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten
  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

  @doc """
  Returns the list of abstrakte_abschlussarbeiten.

  ## Examples

      iex> list_abstrakte_abschlussarbeiten()
      [%AbstrakteAbschlussarbeiten{}, ...]

  """
#Suchfunktion
def suche_abschlussarbeiten(filter) do
  query = (from ka in KonkreteAbschlussarbeiten,
  where: ilike(ka.matrikelnummer, ^"%#{filter["q"]}%"))
  Repo.all(query)
end


  def list_abstrakte_abschlussarbeiten do
   Repo.all(AbstrakteAbschlussarbeiten)
  #|> Lehrstuhl.Repo.preload(:mitarbeiter)
  end

#Neue Funktion
def list_abstrakte_abschlussarbeiten_konkret() do
  query =
    from aa in AbstrakteAbschlussarbeiten,
      join: ka in KonkreteAbschlussarbeiten,
      on: aa.forschungsprojekt == ka.forschungsprojekt,
      where: aa.semester == ka.semester,
      preload: [konkrete_abschlussarbeiten: ka]
  Repo.all(query)
  # query = from(aa in AbstrakteAbschlussarbeiten,
  #   join: ka in KonkreteAbschlussarbeiten,
  #   on: aa.forschungsprojekt == ka.forschungsprojekt,
  #   on: aa.betreuer == ka.betreuer,
  #   on: aa.semester == ka.semester,
  #   preload: [konkrete_abschlussarbeiten: ka],
  #   select: {aa})
  # Repo.all(query)
end


#Funktionen zum Filtern der Abschlussarbeiten

def list_abstrakte_abschlussarbeiten(filter) when is_map(filter) do
  from(AbstrakteAbschlussarbeiten)
  |> filter_by_betreuer1(filter)
  |> filter_by_semester1(filter)
  |> filter_by_thema(filter)
  #|> Repo.preload([:konkrete_abschlussarbeiten])
  #|> Repo.preload([abstrakte_abschlussarbeiten: :konkrete_abschlussarbeiten])
  |> Repo.all()
  #|> Repo.preload(:konkrete_abschlussarbeiten)
end


#Abfrage der Datenbank nach Eingabe von Query

defp filter_by_thema(query, %{thema: ""}), do: query

defp filter_by_thema(query, %{thema: thema}) do
  where(query, thema: ^thema)
end

defp filter_by_betreuer1(query, %{betreuer: ""}), do: query

defp filter_by_betreuer1(query, %{betreuer: betreuer}) do
  where(query, betreuer: ^betreuer)
end

defp filter_by_semester1(query, %{semester: ""}), do: query

defp filter_by_semester1(query, %{semester: semester}) do
  where(query, semester: ^semester)
end




  @doc """
  Gets a single abstrakte_abschlussarbeiten.

  Raises `Ecto.NoResultsError` if the Abstrakte abschlussarbeiten does not exist.

  ## Examples

      iex> get_abstrakte_abschlussarbeiten!(123)
      %AbstrakteAbschlussarbeiten{}

      iex> get_abstrakte_abschlussarbeiten!(456)
      ** (Ecto.NoResultsError)

  """
  def get_abstrakte_abschlussarbeiten!(id), do:
  Repo.get!(AbstrakteAbschlussarbeiten, id)
  |> Lehrstuhl.Repo.preload(:mitarbeiter)

  @doc """
  Creates a abstrakte_abschlussarbeiten.

  ## Examples

      iex> create_abstrakte_abschlussarbeiten(%{field: value})
      {:ok, %AbstrakteAbschlussarbeiten{}}

      iex> create_abstrakte_abschlussarbeiten(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_abstrakte_abschlussarbeiten(attrs \\ %{}) do
    %AbstrakteAbschlussarbeiten{}
    |> AbstrakteAbschlussarbeiten.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a abstrakte_abschlussarbeiten.

  ## Examples

      iex> update_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten, %{field: new_value})
      {:ok, %AbstrakteAbschlussarbeiten{}}

      iex> update_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_abstrakte_abschlussarbeiten(%AbstrakteAbschlussarbeiten{} = abstrakte_abschlussarbeiten, attrs) do
    abstrakte_abschlussarbeiten
    |> AbstrakteAbschlussarbeiten.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a abstrakte_abschlussarbeiten.

  ## Examples

      iex> delete_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)
      {:ok, %AbstrakteAbschlussarbeiten{}}

      iex> delete_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)
      {:error, %Ecto.Changeset{}}

  """
  def delete_abstrakte_abschlussarbeiten(%AbstrakteAbschlussarbeiten{} = abstrakte_abschlussarbeiten) do
    Repo.delete(abstrakte_abschlussarbeiten)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking abstrakte_abschlussarbeiten changes.

  ## Examples

      iex> change_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)
      %Ecto.Changeset{data: %AbstrakteAbschlussarbeiten{}}

  """
  def change_abstrakte_abschlussarbeiten(%AbstrakteAbschlussarbeiten{} = abstrakte_abschlussarbeiten, attrs \\ %{}) do
    AbstrakteAbschlussarbeiten.changeset(abstrakte_abschlussarbeiten, attrs)
  end

  #def list_abstrakte_abschlussarbeiten_konkret(filter) do
 # from(AbstrakteAbschlussarbeiten)
  #|> filter_by_betreuer1(filter)
  #|> filter_by_semester1(filter)
  #|> filter_by_thema(filter)
  #|> Repo.preload([:konkrete_abschlussarbeiten])
  #|> Repo.all()
  #|> Repo.preload(:konkrete_abschlussarbeiten)
#end

#|> Repo.preload([konkrete_abschlussarbeiten])

  alias Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten

  @doc """
  Returns the list of konkrete_abschlussarbeiten.

  ## Examples

      iex> list_konkrete_abschlussarbeiten()
      [%KonkreteAbschlussarbeiten{}, ...]

  """
  def list_konkrete_abschlussarbeiten do
    Repo.all(KonkreteAbschlussarbeiten)
    |> Lehrstuhl.Repo.preload(:abstrakte_abschlussarbeiten)
  end

   #Funktionen zum Filtern der Abschlussarbeiten

   def list_konkrete_abschlussarbeiten(filter) when is_map(filter) do
    from(KonkreteAbschlussarbeiten)
    |> filter_by_betreuer2(filter)
    |> filter_by_semester2(filter)
    |> filter_by_forschungsprojekt(filter)
    |> Repo.all()
  end

  #Abfrage der Datenbank nach Eingabe von Query

  defp filter_by_betreuer2(query, %{betreuer: ""}), do: query

  defp filter_by_betreuer2(query, %{betreuer: betreuer}) do
    where(query, betreuer: ^betreuer)
  end

  defp filter_by_semester2(query, %{semester: ""}), do: query

  defp filter_by_semester2(query, %{semester: semester}) do
    where(query, semester: ^semester)
  end

  defp filter_by_forschungsprojekt(query, %{forschungsprojekt: ""}), do: query

  defp filter_by_forschungsprojekt(query, %{forschungsprojekt: forschungsprojekt}) do
    where(query, forschungsprojekt: ^forschungsprojekt)
  end

  @doc """
  Gets a single konkrete_abschlussarbeiten.

  Raises `Ecto.NoResultsError` if the Konkrete abschlussarbeiten does not exist.

  ## Examples

      iex> get_konkrete_abschlussarbeiten!(123)
      %KonkreteAbschlussarbeiten{}

      iex> get_konkrete_abschlussarbeiten!(456)
      ** (Ecto.NoResultsError)

  """
def get_konkrete_abschlussarbeiten!(id) do
  Lehrstuhl.Repo.get!(Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten, id)
  |> Lehrstuhl.Repo.preload(:student)
  |> Lehrstuhl.Repo.preload(:abstrakte_abschlussarbeiten)
end


  @doc """
  Creates a konkrete_abschlussarbeiten.

  ## Examples

      iex> create_konkrete_abschlussarbeiten(%{field: value})
      {:ok, %KonkreteAbschlussarbeiten{}}

      iex> create_konkrete_abschlussarbeiten(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_konkrete_abschlussarbeiten(attrs \\ %{}) do
    %KonkreteAbschlussarbeiten{}
    |> KonkreteAbschlussarbeiten.changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:student_id])
    |> Repo.insert()
  end

  @doc """
  Updates a konkrete_abschlussarbeiten.

  ## Examples

      iex> update_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten, %{field: new_value})
      {:ok, %KonkreteAbschlussarbeiten{}}

      iex> update_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_konkrete_abschlussarbeiten(%KonkreteAbschlussarbeiten{} = konkrete_abschlussarbeiten, attrs) do
    konkrete_abschlussarbeiten
    |> KonkreteAbschlussarbeiten.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a konkrete_abschlussarbeiten.

  ## Examples

      iex> delete_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)
      {:ok, %KonkreteAbschlussarbeiten{}}

      iex> delete_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)
      {:error, %Ecto.Changeset{}}

  """
  def delete_konkrete_abschlussarbeiten(%KonkreteAbschlussarbeiten{} = konkrete_abschlussarbeiten) do
    Repo.delete(konkrete_abschlussarbeiten)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking konkrete_abschlussarbeiten changes.

  ## Examples

      iex> change_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)
      %Ecto.Changeset{data: %KonkreteAbschlussarbeiten{}}

  """
  def change_konkrete_abschlussarbeiten(%KonkreteAbschlussarbeiten{} = konkrete_abschlussarbeiten, attrs \\ %{}) do
    KonkreteAbschlussarbeiten.changeset(konkrete_abschlussarbeiten, attrs)
  end

  alias Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten

  @doc """
  Returns the list of ergebnisse_abschlussarbeiten.

  ## Examples

      iex> list_ergebnisse_abschlussarbeiten()
      [%ErgebnisseAbschlussarbeiten{}, ...]

  """
  def list_ergebnisse_abschlussarbeiten do
    Repo.all(from a in ErgebnisseAbschlussarbeiten, order_by: [asc: a.id])
  end

  #Funktionen um Ergebnisse zu sortieren und Paginierung

  def list_ergebnisse_abschlussarbeiten(options) when is_map(options) do
    from(ErgebnisseAbschlussarbeiten)
    |> sort(options)
    |> paginate(options)
    |> Repo.all()
  end

  defp sort(query, %{sort_by: sort_by, sort_order: sort_order}) do
    order_by(query, {^sort_order, ^sort_by})
  end

  defp sort(query, _options), do: query

  defp paginate(query, %{page: page, per_page: per_page}) do
    offset = max(page - 1, 0) * per_page

    query
    |> limit(^per_page)
    |> offset(^offset)
  end

  defp paginate(query, _options), do: query

  @doc """
  Gets a single ergebnisse_abschlussarbeiten.

  Raises `Ecto.NoResultsError` if the Ergebnisse abschlussarbeiten does not exist.

  ## Examples

      iex> get_ergebnisse_abschlussarbeiten!(123)
      %ErgebnisseAbschlussarbeiten{}

      iex> get_ergebnisse_abschlussarbeiten!(456)
      ** (Ecto.NoResultsError)

  """

  def get_ergebnisse_abschlussarbeiten!(id) do
    Repo.get!(ErgebnisseAbschlussarbeiten, id)
    |> Lehrstuhl.Repo.preload([:konkrete_abschlussarbeiten])
  end


  @doc """
  Creates a ergebnisse_abschlussarbeiten.

  ## Examples

      iex> create_ergebnisse_abschlussarbeiten(%{field: value})
      {:ok, %ErgebnisseAbschlussarbeiten{}}

      iex> create_ergebnisse_abschlussarbeiten(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ergebnisse_abschlussarbeiten(attrs \\ %{}) do
    %ErgebnisseAbschlussarbeiten{}
    |> ErgebnisseAbschlussarbeiten.changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [:konkrete_abschlussarbeiten_id])
    |> Repo.insert()
  end

  @doc """
  Updates a ergebnisse_abschlussarbeiten.

  ## Examples

      iex> update_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten, %{field: new_value})
      {:ok, %ErgebnisseAbschlussarbeiten{}}

      iex> update_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ergebnisse_abschlussarbeiten(%ErgebnisseAbschlussarbeiten{} = ergebnisse_abschlussarbeiten, attrs) do
    ergebnisse_abschlussarbeiten
    |> ErgebnisseAbschlussarbeiten.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ergebnisse_abschlussarbeiten.

  ## Examples

      iex> delete_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)
      {:ok, %ErgebnisseAbschlussarbeiten{}}

      iex> delete_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ergebnisse_abschlussarbeiten(%ErgebnisseAbschlussarbeiten{} = ergebnisse_abschlussarbeiten) do
    Repo.delete(ergebnisse_abschlussarbeiten)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ergebnisse_abschlussarbeiten changes.

  ## Examples

      iex> change_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)
      %Ecto.Changeset{data: %ErgebnisseAbschlussarbeiten{}}

  """
  def change_ergebnisse_abschlussarbeiten(%ErgebnisseAbschlussarbeiten{} = ergebnisse_abschlussarbeiten, attrs \\ %{}) do
    ErgebnisseAbschlussarbeiten.changeset(ergebnisse_abschlussarbeiten, attrs)
  end
end
