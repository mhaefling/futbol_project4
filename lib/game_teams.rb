class GameTeams
    attr_reader :game_id,
                :away_team,
                :home_team,
                :hoa,
                :results,
                :head_coach,
                :goals,
                :shots,
                :tackles

    def initialize(game_id, away_team, home_team, hoa, results, head_coach, goals, shots, tackles)
        @game_id = game_id
        @away_team = away_team
        @home_team = home_team
        @hoa = hoa
        @results = results
        @head_coach = head_coach
        @goals = goals
        @shots = shots
        @tackles = tackles
    end
end