defmodule LehrstuhlWeb.KlausurLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren

  def average(anzahl, summe) do
    if anzahl == 0, do: 0, else: summe / anzahl
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     # Hier erlauben wir den Upload. 'auto_upload: true' würde sofort hochladen,
     # wir warten aber auf den Klick.
     |> allow_upload(:csv, accept: ~w(.csv), max_entries: 1)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    klausur = Klausuren.get_klausur!(id)
    kes = Klausuren.list_klausurergebnisse_for_klausur(id)

    list_punkte = Enum.map(kes, & &1.punkte)
    gesamt = Enum.sum(list_punkte)
    anz_studenten = length(kes)

    notenverteilung = Klausuren.notenverteilung(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:klausur, klausur)
     |> assign(:klausurergebnisse, kes)
     |> assign(:avg, average(anz_studenten, gesamt))
     |> assign(:anz_studierende, anz_studenten)
     |> assign(:notenverteilung, notenverteilung)}
  end

  # Dieser Event wird gefeuert, wenn man eine Datei auswählt (Validierung)
  @impl true
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  # Dieser Event wird gefeuert, wenn man auf "Importieren" klickt
  @impl true
  def handle_event("save_csv", _params, socket) do
    klausur = socket.assigns.klausur

    # consume_uploaded_entries verarbeitet die Datei temporär
    import_results =
      consume_uploaded_entries(socket, :csv, fn %{path: path}, _entry ->
        # Hier rufen wir die Context-Funktion auf
        {:ok, Klausuren.import_klausurergebnisse(klausur.id, path)}
      end)

    # Ergebnis auswerten (List of results)
    case import_results do
      [{created, errors}] ->
        msg = "#{created} Ergebnisse importiert. #{errors} übersprungen/fehlerhaft."

        {:noreply,
         socket
         |> put_flash(:info, msg)
         # Seite neu laden, damit die Tabelle aktualisiert wird
         |> push_navigate(to: ~p"/klausuren/#{klausur}")}

      _ ->
        {:noreply, put_flash(socket, :error, "Upload fehlgeschlagen.")}
    end
  end

  defp page_title(:show), do: "Show Klausur"
  defp page_title(:edit), do: "Edit Klausur"
end
