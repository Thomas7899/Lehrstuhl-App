defmodule LehrstuhlWeb.FilterSeminarLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare

  def mount(_params, _session, socket) do
    #form = to_form(%{"q" => ""})
    socket =
      socket
      |> assign(seminare: Seminare.list_seminare())
      |> assign(:form, to_form(%{}))
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex justify-center items-center">
     <.form for={@form} phx-change="filter" >
      <.input field={@form[:q]} placeholder="Search..." autocomplete="off" phx-debounce="500" />
    </.form>
    </div>
    <div class="flex flex-wrap md:flex-wrap-reverse">
     <div :for={seminar <- @seminare} class="bg-slate-50 p-4 w-full md:w-1/2 lg:w-1/3" >
     <div class="w-full max-w-md p-4 bg-gray-800 hover:bg-neutral-900 border border-gray-200 rounded-lg shadow sm:p-8 dark:bg-gray-800 dark:border-gray-700">

    <div class="flex items-center justify-between mb-4">
        <h5 class="text-xl font-bold leading-none text-white"><%= seminar.titel %></h5>
        <.link class="text-sm font-medium text-[#8000ff] hover:underline" navigate={~p"/seminare/#{seminar}"}>View all</.link>
    </div>
   <div class="flow-root">
        <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
            <li class="py-3 sm:py-4">
                <div class="flex items-center">
                    <div class="flex-1 min-w-0 ms-4">
                        <p class="text-sm font-medium text-neutral-400 truncate">
                            Ort
                        </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-neutral-400">
                          <%= seminar.ort %>
                    </div>
                </div>
            </li>
            <li class="py-3 sm:py-4">
                <div class="flex items-center ">
                    <div class="flex-1 min-w-0 ms-4">
                        <p class="text-sm font-medium text-neutral-400 truncate">
                        Aufnahmekapazität
                        </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-neutral-400">
                          <%= seminar.aufnahmekapazitaet %>
                    </div>
                </div>
            </li>
            <li class="py-3 sm:py-4">
                <div class="flex items-center">
                    <div class="flex-1 min-w-0 ms-4">
                        <p class="text-sm font-medium text-neutral-400 truncate">
                            Semester
                        </p>
                    </div>
                    <div class="inline-flex items-center text-base font-semibold text-neutral-400">
                          <%= seminar.semester %>
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

  def handle_event("filter", params, socket) do
    socket =
      socket
      |> assign(:form, to_form(params))
      |> assign(seminare: Seminare.filter_seminare(params))
    {:noreply, socket}
  end
end
