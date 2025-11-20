defmodule LehrstuhlWeb.KlausurergebnisLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Klausuren

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    klausurergebnis = Klausuren.get_klausurergebnis!(id)

    info_message =
      if klausurergebnis.punkte < 50 and klausurergebnis.versuche < 3 do
        "Student has another attempt remaining."
      else
        "No more attempts allowed."
      end

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:klausurergebnis, klausurergebnis)
     |> assign(:info_message, info_message)}
  end


  defp page_title(:show), do: "Show Klausurergebnis"
  defp page_title(:edit), do: "Edit Klausurergebnis"
end
