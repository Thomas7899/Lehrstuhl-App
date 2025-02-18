defmodule LehrstuhlWeb.ErgebnisseAbschlussarbeitenLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage ergebnisse records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="ergebnisse_abschlussarbeiten-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:matrikelnummer]} type="text" label="Matrikelnummer" />

        <.input
          field={@form[:studienniveau]}
          type="select"
          label="Studienniveau"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten, :studienniveau)}
        />
        <.input
          field={@form[:status]}
          type="select"
          label="Status"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.ErgebnisseAbschlussarbeiten, :status)}
        />
        <.input
          field={@form[:konkrete_abschlussarbeiten_id]}
          type="select"
          label="Konkrete Abschlussarbeit"
          prompt="Choose a Abschlussarbeit"
          options={for arbeit <- @konkrete_abschlussarbeiten, do: {arbeit.id, arbeit.id}}
        />

        <.input field={@form[:korrekturdatum]} type="date" label="Korrekturdatum" />
        <.input field={@form[:note]} type="number" label="Note" step="any" />
        <:actions>
          <.button phx-disable-with="Saving...">Ergebnis speichern</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten} = assigns, socket) do

    konkrete_abschlussarbeiten = Lehrstuhl.Abschlussarbeiten.list_konkrete_abschlussarbeiten()

    changeset = Abschlussarbeiten.change_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:konkrete_abschlussarbeiten, konkrete_abschlussarbeiten)
     |> assign_form(changeset)}
  end


  @impl true
  def handle_event("validate", %{"ergebnisse_abschlussarbeiten" => ergebnisse_abschlussarbeiten_params}, socket) do
    changeset =
      socket.assigns.ergebnisse_abschlussarbeiten
      |> Abschlussarbeiten.change_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"ergebnisse_abschlussarbeiten" => ergebnisse_abschlussarbeiten_params}, socket) do
    save_ergebnisse_abschlussarbeiten(socket, socket.assigns.action, ergebnisse_abschlussarbeiten_params)
  end

  defp save_ergebnisse_abschlussarbeiten(socket, :edit, ergebnisse_abschlussarbeiten_params) do
    case Abschlussarbeiten.update_ergebnisse_abschlussarbeiten(socket.assigns.ergebnisse_abschlussarbeiten, ergebnisse_abschlussarbeiten_params) do
      {:ok, ergebnisse_abschlussarbeiten} ->
        notify_parent({:saved, ergebnisse_abschlussarbeiten})

        {:noreply,
         socket
         |> put_flash(:info, "Ergebnisse abschlussarbeiten updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_ergebnisse_abschlussarbeiten(socket, :new, ergebnisse_abschlussarbeiten_params) do
    case Abschlussarbeiten.create_ergebnisse_abschlussarbeiten(ergebnisse_abschlussarbeiten_params) do
      {:ok, ergebnisse_abschlussarbeiten} ->
        notify_parent({:saved, ergebnisse_abschlussarbeiten})

        {:noreply,
         socket
         |> put_flash(:info, "Ergebnisse abschlussarbeiten created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
