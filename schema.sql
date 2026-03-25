-- 1. SPORT
CREATE TABLE Sport (
    sport_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. LEAGUE
CREATE TABLE League (
    league_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    sport_id INT NOT NULL,
    FOREIGN KEY (sport_id) REFERENCES Sport(sport_id)
);

-- 3. SEASON
CREATE TABLE Season (
    season_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- 4. LEAGUE SEASON
CREATE TABLE LeagueSeason (
    league_season_id INT PRIMARY KEY AUTO_INCREMENT,
    league_id INT NOT NULL,
    season_id INT NOT NULL,
    UNIQUE (league_id, season_id),
    FOREIGN KEY (league_id) REFERENCES League(league_id),
    FOREIGN KEY (season_id) REFERENCES Season(season_id)
);

-- 5. TEAM
CREATE TABLE Team (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

-- 6. TEAM SEASON
CREATE TABLE TeamSeason (
    team_id INT NOT NULL,
    league_season_id INT NOT NULL,
    PRIMARY KEY (team_id, league_season_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
    FOREIGN KEY (league_season_id) REFERENCES LeagueSeason(league_season_id)
);

-- 7. VENUE
CREATE TABLE Venue (
    venue_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100),
    capacity INT
);

-- 8. EVENT
CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    league_season_id INT NOT NULL,
    venue_id INT NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    description TEXT,
    FOREIGN KEY (league_season_id) REFERENCES LeagueSeason(league_season_id),
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id)
);

-- 9. EVENT PARTICIPANT
CREATE TABLE EventParticipant (
    event_id INT NOT NULL,
    team_id INT NOT NULL,
    role VARCHAR(20) CHECK (role IN ('home', 'away')),
    PRIMARY KEY (event_id, team_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

-- 10. EVENT RESULT
CREATE TABLE EventResult (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    team_id INT NOT NULL,
    score INT NOT NULL,
    outcome VARCHAR(10) CHECK (outcome IN ('win', 'loss', 'draw')),
    UNIQUE (event_id, team_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

-- 11. REFEREE
CREATE TABLE Referee (
    referee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100)
);

-- 12. EVENT REFEREE
CREATE TABLE EventReferee (
    event_id INT NOT NULL,
    referee_id INT NOT NULL,
    role VARCHAR(20) CHECK (role IN ('main', 'assistant', 'var')),
    PRIMARY KEY (event_id, referee_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE,
    FOREIGN KEY (referee_id) REFERENCES Referee(referee_id)
);