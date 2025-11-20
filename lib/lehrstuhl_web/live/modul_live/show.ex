defmodule LehrstuhlWeb.ModulLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _uri, socket) do
    modul = Klausuren.get_modul!(id)

    klausuren = modul.klausuren || []

    # Statistiken pro Klausur berechnen
    klausur_stats =
      Enum.map(klausuren, fn klausur ->
        ergebnisse = klausur.klausurergebnisse || []
        teilnehmer = length(ergebnisse)

        avg_note =
          case ergebnisse do
            [] ->
              nil

            _ ->
              Enum.reduce(ergebnisse, 0.0, fn e, acc -> acc + e.note end) / teilnehmer
          end

        %{
          klausur: klausur,
          teilnehmer: teilnehmer,
          avg_note: avg_note
        }
      end)

    # Gesamtkennzahlen
    total_klausuren = length(klausur_stats)
    total_teilnehmer = Enum.reduce(klausur_stats, 0, fn s, acc -> acc + s.teilnehmer end)

    overall_avg_note =
      if total_teilnehmer == 0 do
        nil
      else
        # gewichteter Schnitt über alle Klausuren
        sum_weighted =
          Enum.reduce(klausur_stats, 0.0, fn s, acc ->
            case s.avg_note do
              nil -> acc
              avg -> acc + avg * s.teilnehmer
            end
          end)

        sum_weighted / max(total_teilnehmer, 1)
      end

    # Daten für Charts
    chart_labels = Enum.map(klausur_stats, & &1.klausur.kenner)
    chart_avg_values = Enum.map(klausur_stats, &(&1.avg_note || 0))
    chart_count_values = Enum.map(klausur_stats, & &1.teilnehmer)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:modul, modul)
     |> assign(:klausur_stats, klausur_stats)
     |> assign(:total_klausuren, total_klausuren)
     |> assign(:total_teilnehmer, total_teilnehmer)
     |> assign(:overall_avg_note, overall_avg_note)
     |> assign(:chart_labels, chart_labels)
     |> assign(:chart_avg_values, chart_avg_values)
     |> assign(:chart_count_values, chart_count_values)}
  end

  defp page_title(:show), do: "Modul-Details"
  defp page_title(:edit), do: "Modul bearbeiten"
end
