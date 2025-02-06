defmodule LehrstuhlWeb.FeaturedAbschlussarbeitenLive do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  def mount(_params, _session, socket) do
    socket =
      assign(socket, abschlussarbeiten: Abschlussarbeiten.featured_abschlussarbeiten())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
<div :for={abstrakte_abschlussarbeiten <- @abschlussarbeiten}>
  <h3><%= abstrakte_abschlussarbeiten.thema %></h3>
  <p>Betreuer: <%= abstrakte_abschlussarbeiten.betreuer %></p>
  <p>Semester: <%= abstrakte_abschlussarbeiten.semester %></p>
  </div>
  <h4>Konkrete Abschlussarbeiten:</h4>
  <ul>
    <div :for={konkrete_abschlussarbeiten <- @abstrakte_abschlussarbeiten.konkrete_abschlussarbeiten}>
      <li>
        Matrikelnummer: <%= konkrete_abschlussarbeiten.matrikelnummer %><br />
        Angepasste Themenskizze: <%= konkrete_abschlussarbeiten.angepasste_themenskizze %><br />
        Abgabedatum: <%= konkrete_abschlussarbeiten.abgabedatum %>
      </li>
    </div>
  </ul>


    """
  end
end


# <div :for={abstrakte_abschlussarbeiten <- @abstrakte_abschlussarbeiten} >
#<div class="flex justify-between items-center">
#<div><%= abstrakte_abschlussarbeiten.forschungsprojekt %></div>
#<div><%= abstrakte_abschlussarbeiten.konkrete_abschlussarbeiten.forschungsprojekt %></div>
#</div>
#</div>
