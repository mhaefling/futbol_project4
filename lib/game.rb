class Game
    attr_reader :game_id,
                :season,
                :away_team,
                :home_team,
                :away_goals,
                :home_goals

    def initialize(game_id, season, away_team, home_team, away_goals, home_goals)
        @game_id = game_id
        @season = season
        @away_team = away_team
        @home_team = home_team
        @away_goals = away_goals
        @home_goals = home_goals
    end
end