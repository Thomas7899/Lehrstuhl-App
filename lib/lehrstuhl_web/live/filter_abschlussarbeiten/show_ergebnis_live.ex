defmodule LehrstuhlWeb.ShowErgebnisLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten


    def mount(_params, _session, socket) do
      socket =
        assign(socket,
          abschlussarbeiten: Abschlussarbeiten.list_konkret_ergebnis()
        )
      {:ok, socket, temporary_assigns: [abschlussarbeiten: []]}
      #{:ok, socket}
    end
    def render(assigns) do
      ~H"""
      <div class="flex flex-wrap md:flex-wrap-reverse">
        <div :for={konkrete <- @abschlussarbeiten} class="w-full md:w-1/2 lg:w-1/3 p-4">
          <div class="w-full max-w-md p-4 bg-gray-800 hover:bg-neutral-900 border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
            <div class="mb-4">
              <h1 class="text-xl font-bold leading-none text-white">Abschlussarbeit</h1>
              <.link class="text-sm font-medium text-[#8000ff] hover:underline" navigate={~p"/konkrete_abschlussarbeiten/#{konkrete.id}"}>View</.link>
              <p class="text-sm text-neutral-400">Betreuer: <%= konkrete.betreuer %></p>
              <p class="text-sm text-neutral-400">Betreuer: <%= konkrete.forschungsprojekt %></p>
              <p class="text-sm text-neutral-400">Semester: <%= konkrete.semester %></p>
              <p class="text-sm text-neutral-400">Matrikelnummer: <%= konkrete.matrikelnummer %></p>
              <p class="text-sm text-neutral-400">Student Name: <%= "#{konkrete.student.vorname} #{konkrete.student.nachname}" %></p>
              <p class="text-sm text-neutral-400">Student Matrikelnummer: <%= konkrete.student.matrikelnummer %></p>
            </div>
            <div class="flow-root">
              <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
                <li class="py-3 sm:py-4">
                  <div class="flex items-center justify-between">
                    <h2 class="text-lg font-semibold text-white">Erzieltes Ergebnis</h2>
                    <.link class="text-sm font-medium text-[#8000ff] hover:underline" navigate={~p"/ergebnisse_abschlussarbeiten/#{konkrete.ergebnisse_abschlussarbeiten.id}"}>View</.link>
                  </div>
                  <div class="mt-2">
                    <p class="text-sm text-neutral-400">Note: <%= konkrete.ergebnisse_abschlussarbeiten.note %></p>
                    <p class="text-sm text-neutral-400">Matrikelnummer: <%= konkrete.ergebnisse_abschlussarbeiten.matrikelnummer %></p>
                    <p class="text-sm text-neutral-400">Studienniveau: <%= konkrete.ergebnisse_abschlussarbeiten.studienniveau %></p>
                    <p class="text-sm text-neutral-400">Status: <%= konkrete.ergebnisse_abschlussarbeiten.status %></p>
                    <p class="text-sm text-neutral-400">Korrekturdatum: <%= konkrete.ergebnisse_abschlussarbeiten.korrekturdatum %></p>
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
