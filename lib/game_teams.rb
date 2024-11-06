class GameTeams
    attr_reader :game_id,
                :team_id,
                :hoa,
                :results,
                :head_coach,
                :goals,
                :shots,
                :tackles

    def initialize(game_id, row_data)
        @game_id = game_id
        @team_id = row_data[:team_id]
        @hoa = row_data[:hoa]
        @results = row_data[:results]
        @head_coach = row_data[:head_coach]
        @goals = row_data[:goals]
        @shots = row_data[:shots]
        @tackles = row_data[:tackles]
    end

    def game_team_id
            "#{@game_id}#{@team_id}"
    end
end