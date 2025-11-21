//assets/js/app.js
// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"

import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"

import "preline"

// Chart.js
// import Chart from "chart.js/auto"

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
// Progress Bar
// -----------------------------
topbar.config({
  barColors: { 0: "#29d" },
  shadowColor: "rgba(0, 0, 0, .3)"
})

window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// --- WICHTIG: Preline Re-Init Logik ---
window.addEventListener("phx:page-loading-stop", _info => {
  topbar.hide()
  // Preline nach Navigation neu starten
  setTimeout(() => {
    if (window.HSStaticMethods) window.HSStaticMethods.autoInit();
  }, 100)
})

window.addEventListener("phx:update", () => {
    // Preline bei LiveView Updates neu starten
    setTimeout(() => {
      if (window.HSStaticMethods) window.HSStaticMethods.autoInit();
    }, 100)
});

// -----------------------------
// Verbinden
// -----------------------------
liveSocket.connect()

// Debug
window.liveSocket = liveSocket
