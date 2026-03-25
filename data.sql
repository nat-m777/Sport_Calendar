-- ====================================
-- SAMPLE DATA
-- ====================================

-- Sport
INSERT INTO Sport (name) VALUES
('Football'),
('Ice Hockey');

-- Season
INSERT INTO Season (name, start_date, end_date) VALUES
('2019/2020', '2019-07-01', '2020-06-30');

-- League
INSERT INTO League (name, sport_id) VALUES
('Austrian Bundesliga', 1),
('ICE Hockey League', 2);

-- LeagueSeason
INSERT INTO LeagueSeason (league_id, season_id) VALUES
(1, 1),
(2, 1);

-- Teams
INSERT INTO Team (name, city, country) VALUES
('Salzburg', 'Salzburg', 'Austria'),
('Sturm', 'Graz', 'Austria'),
('KAC', 'Klagenfurt', 'Austria'),
('Capitals', 'Vienna', 'Austria');

-- TeamSeason
INSERT INTO TeamSeason (team_id, league_season_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- Venue
INSERT INTO Venue (name, city, country, capacity) VALUES
('Red Bull Arena', 'Salzburg', 'Austria', 30000),
('Stadthalle', 'Vienna', 'Austria', 16000);

-- Events
INSERT INTO Event (league_season_id, venue_id, event_date, event_time, description) VALUES
(1, 1, '2019-07-18', '18:30:00', 'Salzburg vs Sturm'),
(2, 2, '2019-10-23', '09:45:00', 'KAC vs Capitals');

-- Event Participants
INSERT INTO EventParticipant (event_id, team_id, role) VALUES
(1, 1, 'home'),
(1, 2, 'away'),
(2, 3, 'home'),
(2, 4, 'away');

-- Event Results
INSERT INTO EventResult (event_id, team_id, score, outcome) VALUES
(1, 1, 2, 'win'),
(1, 2, 1, 'loss'),
(2, 3, 3, 'win'),
(2, 4, 2, 'loss');

-- Referees
INSERT INTO Referee (first_name, last_name, nationality) VALUES
('John', 'Doe', 'Austria'),
('Mark', 'Smith', 'Austria');

-- Event Referees
INSERT INTO EventReferee (event_id, referee_id, role) VALUES
(1, 1, 'main'),
(1, 2, 'assistant'),
(2, 1, 'main');
