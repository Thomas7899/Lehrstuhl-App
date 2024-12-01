defmodule LehrstuhlWeb.SeminarLiveTest do
  use LehrstuhlWeb.ConnCase

  import Phoenix.LiveViewTest
  import Lehrstuhl.SeminareFixtures
  import Lehrstuhl.AccountsFixtures

  @create_attrs %{
    titel: "some titel",
    aufnahmekapazitaet: 42,
    semester: "WS-2020",
    praesenzdatum: "2023-10-25",
    ort: "some ort"
  }
  @update_attrs %{
    titel: "some updated titel",
    aufnahmekapazitaet: 43,
    semester: "some updated semester",
    praesenzdatum: "2023-10-26",
    ort: "some updated ort"
  }
  @invalid_attrs %{
    titel: nil,
    aufnahmekapazitaet: nil,
    semester: nil,
    praesenzdatum: nil,
    ort: nil
  }

  defp create_seminar(_) do
    seminar = seminar_fixture()
    %{seminar: seminar}
  end

  describe "Index" do
    setup [:create_seminar]

    test "lists all seminare", %{conn: conn, seminar: seminar} do
      {:ok, _index_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminare")

      assert html =~ "Listing Seminare"
      assert html =~ seminar.titel
    end

    test "saves new seminar", %{conn: conn} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminare")

      assert index_live |> element("a", "New Seminar") |> render_click() =~
               "New Seminar"

      assert_patch(index_live, ~p"/seminare/new")

      assert index_live
             |> form("#seminar-form", seminar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#seminar-form", seminar: @create_attrs)
             |> render_submit()

      # ToDo: adapt test
      # assert_patch(index_live, ~p"/seminare")

      # html = render(index_live)
      # assert html =~ "Seminar created successfully"
      # assert html =~ "some abstraktes_seminar_id"
    end

    test "updates seminar in listing", %{conn: conn, seminar: seminar} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminare")

      assert index_live |> element("#seminare-#{seminar.id} a", "Edit") |> render_click() =~
               "Edit Seminar"

      assert_patch(index_live, ~p"/seminare/#{seminar}/edit")

      assert index_live
             |> form("#seminar-form", seminar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#seminar-form", seminar: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/seminare")

      html = render(index_live)
      assert html =~ "Seminar updated successfully"
    end

    test "deletes seminar in listing", %{conn: conn, seminar: seminar} do
      {:ok, index_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminare")

      assert index_live |> element("#seminare-#{seminar.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#seminare-#{seminar.id}")
    end
  end

  describe "Show" do
    setup [:create_seminar]

    test "displays seminar", %{conn: conn, seminar: seminar} do
      {:ok, _show_live, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminare/#{seminar}")

      assert html =~ "Show Seminar"
      assert html =~ seminar.titel
    end

    test "updates seminar within modal", %{conn: conn, seminar: seminar} do
      {:ok, show_live, _html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/seminare/#{seminar}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Seminar"

      assert_patch(show_live, ~p"/seminare/#{seminar}/show/edit")

      assert show_live
             |> form("#seminar-form", seminar: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#seminar-form", seminar: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/seminare/#{seminar}")

      html = render(show_live)
      assert html =~ "Seminar updated successfully"
    end
  end
end
