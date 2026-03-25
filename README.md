# Sports Calendar Database

## Description

This project implements a relational database for managing a sports event calendar.
It stores information about sports, leagues, seasons, teams, venues, events, results and referees.

## Features

* Supports multiple sports (e.g., football, ice hockey)
* Tracks leagues across different seasons
* Stores teams and their participation per season
* Records events (matches) with date and time
* Tracks match results (scores and outcomes)
* Assigns referees to events
* Fully normalized (3NF)

## Database Structure

Main entities:

* Sport
* League
* Season
* LeagueSeason
* Team
* TeamSeason
* Event
* EventParticipant
* EventResult
* Venue
* Referee
* EventReferee

## How to Run

### 1. Start XAMPP

Start Apache and MySQL.

### 2. Create Database

```sql
CREATE DATABASE sports_calendar;
USE sports_calendar;
```

### 3. Import Schema

```bash
mysql -u root sports_calendar < schema.sql
```

### 4. Import Sample Data

```bash
mysql -u root sports_calendar < data.sql
```


