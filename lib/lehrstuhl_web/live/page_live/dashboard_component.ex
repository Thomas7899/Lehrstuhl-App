defmodule LehrstuhlWeb.DashboardComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Persons
  alias Lehrstuhl.Klausuren
  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def update(assigns, socket) do
    socket = assign(socket, assigns)

    stats = %{
      students: Persons.count_students(),
      klausuren_total: Klausuren.count_klausuren(),
      klausuren_upcoming: Klausuren.count_upcoming_klausuren(),
      theses_active: length(Abschlussarbeiten.list_konkrete_abschlussarbeiten())
    }

    statistik = Abschlussarbeiten.statistik_abstrakte_abschlussarbeiten()

    labels =
      statistik
      |> Enum.map(& &1.label)

    values =
      statistik
      |> Enum.map(&(&1.durchschnittsnote || 0))

    counts =
      statistik
      |> Enum.map(& &1.anzahl)

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

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8 space-y-10">
      <div class="border-b border-gray-700 pb-5">
        <p class="text-gray-400 mt-2">
          Live-Übersicht
        </p>
      </div>

      <div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
        <div class="bg-gray-800 overflow-hidden shadow rounded-2xl border border-gray-700 hover:border-purple-500 transition-colors group">
          <div class="p-5">
            <div class="flex items-center">
              <div class="flex-shrink-0 bg-purple-900/50 rounded-md p-3">
                <div class="text-2xl">🎓</div>
              </div>
              <div class="ml-5 w-0 flex-1">
                <dl>
                  <dt class="text-sm font-medium text-gray-400 truncate">Studenten</dt>
                  <dd>
                    <div class="text-3xl font-medium text-white"><%= @stats.students %></div>
                  </dd>
                </dl>
              </div>
            </div>
          </div>
          <div class="bg-gray-700/30 px-5 py-3">
            <.link navigate={~p"/students"} class="text-sm font-medium text-purple-400 hover:text-purple-300">
              Zur Liste &rarr;
            </.link>
          </div>
        </div>

        <div class="bg-gray-800 overflow-hidden shadow rounded-2xl border border-gray-700 hover:border-blue-500 transition-colors group">
          <div class="p-5">
            <div class="flex items-center">
              <div class="flex-shrink-0 bg-blue-900/50 rounded-md p-3">
                <div class="text-2xl">📝</div>
              </div>
              <div class="ml-5 w-0 flex-1">
                <dl>
                  <dt class="text-sm font-medium text-gray-400 truncate">Klausuren (Anstehend)</dt>
                  <dd>
                    <div class="text-3xl font-medium text-white">
                      <%= @stats.klausuren_upcoming %>
                      <span class="text-sm text-gray-500 font-normal">/ <%= @stats.klausuren_total %></span>
                    </div>
                  </dd>
                </dl>
              </div>
            </div>
          </div>
          <div class="bg-gray-700/30 px-5 py-3">
            <.link navigate={~p"/klausuren"} class="text-sm font-medium text-blue-400 hover:text-blue-300">
              Verwalten &rarr;
            </.link>
          </div>
        </div>

        <div class="bg-gray-800 overflow-hidden shadow rounded-2xl border border-gray-700 hover:border-green-500 transition-colors group">
          <div class="p-5">
            <div class="flex items-center">
              <div class="flex-shrink-0 bg-green-900/50 rounded-md p-3">
                <div class="text-2xl">📚</div>
              </div>
              <div class="ml-5 w-0 flex-1">
                <dl>
                  <dt class="text-sm font-medium text-gray-400 truncate">Laufende Arbeiten</dt>
                  <dd>
                    <div class="text-3xl font-medium text-white"><%= @stats.theses_active %></div>
                  </dd>
                </dl>
              </div>
            </div>
          </div>
          <div class="bg-gray-700/30 px-5 py-3">
            <.link navigate={~p"/konkrete_abschlussarbeiten"} class="text-sm font-medium text-green-400 hover:text-green-300">
              Zur Liste &rarr;
            </.link>
          </div>
        </div>
      </div>

      <div class="bg-gray-800 overflow-hidden shadow rounded-2xl border border-gray-700">
        <div class="p-5">
          <h2 class="text-lg font-semibold text-white mb-1">
            Letzte Klausuren
          </h2>
          <p class="text-xs text-gray-400 mb-4">
            Zuletzt geschriebene Klausuren mit Durchschnittsnote und Teilnehmerzahl.
          </p>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-700 text-sm">
              <thead class="bg-gray-900">
                <tr>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Klausur</th>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Datum</th>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Teilnehmer</th>
                  <th class="px-4 py-2 text-left font-medium text-gray-300">Ø-Note</th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-800">
                <tr :for={k <- @letzte_klausuren} class="hover:bg-gray-900/60">
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
