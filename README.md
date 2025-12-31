# 🎓 Lehrstuhl App

> An optimized, real-time management system for university faculties to handle theses, seminars, exams, and student data efficiently.

**🚀 Live Demo:** [https://lehrstuhl-app.fly.dev/](https://lehrstuhl-app.fly.dev/)

---

## 📖 About The Project

The **Lehrstuhl App** helps academic chairs manage their administrative workload. It replaces complex spreadsheets with a centralized, reactive web application. It allows faculty members to easily filter theses, track exam grades, manage seminars, and visualize performance statistics.

Built with **Elixir** and **Phoenix LiveView**, the application offers real-time updates and a snappy user experience without page reloads.

---

## � Documentation

This project includes comprehensive documentation covering the full software development lifecycle:

**📖 [View Full Documentation (Wiki)](https://github.com/Thomas7899/Lehrstuhl-App/wiki)**

| Section | Description |
|---------|-------------|
| [Requirements](https://github.com/Thomas7899/Lehrstuhl-App/wiki/Anforderungen-Lehrstuhl%E2%80%90App) | Functional & non-functional requirements (A1–A7) |
| [Data Model](https://github.com/Thomas7899/Lehrstuhl-App/wiki/Datenhaltung) | Entity-Relationship diagram & database design |
| [Design Decisions](https://github.com/Thomas7899/Lehrstuhl-App/wiki/Entwurfsentscheidungen-und-Datenmodell) | Architecture choices & implementation rationale |
| [Evaluation](https://github.com/Thomas7899/Lehrstuhl-App/wiki/Evaluation) | Cognitive Walkthrough usability testing & results |

---

### ✨ Key Features

* **dashboard & Analytics:** Get a quick overview of running theses, upcoming exams, and student KPIs. Visualized data includes grade distributions and average performance.
* **Thesis Management:** Sophisticated filtering for Bachelor's and Master's theses by semester, supervisor, research project, or status (Abstract/Concrete).
* **Exam Administration:** manage exam dates, participants, and import results efficiently via **CSV upload**.
* **Seminar Finder:** Real-time search functionality for students to find relevant seminars based on titles or topics.
* **Student Profiles:** Detailed digital files for students, tracking their academic progress and personal information.
* **Role-Based Access:** Secure login system distinguishing between public views and administrative areas.

---

# 📸 Screenshots

Here you can see the application in action, from the central dashboard to detailed filtering and statistical analysis.

<div align="center">
  <h3>🎛️ Centralized Dashboard</h3>
  <img src="/screenshots/homepage.png" alt="Dashboard Overview">
  <p><em>A quick overview of all active administrative processes, student counts, and upcoming tasks.</em></p>
</div>

<br>

| 🔍 Thesis & Project Filtering | 📊 Module Statistics & Analytics |
|:---:|:---:|
| ![Filtering Theses](/screenshots/abschlussarbeiten.png) | ![Module Details](/screenshots/module.png) |
| *Advanced filtering for specific research projects, semesters, and supervisors.* | *Detailed performance tracking, grade averages, and visualization per module.* |

---

## �🛠 Tech Stack

* **Backend/Frontend:** [Elixir](https://elixir-lang.org/) & [Phoenix Framework](https://www.phoenixframework.org/) (LiveView)
* **Database:** PostgreSQL
* **Styling:** Tailwind CSS
* **Deployment:** Fly.io
* **Visualization:** SVG/CSS Charts

---

## 🚀 Getting Started

To run this project locally, you will need Elixir and PostgreSQL installed.

### Prerequisites

* Elixir ~> 1.14
* Erlang/OTP ~> 25
* PostgreSQL

### Installation

1.  **Clone the repository**
    ```sh
    git clone [https://github.com/your-username/lehrstuhl-app.git](https://github.com/your-username/lehrstuhl-app.git)
    cd lehrstuhl-app
    ```

2.  **Install dependencies**
    ```sh
    mix deps.get
    ```

3.  **Setup Database**
    Update your `config/dev.exs` with your database credentials, then run:
    ```sh
    mix ecto.setup
    ```

4.  **Start the Server**
    ```sh
    mix phx.server
    ```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

---

## 🔐 Test Credentials

To explore the admin features in the live demo or local version, use the following credentials:

* **Email:** `admin@example.com`
* **Password:** `password123`

---

## 🗺 Roadmap

- [x] Core management for Theses and Seminars
- [x] CSV Import for Exam Grades
- [x] Data Visualization (Grade Distribution)
- [ ] Improved Mobile Responsiveness
- [ ] PDF Export for Student Transcripts
- [ ] Calendar Integration for Exam Dates

---

