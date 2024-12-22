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
<div class="w-full max-w-md p-4 bg-white border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
    <div class="flex items-center justify-between mb-4">
        <h5 class="text-xl font-bold leading-none text-gray-900 dark:text-white"><%= konkrete_abschlussarbeiten.matrikelnummer %></h5>
        <.link class="text-sm font-medium text-blue-600 hover:underline dark:text-blue-500" navigate={~p"/konkrete_abschlussarbeiten/#{konkrete_abschlussarbeiten}"}>View all</.link>
    </div>
   <div class="flow-root">
        <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
            <li class="py-3 sm:py-4">
                <div class="flex items-center">
                    <div class="flex-1 min-w-0 ms-4">
                        <p class="text-sm font-medium text-gray-900 truncate dark:text-white">
                            Betreuer
                        </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">
                          <%= konkrete_abschlussarbeiten.betreuer %>
                    </div>
                </div>
            </li>
            <li class="py-3 sm:py-4">
                <div class="flex items-center ">
                    <div class="flex-1 min-w-0 ms-4">
                        <p class="text-sm font-medium text-gray-900 truncate dark:text-white">
                            Semester
                        </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">
                          <%= konkrete_abschlussarbeiten.semester %>
                    </div>
                </div>
            </li>
            <li class="py-3 sm:py-4">
                <div class="flex items-center">
                    <div class="flex-1 min-w-0 ms-4">
                        <p class="text-sm font-medium text-gray-900 truncate dark:text-white">
                            Forschungsprojekt
                        </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">
                          <%= konkrete_abschlussarbeiten.forschungsprojekt %>
                    </div>
                </div>
            </li>
        </ul>
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
        Müller: :müller,
        Hansen: :hansen,
        Becker: :becker
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
