defmodule LehrstuhlWeb.AlumniLive.Index do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Alumni

  @impl true
  def mount(_params, _session, socket) do
    semester = current_semester()
    stats = Alumni.semester_statistics(semester)
    alumni = Alumni.list_alumni()

    {:ok,
     socket
     |> assign(:semester, semester)
     |> assign(:stats, stats)
     |> assign(:alumni, alumni)}
  end

  defp current_semester do
    # einfache Heuristik, später evtl. zentralisieren
    {{year, month, _}, _} = :calendar.local_time()

    if month in 4..9 do
      "SS#{rem(year, 100)}"
    else
      "WS#{year}/#{rem(year + 1, 100)}"
    end
  end
end
