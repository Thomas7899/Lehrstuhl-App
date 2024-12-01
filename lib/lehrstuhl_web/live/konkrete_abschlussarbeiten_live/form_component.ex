defmodule LehrstuhlWeb.KonkreteAbschlussarbeitenLive.FormComponent do
  use LehrstuhlWeb, :live_component

  alias Lehrstuhl.Abschlussarbeiten

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Hinweis: Für die Eingabe Semester nutzen Sie bitte die Form z. B. WS20/21 bzw. SS20</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="konkrete_abschlussarbeiten-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:betreuer]}
          type="select"
          label="Betreuer"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten, :betreuer)}
        />
        <.input
          field={@form[:forschungsprojekt]}
          type="select"
          label="Forschungsprojekt"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten, :forschungsprojekt)}
        />
        <.input field={@form[:semester]} type="text" label="Semester" />
        <.input field={@form[:matrikelnummer]} type="text" label="Matrikelnummer" />
        <.input field={@form[:angepasste_themenskizze]} type="text" label="Angepasste Themenskizze" />
        <.input field={@form[:gesetzte_schwerpunkte]} type="text" label="Gesetzte Schwerpunkte" />
        <.input field={@form[:anmeldung_pruefungsamt]} type="date" label="Anmeldung Pruefungsamt" />
        <.input field={@form[:abgabedatum]} type="date" label="Abgabedatum" />
        <.input
          field={@form[:studienniveau]}
          type="select"
          label="Studienniveau"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.KonkreteAbschlussarbeiten, :studienniveau)}
        />
        <:actions>
          <.button phx-disable-with="Saving...">Save konkrete Abschlussarbeit</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{konkrete_abschlussarbeiten: konkrete_abschlussarbeiten} = assigns, socket) do
    changeset = Abschlussarbeiten.change_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"konkrete_abschlussarbeiten" => konkrete_abschlussarbeiten_params}, socket) do
    changeset =
      socket.assigns.konkrete_abschlussarbeiten
      |> Abschlussarbeiten.change_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"konkrete_abschlussarbeiten" => konkrete_abschlussarbeiten_params}, socket) do
    save_konkrete_abschlussarbeiten(socket, socket.assigns.action, konkrete_abschlussarbeiten_params)
  end

  defp save_konkrete_abschlussarbeiten(socket, :edit, konkrete_abschlussarbeiten_params) do
    case Abschlussarbeiten.update_konkrete_abschlussarbeiten(socket.assigns.konkrete_abschlussarbeiten, konkrete_abschlussarbeiten_params) do
      {:ok, konkrete_abschlussarbeiten} ->
        notify_parent({:saved, konkrete_abschlussarbeiten})

        {:noreply,
         socket
         |> put_flash(:info, "Konkrete Abschlussarbeiten updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_konkrete_abschlussarbeiten(socket, :new, konkrete_abschlussarbeiten_params) do
    case Abschlussarbeiten.create_konkrete_abschlussarbeiten(konkrete_abschlussarbeiten_params) do
      {:ok, konkrete_abschlussarbeiten} ->
        notify_parent({:saved, konkrete_abschlussarbeiten})

        {:noreply,
         socket
         |> put_flash(:info, "Konkrete Abschlussarbeiten created successfully")
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
