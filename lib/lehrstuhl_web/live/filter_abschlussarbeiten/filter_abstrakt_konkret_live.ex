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
      <h1 class="text-2xl font-mono">Filter abstrakte und zugehörige konkrete Abschlussarbeiten</h1>
            <div>

          <div :for={abstrakte_abschlussarbeiten <- @abschlussarbeiten} >
          <div class="betreuer">
             Betreuer: <%= abstrakte_abschlussarbeiten.betreuer %>
            </div>
            <div class="forschungsprojekt">
              Forschungsprojekt: <%= abstrakte_abschlussarbeiten.forschungsprojekt %>
              </div>
            <div class="semester">
             Semester:  <%= abstrakte_abschlussarbeiten.semester %>
            </div>
            <div class="matrikelnummer">
             Matrikelnummer: <%= abstrakte_abschlussarbeiten.matrikelnummer %>
            </div>
          <div :for={konkrete_abschlussarbeiten <- @abschlussarbeiten} >
          <div class="betreuer">
             Betreuer: <%= konkrete_abschlussarbeiten.betreuer %>
            </div>
            <div class="forschungsprojekt">
              Forschungsprojekt: <%= konkrete_abschlussarbeiten.forschungsprojekt %>
              </div>
            <div class="semester">
             Semester:  <%= konkrete_abschlussarbeiten.semester %>
            </div>
            <div class="matrikelnummer">
             Matrikelnummer: <%= konkrete_abschlussarbeiten.matrikelnummer %>
            </div>
          </div>
          </div>
      </div>
      """
    end
  end
