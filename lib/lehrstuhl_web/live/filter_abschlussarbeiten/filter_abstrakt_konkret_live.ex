defmodule LehrstuhlWeb.FilterAbstraktKonkretLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          abschlussarbeiten: Abschlussarbeiten.list_abstrakte_abschlussarbeiten_konkret()
        )
      {:ok, socket, temporary_assigns: [abschlussarbeiten: []]}
      #{:ok, socket}
    end

    def render(assigns) do
      ~H"""
      <div class="flex flex-wrap">
        <div :for={abstrakte <- @abschlussarbeiten} class="w-full md:w-1/2 lg:w-1/3 p-4">
          <div class="w-full max-w-md p-4 bg-gray-800 hover:bg-neutral-900 border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
            <div class="mb-4">
              <h1 class="text-xl font-bold leading-none text-white">Abstrakte Abschlussarbeit</h1>
              <p class="text-sm text-neutral-400">Thema: <%= abstrakte.thema %></p>
              <p class="text-sm text-neutral-400">Betreuer: <%= abstrakte.betreuer %></p>
              <p class="text-sm text-neutral-400">Semester: <%= abstrakte.semester %></p>
            </div>
            <div class="flow-root">
            <h2 class="font-semibold text-yellow-300">Konkrete Abschlussarbeiten:</h2>
              <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
                <li :for={konkret <- abstrakte.konkrete_abschlussarbeiten} class="py-3 sm:py-4">
                  <div class="flex items-center justify-between">
                    <h5 class="text-lg font-semibold text-white">Matrikelnummer: <%= konkret.matrikelnummer %></h5>
                    <.link class="text-sm font-medium text-[#8000ff] hover:underline" navigate={~p"/konkrete_abschlussarbeiten/#{konkret}"}>View</.link>
                  </div>
                  <div class="mt-2">
                    <p class="text-sm text-neutral-400">Themenskizze: <%= konkret.angepasste_themenskizze %></p>
                    <p class="text-sm text-neutral-400">Schwerpunkte: <%= konkret.gesetzte_schwerpunkte %></p>
                    <p class="text-sm text-neutral-400">Anmeldung: <%= konkret.anmeldung_pruefungsamt %></p>
                    <p class="text-sm text-neutral-400">Abgabedatum: <%= konkret.abgabedatum %></p>
                    <p class="text-sm text-neutral-400">Betreuer: <%= konkret.betreuer %></p>
                    <p class="text-sm text-neutral-400">Semester: <%= konkret.semester %></p>
                    <p class="text-sm text-neutral-400">Forschungsprojekt: <%= konkret.forschungsprojekt %></p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      """
    end


  end
