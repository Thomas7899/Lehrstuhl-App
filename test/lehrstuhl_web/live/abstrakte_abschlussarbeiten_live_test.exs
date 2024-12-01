defmodule LehrstuhlWeb.AbstrakteAbschlussarbeitenLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.AbschlussarbeitenFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{betreuer: :winkler,
  forschungsprojekt: :sport,
   semester: "some semester",
    thema: "some thema",
    themenskizze: "some themenskizze"}
  @update_attrs %{betreuer: :boehmer,
  forschungsprojekt: :tool,
  semester: "some updated semester",
  thema: "some updated thema",
  themenskizze: "some updated themenskizze"}
  @invalid_attrs %{betreuer: nil,
  forschungsprojekt: nil,
  semester: nil,
  thema: nil,
  themenskizze: nil}

  defp create_abstrakte_abschlussarbeiten(_) do
    abstrakte_abschlussarbeiten = abstrakte_abschlussarbeiten_fixture()
    %{abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten}
  end

  describe "Index" do
    setup [:create_abstrakte_abschlussarbeiten]

    test "lists all abstrakte_abschlussarbeiten", %{conn: conn, abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_abschlussarbeiten")

      assert html =~ "Liste der abstrakten Abschlussarbeiten"
      assert html =~ abstrakte_abschlussarbeiten.semester
    end

    test "saves new abstrakte_abschlussarbeiten", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_abschlussarbeiten")

      assert index_live |> element("a", "Neue abstrakte Abschlussarbeit erstellen") |> render_click() =~
               "Neue abstrakte Abschlussarbeit erstellen"

      assert_patch(index_live, ~p"/abstrakte_abschlussarbeiten/new")

      assert index_live
             |> form("#abstrakte_abschlussarbeiten-form", abstrakte_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#abstrakte_abschlussarbeiten-form", abstrakte_abschlussarbeiten: @create_attrs)
             |> render_submit()

      #assert_patch(index_live, ~p"/abstrakte_abschlussarbeiten")

      #html = render(index_live)
      #assert html =~ "Abstrakte abschlussarbeiten created successfully"
    end

    test "updates abstrakte_abschlussarbeiten in listing", %{conn: conn, abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_abschlussarbeiten")

      assert index_live |> element("#abstrakte_abschlussarbeiten_collection-#{abstrakte_abschlussarbeiten.id} a", "Edit")
                        |> render_click() =~ "Edit Abstrakte abschlussarbeiten"

      assert_patch(index_live, ~p"/abstrakte_abschlussarbeiten/#{abstrakte_abschlussarbeiten}/edit")

      assert index_live
             |> form("#abstrakte_abschlussarbeiten-form", abstrakte_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#abstrakte_abschlussarbeiten-form", abstrakte_abschlussarbeiten: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/abstrakte_abschlussarbeiten")

      html = render(index_live)
      assert html =~ "Abstrakte Abschlussarbeiten updated successfully"
      assert html =~ "some updated semester"
    end

    test "deletes abstrakte_abschlussarbeiten in listing", %{conn: conn, abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_abschlussarbeiten")

      assert index_live |> element("#abstrakte_abschlussarbeiten_collection-#{abstrakte_abschlussarbeiten.id} a", "Delete")
                        |> render_click()

      refute has_element?(index_live, "#abstrakte_abschlussarbeiten-#{abstrakte_abschlussarbeiten.id}")
    end
  end

  describe "Show" do
    setup [:create_abstrakte_abschlussarbeiten]

    test "displays abstrakte_abschlussarbeiten", %{conn: conn, abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_abschlussarbeiten/#{abstrakte_abschlussarbeiten}")

      assert html =~ "Show abstrakte Abschlussarbeiten"
      assert html =~ abstrakte_abschlussarbeiten.semester
    end

    test "updates abstrakte_abschlussarbeiten within modal", %{conn: conn, abstrakte_abschlussarbeiten: abstrakte_abschlussarbeiten} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/abstrakte_abschlussarbeiten/#{abstrakte_abschlussarbeiten}")

      assert show_live |> element("a", "Edit")
      |> render_click() =~ "Edit abstrakte Abschlussarbeiten"

      assert_patch(show_live, ~p"/abstrakte_abschlussarbeiten/#{abstrakte_abschlussarbeiten}/show/edit")

      assert show_live
             |> form("#abstrakte_abschlussarbeiten-form", abstrakte_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#abstrakte_abschlussarbeiten-form", abstrakte_abschlussarbeiten: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/abstrakte_abschlussarbeiten/#{abstrakte_abschlussarbeiten}")

      html = render(show_live)
      assert html =~ "Abstrakte Abschlussarbeiten updated successfully"
      assert html =~ "some updated semester"
    end
  end
end
