defmodule LehrstuhlWeb.KlausurLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren

  def average(anzahl, summe) do
    if anzahl == 0 do
      0
    else
      summe / anzahl
    end
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    kes = Klausuren.list_klausurergebnisse_for_klausur(id)

    list_punkte = Enum.map(kes, & &1.punkte)
    gesamt = Enum.sum(list_punkte)

    anz_studenten = length(kes)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:klausur, Klausuren.get_klausur!(id))
     |> assign(:klausurergebnisse, kes)
     |> assign(:avg, average(anz_studenten, gesamt))
     |> assign(:anz_studierende, anz_studenten)}
  end

  defp page_title(:show), do: "Show Klausur"
  defp page_title(:edit), do: "Edit Klausur"
end
