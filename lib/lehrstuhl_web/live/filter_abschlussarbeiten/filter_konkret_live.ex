defmodule LehrstuhlWeb.FilterKonkretLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          filter: %{betreuer: "", semester: "", forschungsprojekt: ""},
          abschlussarbeiten: Abschlussarbeiten.list_konkrete_abschlussarbeiten()
        )

      {:ok, socket, temporary_assigns: [abschlussarbeiten: []]}
    end

    def render(assigns) do
      ~H"""
      <h1 class="text-2xl font-mono">Filter konkrete Abschlussarbeiten</h1>
      <div id="konkrete_abschlussarbeiten">
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
            <select name="forschungsprojekt">
              <%= Phoenix.HTML.Form.options_for_select(
                forschungsprojekt_options(),
                @filter.forschungsprojekt
              ) %>
            </select>
          </div>
        </form>
      </div>
        <div class="flex flex-wrap md:flex-wrap-reverse">
          <div :for={konkrete_abschlussarbeiten <- @abschlussarbeiten} class="bg-slate-50 p-4 w-full md:w-1/2 lg:w-1/3">
            <div class="p-6 bg-slate-50">
              <div class="max-w-4xl mx-auto bg-blue-900 shadow-lg rounded-lg overflow-hidden p-4">
                <div class="flex flex-wrap -mx-2">
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Betreuer:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.betreuer %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Forschungsprojekt:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.forschungsprojekt %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Semester:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.semester %></span>
                    </div>
                  </div>
                  <details>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Matrikelnummer:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.matrikelnummer %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Angepasste Themenskizze:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.angepasste_themenskizze %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Gesetzte Schwerpunkte:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.gesetzte_schwerpunkte %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Anmeldung Prüfung:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.anmeldung_pruefungsamt %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Abgabedatum:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.abgabedatum %></span>
                    </div>
                  </div>
                  <div class="w-full md:w-1/2 lg:w-1/3 px-2 mb-4">
                    <div class="bg-blue-100 p-2 rounded">
                      <span class="font-semibold text-blue-700">Studienniveau:</span>
                      <span class="text-gray-700"><%= konkrete_abschlussarbeiten.studienniveau %></span>
                    </div>
                  </div>
                  </details>
                </div>
              </div>
            </div>
          </div>
      </div>

      """
    end

    def handle_event("filter", %{"betreuer" => betreuer, "semester" => semester, "forschungsprojekt" => forschungsprojekt}, socket) do

      filter = %{betreuer: betreuer, semester: semester, forschungsprojekt: forschungsprojekt}

      konkreteabschlussarbeiten = Abschlussarbeiten.list_konkrete_abschlussarbeiten(filter)

      {:noreply, assign(socket, filter: filter, abschlussarbeiten: konkreteabschlussarbeiten)}
    end

    defp betreuer_options do
      [
        "Alle Betreuer": "",
        Winkler: :müller,
        Christ: :hansen,
        Boehmer: :becker
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

    defp forschungsprojekt_options do
      [
        "Alle Forschungsprojekte": "",
        TOOL: :tool,
        SPORT: :sport,
        IMP: :imp
      ]
    end
  end
