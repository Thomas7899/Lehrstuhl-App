defmodule LehrstuhlWeb.SeminarergebnisLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Seminare

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    seminarergebnis = Seminare.get_seminarergebnis!(id)

    info_message =
      if seminarergebnis.versuche < 3 do
        "Student has another attempt remaining."
      else
        "No more attempts allowed."
      end

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:seminarergebnis, seminarergebnis)
     |> assign(:info_message, info_message)}
  end

  defp page_title(:show), do: "Show Seminarergebnis"
  defp page_title(:edit), do: "Edit Seminarergebnis"
end
