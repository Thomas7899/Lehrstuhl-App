defmodule LehrstuhlWeb.SeminarergebnisLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.SeminareFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{
    fachvortrag_titel: "some fachvortrag_titel",
    fachvortrag_datum: "2023-10-24",
    fachvortrag_start: "14:00",
    fachvortrag_stop: "14:00",
    fachvortrag_notenvorschlag: "120.5",
    fachvortrag_teilnote: "120.5",
    seminararbeit_titel: "some seminararbeit_titel",
    seminararbeit_einreichung: "2023-10-24",
    seminararbeit_notenvorschlag: "120.5",
    seminararbeit_teilnote: "120.5",
    gesamtergebnis: "120.5"
  }
  @update_attrs %{
    fachvortrag_titel: "some updated fachvortrag_titel",
    fachvortrag_datum: "2023-10-25",
    fachvortrag_start: "15:01",
    fachvortrag_stop: "15:01",
    fachvortrag_notenvorschlag: "456.7",
    fachvortrag_teilnote: "456.7",
    seminararbeit_titel: "some updated seminararbeit_titel",
    seminararbeit_einreichung: "2023-10-25",
    seminararbeit_notenvorschlag: "456.7",
    seminararbeit_teilnote: "456.7",
    gesamtergebnis: "456.7"
  }

  defp create_seminarergebnis(_) do
    seminarergebnis = seminarergebnis_fixture()
    %{seminarergebnis: seminarergebnis}
  end

  describe "Index" do
    setup [:create_seminarergebnis]

    test "lists all seminarergebnisse", %{conn: conn, seminarergebnis: seminarergebnis} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminarergebnisse")

      assert html =~ "Listing Seminarergebnisse"
      assert html =~ seminarergebnis.fachvortrag_titel
    end

    test "saves new seminarergebnis", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminarergebnisse")

      assert index_live |> element("a", "New Seminarergebnis") |> render_click() =~
               "New Seminarergebnis"

      assert_patch(index_live, ~p"/seminarergebnisse/new")

      assert index_live
             |> form("#seminarergebnis-form", seminarergebnis: @create_attrs)
             |> render_submit()

      # assert_patch(index_live, ~p"/seminarergebnisse")

      # html = render(index_live)
      # TODO: fix: assert html =~ "Seminarergebnis created successfully"
      # TODO: fix: assert html =~ "some fachvortrag_titel"
    end

    test "updates seminarergebnis in listing", %{conn: conn, seminarergebnis: seminarergebnis} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminarergebnisse")

      assert index_live
             |> element("#seminarergebnisse-#{seminarergebnis.id} a", "Edit")
             |> render_click() =~
               "Edit Seminarergebnis"

      assert_patch(index_live, ~p"/seminarergebnisse/#{seminarergebnis}/edit")

      assert index_live
             |> form("#seminarergebnis-form", seminarergebnis: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/seminarergebnisse")

      html = render(index_live)
      assert html =~ "Seminarergebnis updated successfully"
      assert html =~ "some updated fachvortrag_titel"
    end

    test "deletes seminarergebnis in listing", %{conn: conn, seminarergebnis: seminarergebnis} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminarergebnisse")

      assert index_live
             |> element("#seminarergebnisse-#{seminarergebnis.id} a", "Delete")
             |> render_click()

      refute has_element?(index_live, "#seminarergebnisse-#{seminarergebnis.id}")
    end
  end

  describe "Show" do
    setup [:create_seminarergebnis]

    test "displays seminarergebnis", %{conn: conn, seminarergebnis: seminarergebnis} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminarergebnisse/#{seminarergebnis}")

      assert html =~ "Show Seminarergebnis"
      assert html =~ seminarergebnis.fachvortrag_titel
    end

    test "updates seminarergebnis within modal", %{conn: conn, seminarergebnis: seminarergebnis} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminarergebnisse/#{seminarergebnis}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Seminarergebnis"

      assert_patch(show_live, ~p"/seminarergebnisse/#{seminarergebnis}/show/edit")

      assert show_live
             |> form("#seminarergebnis-form", seminarergebnis: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/seminarergebnisse/#{seminarergebnis}")

      html = render(show_live)
      assert html =~ "Seminarergebnis updated successfully"
      assert html =~ "some updated fachvortrag_titel"
    end
  end
end
