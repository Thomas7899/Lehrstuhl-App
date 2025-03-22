defmodule LehrstuhlWeb.KonkreteAbschlussarbeitenLive.Show do
  use LehrstuhlWeb, :live_view

  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    konkrete_abschlussarbeiten =
      Abschlussarbeiten.get_konkrete_abschlussarbeiten!(id)
      |> Lehrstuhl.Repo.preload([:student, :mitarbeiter, :abstrakte_abschlussarbeiten, :ergebnisse_abschlussarbeiten])

    ergebnisse =
      case konkrete_abschlussarbeiten.ergebnisse_abschlussarbeiten do
        %Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten{} = ergebnis -> [ergebnis] 
        nil -> []
        ergebnisse when is_list(ergebnisse) -> ergebnisse
      end

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:konkrete_abschlussarbeiten, konkrete_abschlussarbeiten)
     |> assign(:ergebnisse_abschlussarbeiten, ergebnisse)}
  end


  defp page_title(:show), do: "Show konkrete Abschlussarbeiten"
  defp page_title(:edit), do: "Edit konkrete Abschlussarbeiten"
end
