defmodule LehrstuhlWeb.FilterSeminar.Index do
  use LehrstuhlWeb, :live_view

  import LehrstuhlWeb.CustomComponents
  alias Lehrstuhl.Seminare.Seminar
  alias Lehrstuhl.Seminare

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(params, _uri, socket) do
    socket =
      socket
      |> stream(:seminare, Seminare.filter_seminare(params), reset: true)
      |> assign(:form, to_form(params))

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="seminar-index">
      <.filter_form form={@form} />

      <div class="seminare" id="seminare" phx-update="stream">
        <.seminare_card :for={{dom_id, seminar} <- @streams.seminare} seminar={seminar} id={dom_id} />
      </div>
    </div>
    """
  end

  def filter_form(assigns) do
    ~H"""
    <.form for={@form} id="filter-form" phx-change="filter">
      <.input field={@form[:q]} placeholder="Search..." autocomplete="off" phx-debounce="500" />

      <.link patch={~p"/seminare"}>
        Reset
      </.link>
    </.form>
    """
  end

  attr :seminar, Lehrstuhl.Seminare.Seminar, required: true
  attr :id, :string, required: true

  def seminare_card(assigns) do
    ~H"""
    <.link navigate={~p"/seminare/#{@seminar}"} id={@id} >
      <div class="card">
        <h2><%= @seminar.titel %></h2>
      </div>
    </.link>
    """
  end

  def handle_event("filter", params, socket) do
    params =
      params
      |> Map.reject(fn {_, v} -> v == "" end)

    socket = push_patch(socket, to: ~p"/seminare?#{params}")

    {:noreply, socket}
  end
end
