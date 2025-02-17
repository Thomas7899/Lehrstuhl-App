defmodule LehrstuhlWeb.KonkreteAbschlussarbeitenLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.AbschlussarbeitenFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{betreuer: :hansen,
   forschungsprojekt: :sport,
    semester: "SS-2023",
     matrikelnummer: "some matrikelnummer",
      angepasste_themenskizze: "some angepasste_themenskizze",
       gesetzte_schwerpunkte: "some gesetzte_schwerpunkte",
        anmeldung_pruefungsamt: "2023-11-28",
         abgabedatum: "2023-11-28",
          studienniveau: :bachelor,
          student_id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1"}
  @update_attrs %{betreuer: :becker,
   forschungsprojekt: :tool,
    semester: "SS-2023",
     matrikelnummer: "some updated matrikelnummer",
      angepasste_themenskizze: "some updated angepasste_themenskizze",
       gesetzte_schwerpunkte: "some updated gesetzte_schwerpunkte",
        anmeldung_pruefungsamt: "2023-11-29",
         abgabedatum: "2023-11-29",
          studienniveau: :master,
          student_id: "44e68a9e-069e-4e28-96d5-3d85c5849fb1"}
  @invalid_attrs %{betreuer: nil,
   forschungsprojekt: nil,
    semester: nil,
     matrikelnummer: nil,
      angepasste_themenskizze: nil,
       gesetzte_schwerpunkte: nil,
        anmeldung_pruefungsamt: nil,
         abgabedatum: nil,
          studienniveau: nil}

  defp create_konkrete_abschlussarbeiten(_) do
    konkrete_abschlussarbeiten = konkrete_abschlussarbeiten_fixture()
    %{konkrete_abschlussarbeiten: konkrete_abschlussarbeiten}
  end

  describe "Index" do
    setup [:create_konkrete_abschlussarbeiten]

    test "lists all konkrete_abschlussarbeiten", %{conn: conn, konkrete_abschlussarbeiten: konkrete_abschlussarbeiten} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/konkrete_abschlussarbeiten")

      assert html =~ "Liste der konkreten Abschlussarbeiten"
      assert html =~ konkrete_abschlussarbeiten.matrikelnummer
    end

    test "saves new konkrete_abschlussarbeiten", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/konkrete_abschlussarbeiten")

      assert index_live |> element("a", "Neue konkrete Abschlussarbeit erstellen") |> render_click() =~
               "Neue konkrete Abschlussarbeit erstellen"

      assert_patch(index_live, ~p"/konkrete_abschlussarbeiten/new")

      assert index_live
             |> form("#konkrete_abschlussarbeiten-form", konkrete_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#konkrete_abschlussarbeiten-form", konkrete_abschlussarbeiten: @create_attrs)
             |> render_submit()

      #assert_patch(index_live, ~p"/konkrete_abschlussarbeiten")

      #html = render(index_live)
      #assert html =~ "Konkrete abschlussarbeiten created successfully"
      #assert html =~ "some semester"
    end

    test "updates konkrete_abschlussarbeiten in listing", %{conn: conn, konkrete_abschlussarbeiten: konkrete_abschlussarbeiten} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/konkrete_abschlussarbeiten")

      assert index_live |> element("#konkrete_abschlussarbeiten_collection-#{konkrete_abschlussarbeiten.id} a", "Edit")
                        |> render_click() =~ "Edit konkrete Abschlussarbeit"

      assert_patch(index_live, ~p"/konkrete_abschlussarbeiten/#{konkrete_abschlussarbeiten}/edit")

      assert index_live
             |> form("#konkrete_abschlussarbeiten-form", konkrete_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#konkrete_abschlussarbeiten-form", konkrete_abschlussarbeiten: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/konkrete_abschlussarbeiten")

      #html = render(index_live)
      #assert html =~ "Konkrete Abschlussarbeiten updated successfully"
     #assert html =~ "some updated semester"
    end

    test "deletes konkrete_abschlussarbeiten in listing", %{conn: conn, konkrete_abschlussarbeiten: konkrete_abschlussarbeiten} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/konkrete_abschlussarbeiten")

      assert index_live |> element("konkrete_abschlussarbeiten_collection-#{konkrete_abschlussarbeiten.id} a", "Delete")
                        #|> render_click()
      refute has_element?(index_live, "#konkrete_abschlussarbeiten-#{konkrete_abschlussarbeiten.id}")
    end
  end

  describe "Show" do
    setup [:create_konkrete_abschlussarbeiten]

    test "displays konkrete_abschlussarbeiten", %{conn: conn, konkrete_abschlussarbeiten: konkrete_abschlussarbeiten} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/konkrete_abschlussarbeiten/#{konkrete_abschlussarbeiten}")

      assert html =~ "Show konkrete Abschlussarbeiten"
      assert html =~ konkrete_abschlussarbeiten.matrikelnummer
    end

    test "updates konkrete_abschlussarbeiten within modal", %{conn: conn, konkrete_abschlussarbeiten: konkrete_abschlussarbeiten} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/konkrete_abschlussarbeiten/#{konkrete_abschlussarbeiten}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit konkrete Abschlussarbeit"

      assert_patch(show_live, ~p"/konkrete_abschlussarbeiten/#{konkrete_abschlussarbeiten}/show/edit")

      assert show_live
             |> form("#konkrete_abschlussarbeiten-form", konkrete_abschlussarbeiten: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#konkrete_abschlussarbeiten-form", konkrete_abschlussarbeiten: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/konkrete_abschlussarbeiten/#{konkrete_abschlussarbeiten}")

      html = render(show_live)
      assert html =~ "Konkrete Abschlussarbeiten updated successfully"
      assert html =~ "some updated semester"
    end
  end
end
