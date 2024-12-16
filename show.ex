defmodule LehrstuhlWeb.AbstraktLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten
  import LehrstuhlWeb.CustomComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _uri, socket) do
    abschlussarbeiten = AbstrakteAbschlussarbeiten.get_abstrakte_abschlussarbeiten!(id)

    socket =
      socket
      |> assign(:abschlussarbeiten, abschlussarbeiten)
      |> assign(:thema, abschlussarbeiten.thema)
      |> assign_async(:featured_abschlussarbeiten, fn ->
        {:ok, %{featured_abschlussarbeiten: Abschlussarbeiten.featured_abschlussarbeiten()}}
      end)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="raffle-show">
      <div class="activity">
        <div class="left"></div>
        <div class="right">
          <.featured_abschlussarbeiten abstrakte_abschlussarbeiten={@featured_abschlussarbeiten} />
        </div>
      </div>
    </div>
    """
  end

  def featured_abschlussarbeiten(assigns) do
    ~H"""
    <section>
      <h4>Featured Abschlussarbeiten</h4>
    <.async_result :let={result} assign={@abschlussarbeiten}>
        <ul class="abschlussarbeiten">
          <li :for={abschlussarbeiten <- result}>
            <.link navigate={~p"/abschlussarbeiten/#{abschlussarbeiten}"}>
              <img src={abschlussarbeiten} /> <%= abschlussarbeiten.thema %>
            </.link>
          </li>
        </ul>
      </.async_result>
    </section>
    """
  end
end
