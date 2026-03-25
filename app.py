from flask import Flask, render_template, request, redirect
import mysql.connector

app = Flask(__name__)

# DATABASE CONNECTION
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # default XAMPP
        database="sports_calendar"
    )

# GET ALL EVENTS
@app.route("/")
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT 
        e.event_id,
        e.event_date,
        e.event_time,
        s.name AS sport,
        t1.name AS home_team,
        t2.name AS away_team
    FROM Event e
    JOIN LeagueSeason ls ON e.league_season_id = ls.league_season_id
    JOIN League l ON ls.league_id = l.league_id
    JOIN Sport s ON l.sport_id = s.sport_id

    JOIN EventParticipant ep1 
        ON e.event_id = ep1.event_id AND ep1.role = 'home'
    JOIN Team t1 ON ep1.team_id = t1.team_id

    JOIN EventParticipant ep2 
        ON e.event_id = ep2.event_id AND ep2.role = 'away'
    JOIN Team t2 ON ep2.team_id = t2.team_id
    """

    cursor.execute(query)
    events = cursor.fetchall()

    conn.close()

    return render_template("index.html", events=events)

# GET SINGLE EVENT
@app.route("/event/<int:event_id>")
def event_detail(event_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT 
        e.event_id,
        e.event_date,
        e.event_time,
        s.name AS sport,
        t1.name AS home_team,
        t2.name AS away_team
    FROM Event e
    JOIN LeagueSeason ls ON e.league_season_id = ls.league_season_id
    JOIN League l ON ls.league_id = l.league_id
    JOIN Sport s ON l.sport_id = s.sport_id

    JOIN EventParticipant ep1 
        ON e.event_id = ep1.event_id AND ep1.role = 'home'
    JOIN Team t1 ON ep1.team_id = t1.team_id

    JOIN EventParticipant ep2 
        ON e.event_id = ep2.event_id AND ep2.role = 'away'
    JOIN Team t2 ON ep2.team_id = t2.team_id

    WHERE e.event_id = %s
    """

    cursor.execute(query, (event_id,))
    event = cursor.fetchone()

    conn.close()

    return render_template("event.html", event=event)

# ADD EVENT
@app.route("/add", methods=["POST"])
def add_event():
    conn = get_db_connection()
    cursor = conn.cursor()

    date = request.form["date"]
    time = request.form["time"]
    league_season_id = request.form["league_season_id"]
    venue_id = request.form["venue_id"]

    # Insert event
    cursor.execute(
        "INSERT INTO Event (league_season_id, venue_id, event_date, event_time) VALUES (%s, %s, %s, %s)",
        (league_season_id, venue_id, date, time)
    )

    event_id = cursor.lastrowid

    # Insert teams
    home_team = request.form["home_team"]
    away_team = request.form["away_team"]

    cursor.execute(
        "INSERT INTO EventParticipant (event_id, team_id, role) VALUES (%s, %s, 'home')",
        (event_id, home_team)
    )

    cursor.execute(
        "INSERT INTO EventParticipant (event_id, team_id, role) VALUES (%s, %s, 'away')",
        (event_id, away_team)
    )

    conn.commit()
    conn.close()

    return redirect("/")

# RUN APP
if __name__ == "__main__":
    app.run(debug=True)