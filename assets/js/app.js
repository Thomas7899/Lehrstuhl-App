// assets/js/app.js
import "phoenix_html"

import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"

import "../vendor/preline"

// Chart.js kommt global über das Script in root.html.heex (window.Chart)

// -----------------------------
// 🔥 LiveView Hooks
// -----------------------------
let Hooks = {}

/* ----------------------------------------------------
   📊 Notenverteilung für einzelne Klausur
---------------------------------------------------- */
Hooks.NotenChartHook = {
  mounted() {
    console.log("NotenChartHook mounted")

    const ctx = this.el
    const labels = JSON.parse(this.el.dataset.labels)
    const values = JSON.parse(this.el.dataset.values)

    new Chart(ctx, {
      type: "bar",
      data: {
        labels,
        datasets: [
          {
            label: "Häufigkeit",
            data: values,
            borderWidth: 1
          }
        ]
      },
      options: {
        plugins: {
          legend: { labels: { color: "#e5e7eb" } }
        },
        scales: {
          x: {
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          },
          y: {
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          }
        }
      }
    })
  }
}

/* ----------------------------------------------------
   📊 Durchschnittsnote pro Klausur (Modul-Show)
---------------------------------------------------- */
Hooks.ModulAverageChartHook = {
  mounted() {
    console.log("ModulAverageChartHook mounted")

    const ctx = this.el
    const labels = JSON.parse(this.el.dataset.labels || "[]")
    const values = JSON.parse(this.el.dataset.values || "[]")

    if (!labels.length) return

    new Chart(ctx, {
      type: "bar",
      data: {
        labels,
        datasets: [
          {
            label: "Ø-Note",
            data: values,
            borderWidth: 1
          }
        ]
      },
      options: {
        plugins: {
          legend: { labels: { color: "#e5e7eb" } }
        },
        scales: {
          x: {
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          },
          y: {
            beginAtZero: true,
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          }
        }
      }
    })
  }
}

/* ----------------------------------------------------
   👥 Teilnehmer pro Klausur (Modul-Show)
---------------------------------------------------- */
Hooks.ModulParticipantsChartHook = {
  mounted() {
    console.log("ModulParticipantsChartHook mounted")

    const ctx = this.el
    const labels = JSON.parse(this.el.dataset.labels || "[]")
    const values = JSON.parse(this.el.dataset.values || "[]")

    if (!labels.length) return

    new Chart(ctx, {
      type: "bar",
      data: {
        labels,
        datasets: [
          {
            label: "Teilnehmer",
            data: values,
            borderWidth: 1
          }
        ]
      },
      options: {
        plugins: {
          legend: { labels: { color: "#e5e7eb" } }
        },
        scales: {
          x: {
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          },
          y: {
            beginAtZero: true,
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          }
        }
      }
    })
  }
}

/* ----------------------------------------------------
   📊 Statistik abstrakte Abschlussarbeiten (Dashboard & Filter)
---------------------------------------------------- */
Hooks.AbstraktStatsChart = {
  mounted() {
    console.log("AbstraktStatsChart mounted")

    const el = this.el
    const ctx = el.getContext("2d")

    const labels = JSON.parse(el.dataset.labels || "[]")
    const values = JSON.parse(el.dataset.values || "[]")
    const counts = JSON.parse(el.dataset.counts || "[]")

    if (!labels.length) return

    this.chart = new Chart(ctx, {
      type: "bar",
      data: {
        labels,
        datasets: [
          {
            type: "bar",
            label: "Durchschnittsnote",
            data: values,
            backgroundColor: "rgba(129, 140, 248, 0.7)", // indigo
            borderWidth: 1
          },
          {
            type: "line",
            label: "Anzahl Ergebnisse",
            data: counts,
            borderColor: "rgba(16, 185, 129, 1)", // emerald
            borderWidth: 2,
            tension: 0.3,
            yAxisID: "y1"
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            labels: { color: "#e5e7eb" }
          }
        },
        scales: {
          x: {
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          },
          y: {
            beginAtZero: true,
            title: { display: true, text: "Note", color: "#e5e7eb" },
            ticks: { color: "#e5e7eb" },
            grid: { color: "rgba(255,255,255,0.05)" }
          },
          y1: {
            beginAtZero: true,
            position: "right",
            title: { display: true, text: "Anzahl", color: "#e5e7eb" },
            ticks: { color: "#e5e7eb" },
            grid: { drawOnChartArea: false }
          }
        }
      }
    })
  },
  destroyed() {
    if (this.chart) this.chart.destroy()
  }
}

// -----------------------------
// 🔥 LiveSocket initialisieren
// -----------------------------
let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content")

let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: Hooks
})

// -----------------------------
// Progress Bar + Preline Re-Init
// -----------------------------
topbar.config({
  barColors: { 0: "#29d" },
  shadowColor: "rgba(0, 0, 0, .3)"
})

window.addEventListener("phx:page-loading-start", _info => topbar.show(300))

window.addEventListener("phx:page-loading-stop", _info => {
  topbar.hide()
  setTimeout(() => {
    if (window.HSStaticMethods) window.HSStaticMethods.autoInit()
  }, 100)
})

window.addEventListener("phx:update", () => {
  setTimeout(() => {
    if (window.HSStaticMethods) window.HSStaticMethods.autoInit()
  }, 100)
})

// -----------------------------
// Verbinden
// -----------------------------
liveSocket.connect()
window.liveSocket = liveSocket