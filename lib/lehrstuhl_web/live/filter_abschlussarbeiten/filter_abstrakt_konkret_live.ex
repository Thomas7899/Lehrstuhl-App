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
      <div class="abstrakte_abschlussarbeiten">
            </div>
            <div>
          <div :for={konkrete_abschlussarbeiten <- @abschlussarbeiten.konkrete_abschlussarbeiten} class="abstrakte_abschlussarbeiten">
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
            <div class="angepasste_themenskizze">
             Angepasste Themenskizze: <%= konkrete_abschlussarbeiten.angepasste_themenskizze %>
            </div>
            <div class="gesetzte_schwerpunkte">
             Gesetzte Schwerpunkte: <%= konkrete_abschlussarbeiten.gesetzte_schwerpunkte %>
            </div>
            <div class="anmeldung_pruefungsamt">
             Anmeldung Prüfung: <%= konkrete_abschlussarbeiten.anmeldung_pruefungsamt %>
            </div>
            <div class="abgabedatum">
             Abgabedatum: <%= konkrete_abschlussarbeiten.abgabedatum %>
            </div>
            <div class="studienniveau">
            Studienniveau: <%= konkrete_abschlussarbeiten.studienniveau %>
            </div>
          </div>
      </div>
      """
    end
  end
