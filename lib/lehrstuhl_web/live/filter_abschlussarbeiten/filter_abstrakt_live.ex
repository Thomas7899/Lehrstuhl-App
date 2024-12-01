defmodule LehrstuhlWeb.FilterAbstraktLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          filter: %{betreuer: "", semester: "", thema: ""},
          abschlussarbeiten: Abschlussarbeiten.list_abstrakte_abschlussarbeiten()
        )

      {:ok, socket, temporary_assigns: [abschlussarbeiten: []]}
    end

    def render(assigns) do
      ~H"""
      <h1 class="text-2xl font-mono">Filter abstrakte Abschlussarbeiten</h1>
      <div id="abstrakte_abschlussarbeiten">
        <form phx-change="filter">
          <div class="filters">
            <select name="betreuer">
              <%= Phoenix.HTML.Form.options_for_select(
                betreuer_options(),
                @filter.betreuer
              ) %>
            </select>
            <select name="semester">
              <%= Phoenix.HTML.Form.options_for_select(
                semester_options(),
                @filter.semester
              ) %>
            </select>
            <select name="thema">
              <%= Phoenix.HTML.Form.options_for_select(
                thema_options(),
                @filter.thema
              ) %>
            </select>
          </div>
        </form>
        <div class="flex flex-wrap md:flex-wrap-reverse">
          <div :for={abstrakte_abschlussarbeiten <- @abschlussarbeiten} class="bg-slate-50 p-4 w-full md:w-1/2 lg:w-1/3">
          <div class="p-6 bg-slate-50">
              <div class="max-w-4xl mx-auto bg-blue-900 shadow-lg rounded-lg overflow-hidden p-4">
                <div class="flex flex-wrap -mx-2">
                  <div class="w-full md:w-1/2 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Betreuer:</span>
                      <span class="text-gray-700"><%= abstrakte_abschlussarbeiten.betreuer %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Forschungsprojekt:</span>
                      <span class="text-gray-700"><%= abstrakte_abschlussarbeiten.forschungsprojekt %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Semester:</span>
                      <span class="text-gray-700"><%= abstrakte_abschlussarbeiten.semester %></span>
                    </div>
                  </div>
                  <details>
                  <div class="w-full md:w-1/2 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Thema:</span>
                      <span class="text-gray-700"><%= abstrakte_abschlussarbeiten.thema %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Themenskizze:</span>
                      <span class="text-gray-700"><%= abstrakte_abschlussarbeiten.themenskizze %></span>
                    </div>
                  </div>
                  </details>
                </div>
                </div>
                </div>

          </div>
        </div>
      </div>
      """
    end

    def handle_event("filter", %{"betreuer" => betreuer, "semester" => semester, "thema" => thema}, socket) do

      filter = %{betreuer: betreuer, semester: semester, thema: thema}

      abstrakteabschlussarbeiten = Abschlussarbeiten.list_abstrakte_abschlussarbeiten(filter)

      {:noreply, assign(socket, filter: filter, abschlussarbeiten: abstrakteabschlussarbeiten)}
    end

    defp betreuer_options do
      [
        "Alle Betreuer": "",
        Winkler: :müller,
        Christ: :becker,
        Boehmer: :hansen
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
        TOOL: "TOOL - A web browser-based modeling tool and observatory",
        SPORT: "SPORT - Web App Development of Sportyweb, a web app for sports clubs",
        IMP: "Individual Modeling Processes"
      ]
    end
  end
