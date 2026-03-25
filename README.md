# Sports Calendar Web Application

## Overview
This project is a **sports event calendar** web application built with **Python (Flask)** and **MySQL**. It allows users to view sports events, see event details, and add new events to the database. The application uses a structured database to manage sports, leagues, seasons, teams, venues, referees, and event results.

---

## Features

### Backend
- **Built with Flask (Python)**.
- Connects to a **MySQL database** (`sports_calendar`).
- Provides endpoints to:
  - Retrieve **all events** efficiently using SQL JOINs.
  - Retrieve **single event details**.
  - **Add new events** with participating teams.

### Frontend
- **HTML templates** display events in a user-friendly format.
- Navigation bar for easy browsing.
- Event list shows:
  - Date and time
  - Sport
  - Teams / Participants
- Event detail page for single event information.
- Basic **CSS styling** for readability.

### Database
- **Tables**:
  - `Sport`, `League`, `Season`, `LeagueSeason`
  - `Team`, `TeamSeason`, `Venue`
  - `Event`, `EventParticipant`, `EventResult`
  - `Referee`, `EventReferee`
- Normalized for **third normal form (3NF)**.
- Relationships support:
  - Multiple teams per event
  - Multiple referees per event
  - Event results per team
- Sample data included in `data.sql`.

---

## Project Structure

```plaintext
sports_calendar/
│
├── app.py                  # Flask backend
├── schema.sql              # Database structure (CREATE TABLEs)
├── data.sql                # Sample data (INSERT statements)
├── README.md               # This documentation
│
├── templates/              # HTML templates
│   ├── index.html          # List of all events
│   └── event.html          # Single event details
│
├── static/                 # CSS / static assets
│   └── style.css           # Basic styling
│
└── .gitignore              # Ignore unnecessary files