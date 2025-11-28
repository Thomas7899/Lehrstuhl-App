defmodule LehrstuhlWeb.DashboardComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Abschlussarbeiten
  alias Lehrstuhl.Alumni

  @impl true
  def update(assigns, socket) do
    socket = assign(socket, assigns)

    current_semester = current_semester()

    stats = %{
      students: Persons.count_students(),
      klausuren_total: Klausuren.count_klausuren(),
      klausuren_upcoming: Klausuren.count_upcoming_klausuren(),
      theses_active: length(Abschlussarbeiten.list_konkrete_abschlussarbeiten()),
      alumni_total: Alumni.count_alumni(),
      alumni_semester: Alumni.semester_statistics(current_semester),
      current_semester: current_semester
    }

    statistik = Abschlussarbeiten.statistik_abstrakte_abschlussarbeiten()

    labels = Enum.map(statistik, & &1.label)
    values = Enum.map(statistik, &(&1.durchschnittsnote || 0))
    counts = Enum.map(statistik, & &1.anzahl)

    letzte_klausuren = Klausuren.letzte_klausuren(5)

    socket =
      socket
      |> assign(:stats, stats)
      |> assign(:stat_labels, labels)
      |> assign(:stat_values, values)
      |> assign(:stat_counts, counts)
      |> assign(:letzte_klausuren, letzte_klausuren)

    {:ok, socket}
  end

  defp current_semester do
    {{year, month, _}, _} = :calendar.local_time()

    if month in 4..9 do
      "SS#{rem(year, 100)}"
    else
      "WS#{year}/#{rem(year + 1, 100)}"
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-6xl mx-auto py-8 px-4 sm:px-6 lg:px-0 space-y-8">
      <div class="border-b border-gray-700 pb-4">
        <h1 class="text-xl font-semibold text-gray-100">
          Live-Übersicht
        </h1>
      </div>

      <!-- Kennzahlen-Grid -->
      <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-4">
        <!-- Studenten -->
        <div class="bg-[#0f172a] rounded-2xl border border-purple-700/60 shadow-lg shadow-purple-900/30 p-4 flex flex-col justify-between">
          <div class="flex items-center gap-3">
            <div class="flex-shrink-0 bg-purple-900/70 rounded-xl p-3">
              <div class="text-2xl">🎓</div>
            </div>
            <div>
              <p class="text-xs text-gray-400">Studenten</p>
              <p class="text-3xl font-semibold text-white leading-tight">
                <%= @stats.students %>
              </p>
            </div>
          </div>
          <div class="mt-4 pt-3 border-t border-purple-900/50">
            <.link navigate={~p"/students"} class="text-sm font-medium text-purple-300 hover:text-purple-200">
              Zur Liste &rarr;
            </.link>
          </div>
        </div>

        <!-- Klausuren -->
        <div class="bg-[#0f172a] rounded-2xl border border-blue-700/60 shadow-lg shadow-blue-900/30 p-4 flex flex-col justify-between">
          <div class="flex items-center gap-3">
            <div class="flex-shrink-0 bg-blue-900/70 rounded-xl p-3">
              <div class="text-2xl">📝</div>
            </div>
            <div>
              <p class="text-xs text-gray-400">Klausuren (anstehend / gesamt)</p>
              <p class="text-3xl font-semibold text-white leading-tight">
                <%= @stats.klausuren_upcoming %>
                <span class="text-sm text-gray-400 font-normal">
                  / <%= @stats.klausuren_total %>
                </span>
              </p>
            </div>
          </div>
          <div class="mt-4 pt-3 border-t border-blue-900/50">
            <.link navigate={~p"/klausuren"} class="text-sm font-medium text-blue-300 hover:text-blue-200">
              Verwalten &rarr;
            </.link>
          </div>
        </div>

        <!-- Laufende Arbeiten -->
        <div class="bg-[#0f172a] rounded-2xl border border-emerald-700/60 shadow-lg shadow-emerald-900/30 p-4 flex flex-col justify-between">
          <div class="flex items-center gap-3">
            <div class="flex-shrink-0 bg-emerald-900/70 rounded-xl p-3">
              <div class="text-2xl">📚</div>
            </div>
            <div>
              <p class="text-xs text-gray-400">Laufende Abschlussarbeiten</p>
              <p class="text-3xl font-semibold text-white leading-tight">
                <%= @stats.theses_active %>
              </p>
            </div>
          </div>
          <div class="mt-4 pt-3 border-t border-emerald-900/50">
            <.link navigate={~p"/konkrete_abschlussarbeiten"} class="text-sm font-medium text-emerald-300 hover:text-emerald-200">
              Zur Liste &rarr;
            </.link>
          </div>
        </div>

        <!-- Alumni -->
        <div class="bg-[#0f172a] rounded-2xl border border-amber-700/60 shadow-lg shadow-amber-900/30 p-4 flex flex-col justify-between">
          <div class="flex items-center gap-3">
            <div class="flex-shrink-0 bg-amber-900/70 rounded-xl p-3">
              <div class="text-2xl">🎓</div>
            </div>
            <div>
              <p class="text-xs text-gray-400">
                Alumni (gesamt / Abschlüsse <%= @stats.current_semester %>)
              </p>
              <p class="text-3xl font-semibold text-white leading-tight">
                <%= @stats.alumni_total %>
                <span class="text-sm text-gray-400 font-normal">
                  / <%= @stats.alumni_semester.abschlussarbeiten %>
                </span>
              </p>
            </div>
          </div>
          <div class="mt-4 pt-3 border-t border-amber-900/50">
            <.link navigate={~p"/alumni"} class="text-sm font-medium text-amber-300 hover:text-amber-200">
              Alumni &rarr;
            </.link>
          </div>
        </div>
      </div>

      <!-- Letzte Klausuren -->
      <div class="bg-[#020617] rounded-2xl border border-gray-800 overflow-hidden">
        <div class="p-4 sm:p-5">
          <h2 class="text-lg font-semibold text-white mb-1">
            Letzte Klausuren
          </h2>
          <p class="text-xs text-gray-400 mb-4">
            Zuletzt geschriebene Klausuren mit Durchschnittsnote und Teilnehmerzahl.
          </p>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-800 text-sm">
              <thead class="bg-[#020617]">
                <tr>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Klausur</th>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Datum</th>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Teilnehmer</th>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Ø‑Note</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-800">
                <tr :for={k <- @letzte_klausuren} class="hover:bg-gray-900/70">
                  <td class="px-4 py-2 text-white">
                    <div class="font-medium"><%= k.kenner %></div>
                    <div class="text-xs text-gray-400 truncate max-w-xs">
                      <%= k.beschreibung %>
                    </div>
                  </td>
                  <td class="px-4 py-2 text-gray-200">
                    <%= k.datum %>
                  </td>
                  <td class="px-4 py-2 text-gray-200">
                    <%= k.teilnehmer %>
                  </td>
                  <td class="px-4 py-2 text-gray-200">
                    <%= if k.durchschnittsnote, do: Float.round(k.durchschnittsnote, 2), else: "-" %>
                  </td>
                </tr>
                <tr :if={Enum.empty?(@letzte_klausuren)}>
                  <td colspan="4" class="px-4 py-4 text-center text-gray-400 text-xs">
                    Noch keine Klausurergebnisse vorhanden.
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
