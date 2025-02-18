defmodule LehrstuhlWeb.AbstrakteAbschlussarbeitenLive.FormComponent do
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
        id="abstrakte_abschlussarbeiten-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:betreuer]}
          type="select"
          label="Betreuer"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten, :betreuer)}
        />
        <.input
          field={@form[:forschungsprojekt]}
          type="select"
          label="Forschungsprojekt"
          prompt="Choose a value"
          options={Ecto.Enum.values(Lehrstuhl.Abschlussarbeiten.AbstrakteAbschlussarbeiten, :forschungsprojekt)}
        />
        <.input
          field={@form[:mitarbeiter_id]}
          type="select"
          label="Mitarbeiter"
          prompt="Choose a Mitarbeiter"
          options={for mitarbeiter <- @mitarbeiter, do: {mitarbeiter.vorname <> " " <> mitarbeiter.nachname, mitarbeiter.id}}
        />
        <.input field={@form[:semester]} type="text" label="Semester" />
        <.input field={@form[:thema]} type="text" label="Thema" />
        <.input field={@form[:themenskizze]} type="text" label="Themenskizze" />
        <:actions>
          <.button phx-disable-with="Saving...">Save abstrakte Abschlussarbeit</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten} = assigns, socket) do
    mitarbeiter = Lehrstuhl.Persons.list_mitarbeiter() # Mitarbeiter abrufen
    changeset = Abschlussarbeiten.change_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:mitarbeiter, mitarbeiter)  # Mitarbeiter hinzufügen
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"abstrakte_abschlussarbeiten" => abstrakte_abschlussarbeiten_params}, socket) do
    changeset =
      socket.assigns.abstrakte_abschlussarbeiten
      |> Abschlussarbeiten.change_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"abstrakte_abschlussarbeiten" => abstrakte_abschlussarbeiten_params}, socket) do
    save_abstrakte_abschlussarbeiten(socket, socket.assigns.action, abstrakte_abschlussarbeiten_params)
  end

  defp save_abstrakte_abschlussarbeiten(socket, :edit, abstrakte_abschlussarbeiten_params) do
    case Abschlussarbeiten.update_abstrakte_abschlussarbeiten(socket.assigns.abstrakte_abschlussarbeiten, abstrakte_abschlussarbeiten_params) do
      {:ok, abstrakte_abschlussarbeiten} ->
        notify_parent({:saved, abstrakte_abschlussarbeiten})

        {:noreply,
         socket
         |> put_flash(:info, "Abstrakte Abschlussarbeiten updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_abstrakte_abschlussarbeiten(socket, :new, abstrakte_abschlussarbeiten_params) do
    case Abschlussarbeiten.create_abstrakte_abschlussarbeiten(abstrakte_abschlussarbeiten_params) do
      {:ok, abstrakte_abschlussarbeiten} ->
        notify_parent({:saved, abstrakte_abschlussarbeiten})

        {:noreply,
         socket
         |> put_flash(:info, "Abstrakte Abschlussarbeiten created successfully")
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
