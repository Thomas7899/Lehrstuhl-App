defmodule LehrstuhlWeb.ShowErgebnisLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  def mount(_params, _session, socket) do
    socket =
      assign(socket,
        abschlussarbeiten: Abschlussarbeiten.list_konkret_ergebnis()
      )

    {:ok, socket, temporary_assigns: [abschlussarbeiten: []]}
    # {:ok, socket}
  end

  def render(assigns) do
    ~H"""
     <div class="flex justify-center items-center">
    <h1 class="text-3xl font-mono text-white hover:text-[#8000ff] bg-gray-800 hover:bg-neutral-900 rounded-lg inline-block p-3">Übersicht Ergebnisse & Abschlussarbeiten</h1>
    </div>
    <div class="flex flex-wrap">
      <div :for={konkrete <- @abschlussarbeiten} class="w-full md:w-1/2 lg:w-1/3 p-4">
        <div class="w-full max-w-md p-4 bg-gray-800 hover:bg-neutral-900 border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">
          <div class="mb-4">
            <div class="flex flex-col text-center">
              <h1 class="text-xl font-bold leading-none text-white">Abschlussarbeit von <span class="text-yellow-300"><%= konkrete.student.vorname %></span> </h1>
            </div>
            <div class="flex items-center justify-between">
              <h2 class="text-lg font-semibold text-white">Konkrete Abschlussarbeit</h2>
              <.link class="text-sm font-medium text-[#8000ff] hover:underline mt" navigate={~p"/konkrete_abschlussarbeiten/#{konkrete.id}"}>View</.link>
            </div>
            <div class="mt-2">
            <p class="text-sm text-neutral-400">Betreuer: <%= konkrete.betreuer %></p>
            <p class="text-sm text-neutral-400">Forschungsprojekt: <%= konkrete.forschungsprojekt %></p>
            <p class="text-sm text-neutral-400">Semester: <%= konkrete.semester %></p>
            <p class="text-sm text-neutral-400">Matrikelnummer: <%= konkrete.matrikelnummer %></p>
            </div>
            <div class="flow-root">
              <ul role="list">
                <li class="py-3 sm:py-4">
                  <div class="flex items-center justify-between">
                    <h2 class="text-lg font-semibold text-white">Student</h2>
                    <.link class="text-sm font-medium text-[#8000ff] hover:underline" navigate={~p"/students/#{konkrete.student.id}"}>View</.link>
                  </div>
                  <div class="mt-2">
                    <p class="text-sm text-neutral-400">Name: <%= "#{konkrete.student.vorname} #{konkrete.student.nachname}" %></p>
                    <p class="text-sm text-neutral-400">Matrikelnummer: <%= konkrete.student.matrikelnummer %></p>
                    <p class="text-sm text-neutral-400">E-Mail: <%= konkrete.student.email %></p>
                  </div>
                </li>
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
    </div>
    """
  end
end
