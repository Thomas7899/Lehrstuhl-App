defmodule LehrstuhlWeb.ErgebnisseAbschlussarbeitenLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.AbschlussarbeitenFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{status: :bestanden, matrikelnummer: "some matrikelnummer", studienniveau: :bachelorarbeit, korrekturdatum: "2023-12-24", note: "120.5"}
  @update_attrs %{status: :nichtbestanden, matrikelnummer: "some updated matrikelnummer", studienniveau: :masterarbeit, korrekturdatum: "2023-12-25", note: "456.7"}
  @invalid_attrs %{status: nil, matrikelnummer: nil, studienniveau: nil, korrekturdatum: nil, note: nil}

  defp create_ergebnisse_abschlussarbeiten(_) do
    ergebnisse_abschlussarbeiten = ergebnisse_abschlussarbeiten_fixture()
    %{ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten}
  end

  describe "Index" do
    setup [:create_ergebnisse_abschlussarbeiten]

    test "lists all ergebnisse_abschlussarbeiten", %{conn: conn, ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/ergebnisse_abschlussarbeiten")

      assert html =~ "Listing Ergebnisse abschlussarbeiten"
      assert html =~ ergebnisse_abschlussarbeiten.matrikelnummer
    end

    test "saves new ergebnisse_abschlussarbeiten", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
      |> log_in_user(user_fixture())
      |> live(~p"/ergebnisse_abschlussarbeiten")

      assert index_live |> element("a", "Neues Ergebnis eintragen") |> render_click() =~
               "Neues Ergebnis eintragen"

      assert_patch(index_live, ~p"/ergebnisse_abschlussarbeiten/new")

      assert index_live
             |> form("#ergebnisse_abschlussarbeiten-form", ergebnisse_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#ergebnisse_abschlussarbeiten-form", ergebnisse_abschlussarbeiten: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/ergebnisse_abschlussarbeiten")

      html = render(index_live)
      assert html =~ "Ergebnisse abschlussarbeiten created successfully"
      assert html =~ "some matrikelnummer"
    end

    test "updates ergebnisse_abschlussarbeiten in listing", %{conn: conn, ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/ergebnisse_abschlussarbeiten")


      assert index_live |> element("#ergebnisse_abschlussarbeiten_collection-#{ergebnisse_abschlussarbeiten.id} a", "Edit") |> render_click() =~
               "Edit Ergebnisse abschlussarbeiten"

      assert_patch(index_live, ~p"/ergebnisse_abschlussarbeiten/#{ergebnisse_abschlussarbeiten}/edit")

      assert index_live
             |> form("#ergebnisse_abschlussarbeiten-form", ergebnisse_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#ergebnisse_abschlussarbeiten-form", ergebnisse_abschlussarbeiten: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/ergebnisse_abschlussarbeiten")

      html = render(index_live)
      assert html =~ "Ergebnisse abschlussarbeiten updated successfully"
      assert html =~ "some updated matrikelnummer"
    end

    test "deletes ergebnisse_abschlussarbeiten in listing", %{conn: conn, ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/ergebnisse_abschlussarbeiten")

      assert index_live |> element("#ergebnisse_abschlussarbeiten_collection-#{ergebnisse_abschlussarbeiten.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#ergebnisse_abschlussarbeiten-#{ergebnisse_abschlussarbeiten.id}")
    end
  end

  describe "Show" do
    setup [:create_ergebnisse_abschlussarbeiten]

    test "displays ergebnisse_abschlussarbeiten", %{conn: conn, ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten} do
      {:ok, _show_live, html} =
        conn
      |> log_in_user(user_fixture())
      |> live(~p"/ergebnisse_abschlussarbeiten/#{ergebnisse_abschlussarbeiten}")

      assert html =~ "Show Ergebnisse abschlussarbeiten"
      assert html =~ ergebnisse_abschlussarbeiten.matrikelnummer
    end

    test "updates ergebnisse_abschlussarbeiten within modal", %{conn: conn, ergebnisse_abschlussarbeiten: ergebnisse_abschlussarbeiten} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/ergebnisse_abschlussarbeiten/#{ergebnisse_abschlussarbeiten}")
      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Ergebnisse abschlussarbeiten"

      assert_patch(show_live, ~p"/ergebnisse_abschlussarbeiten/#{ergebnisse_abschlussarbeiten}/show/edit")

      assert show_live
             |> form("#ergebnisse_abschlussarbeiten-form", ergebnisse_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#ergebnisse_abschlussarbeiten-form", ergebnisse_abschlussarbeiten: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/ergebnisse_abschlussarbeiten/#{ergebnisse_abschlussarbeiten}")

      html = render(show_live)
      assert html =~ "Ergebnisse abschlussarbeiten updated successfully"
      assert html =~ "some updated matrikelnummer"
    end
  end
end
