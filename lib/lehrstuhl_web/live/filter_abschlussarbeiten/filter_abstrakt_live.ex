defmodule LehrstuhlWeb.FilterAbstraktLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
  # 1) Statistik nach Forschungsprojekt (aggregiert)
  proj_stats = Abschlussarbeiten.statistik_nach_forschungsprojekt()

  proj_labels =
    proj_stats
    |> Enum.map(&to_string(&1.projekt))

  proj_values =
    proj_stats
    |> Enum.map(&(&1.durchschnittsnote || 0))

  proj_counts =
    proj_stats
    |> Enum.map(& &1.anzahl)

  # 2) Statistik pro abstrakter Arbeit, aber nur nach Projekt-Kürzel gruppiert
  abs_stats = Abschlussarbeiten.statistik_abstrakte_abschlussarbeiten_projekt()

  abs_labels =
  abs_stats
  |> Enum.map(&(&1.projekt |> to_string() |> String.upcase()))   # nur "sport", "tool", "imp"

  abs_values =
    abs_stats
    |> Enum.map(&(&1.durchschnittsnote || 0))

  abs_counts =
    abs_stats
    |> Enum.map(& &1.anzahl)

  socket =
    socket
    |> assign(
      filter: %{betreuer: "", semester: "", thema: ""},
      abschlussarbeiten: Abschlussarbeiten.list_abstrakte_abschlussarbeiten(),
      proj_labels: proj_labels,
      proj_values: proj_values,
      proj_counts: proj_counts,
      abs_labels: abs_labels,
      abs_values: abs_values,
      abs_counts: abs_counts
    )

  {:ok, socket, temporary_assigns: [abschlussarbeiten: []]}
end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex justify-center items-center">
      <h1 class="text-3xl font-mono text-white hover:text-[#8000ff] bg-gray-800 hover:bg-neutral-900 rounded-lg inline-block p-3">
        Abstrakte Abschlussarbeiten
      </h1>
    </div>

    <!-- Chart 1: Forschungsprojekte (SPORT / TOOL / IMP) -->
    <div class="bg-gray-800 overflow-hidden shadow rounded-2xl border border-gray-700 mt-8">
      <div class="p-5">
        <h2 class="text-lg font-semibold text-white mb-1">
          Durchschnittsnoten pro Forschungsprojekt
        </h2>
        <p class="text-xs text-gray-400 mb-4">
          Balken: Durchschnittsnote • Linie: Anzahl Ergebnisse (aggregiert über alle abstrakten Arbeiten eines Projekts)
        </p>
        <div class="relative w-full h-64">
          <canvas
            id="abstrakt-projekt-chart"
            phx-hook="AbstraktStatsChart"
            data-labels={@proj_labels |> Jason.encode!()}
            data-values={@proj_values |> Jason.encode!()}
            data-counts={@proj_counts |> Jason.encode!()}
            class="w-full h-full">
          </canvas>
        </div>
      </div>
    </div>

    <!-- Chart 2: Einzelne abstrakte Arbeiten (Thema + Semester) -->
    <div class="bg-gray-800 overflow-hidden shadow rounded-2xl border border-gray-700 mt-8">
      <div class="p-5">
        <h2 class="text-lg font-semibold text-white mb-1">
          Durchschnittsnoten pro abstrakter Abschlussarbeit
        </h2>
        <p class="text-xs text-gray-400 mb-4">
          Balken: Durchschnittsnote • Linie: Anzahl Ergebnisse (pro Thema und Semester)
        </p>
        <div class="relative w-full h-72 overflow-x-auto">
          <canvas
            id="abstrakt-detail-chart"
            phx-hook="AbstraktStatsChart"
            data-labels={@abs_labels |> Jason.encode!()}
            data-values={@abs_values |> Jason.encode!()}
            data-counts={@abs_counts |> Jason.encode!()}
            class="w-full h-full min-w-[600px]">
          </canvas>
        </div>
      </div>
    </div>

    <!-- Filter + Karten -->
    <div id="abstrakte_abschlussarbeiten">
      <form phx-change="filter">
        <div class="mt-4 flex flex-wrap justify-center gap-3">
          <select class="rounded-lg bg-gray-800 hover:bg-neutral-900 text-white hover:text-[#8000ff]" name="betreuer">
            <%= Phoenix.HTML.Form.options_for_select(
                  betreuer_options(),
                  @filter.betreuer
                ) %>
          </select>
          <select class="rounded-lg bg-gray-800 hover:bg-neutral-900 text-white hover:text-[#8000ff]" name="semester">
            <%= Phoenix.HTML.Form.options_for_select(
                  semester_options(),
                  @filter.semester
                ) %>
          </select>
          <select class="rounded-lg bg-gray-800 hover:bg-neutral-900 text-white hover:text-[#8000ff]" name="thema">
            <%= Phoenix.HTML.Form.options_for_select(
                  thema_options(),
                  @filter.thema
                ) %>
          </select>
        </div>
      </form>

      <div class="flex flex-wrap">
        <div :for={abstrakte_abschlussarbeiten <- @abschlussarbeiten} class="bg-gray-500 p-4 w-full md:w-1/2 lg:w-1/3">
          <div class="w-full max-w-md p-4 bg-gray-800 hover:bg-neutral-900 border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
            <div class="flex items-center justify-between mb-4">
              <h5 class="text-xl font-bold leading-none text-white">
                <%= abstrakte_abschlussarbeiten.forschungsprojekt %>
              </h5>
              <.link
                class="text-sm font-medium text-[#8000ff] hover:underline"
                navigate={~p"/abstrakte_abschlussarbeiten/#{abstrakte_abschlussarbeiten}"}
              >
                View all
              </.link>
            </div>
            <div class="flow-root">
              <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
                <li class="py-3 sm:py-4">
                  <div class="flex items-center">
                    <div class="flex-1 min-w-0 ms-4">
                      <p class="text-sm font-medium text-neutral-400 truncate">
                        Betreuer
                      </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-neutral-400">
                      <%= abstrakte_abschlussarbeiten.betreuer %>
                    </div>
                  </div>
                </li>
                <li class="py-3 sm:py-4">
                  <div class="flex items-center ">
                    <div class="flex-1 min-w-0 ms-4">
                      <p class="text-sm font-medium text-neutral-400 truncate">
                        Semester
                      </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-neutral-400">
                      <%= abstrakte_abschlussarbeiten.semester %>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>

        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event(
        "filter",
        %{"betreuer" => betreuer, "semester" => semester, "thema" => thema},
        socket
      ) do
    filter = %{betreuer: betreuer, semester: semester, thema: thema}
    abschlussarbeiten = Abschlussarbeiten.list_abstrakte_abschlussarbeiten(filter)

    {:noreply, assign(socket, filter: filter, abschlussarbeiten: abschlussarbeiten)}
  end

  defp betreuer_options do
    [
      "Alle Betreuer": "",
      Müller: :müller,
      Becker: :becker,
      Hansen: :hansen
    ]
  end

  defp semester_options do
    [
      "Alle Semester": "",
      WS2324: "WS23/24",
      SS23: "SS23",
      WS2223: "WS22/23",
      SS22: "SS22"
    ]
  end

  defp thema_options do
    [
      "Alle Themen": "",
      TOOL: "TOOL - A web browser-based modeling tool and research observatory",
      SPORT: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
      IMP: "Individual Modeling Processes"
    ]
  end
end
