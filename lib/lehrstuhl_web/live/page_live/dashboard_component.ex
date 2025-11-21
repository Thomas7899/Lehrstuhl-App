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
      # Zählt nun die tatsächlichen konkreten Abschlussarbeiten
      theses_active: length(Abschlussarbeiten.list_konkrete_abschlussarbeiten())
    }

    {:ok, assign(socket, stats: stats)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8 space-y-10">
      <div class="border-b border-gray-700 pb-5">
        <p class="text-gray-400 mt-2">
          Live-Übersicht über alle administrativen Prozesse.
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
    </div>
    """
  end

end
