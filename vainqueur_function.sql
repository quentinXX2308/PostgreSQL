CREATE OR REPLACE FUNCTION vainqueur(paysl VARCHAR, paysv VARCHAR, match_type VARCHAR) 
RETURNS VARCHAR AS $$
DECLARE
    home_goals INT;
    away_goals INT;
    winner VARCHAR;
BEGIN
    -- Get the total goals scored by each team
    SELECT butsl, butsv INTO home_goals, away_goals
    FROM Match
    WHERE paysl = vainqueur.paysl AND paysv = vainqueur.paysv AND type = vainqueur.match_type;

    -- Determine the winner based on goals
    IF home_goals > away_goals THEN
        winner := paysl;
    ELSIF home_goals < away_goals THEN
        winner := paysv;
    ELSE
        winner := 'Draw';
    END IF;

    RETURN winner;
END;
