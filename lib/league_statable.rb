module LeagueStatable

    def goals_by_away_team
        # grouped_goals = @games.each_with_object(Hash.new(0)) do |game, team|
        #     team[game[1].away_team] += game[1].away_goals
        # end
        grouped_goals = {}
        @games.each do |game_id, game_data|

            if grouped_goals.keys.include?(game_data.away_team)
                total_away_goals = grouped_goals[game_data.away_team][1][0]
                num_away_games = grouped_goals[game_data.away_team][1][1]
                total_away_goals += game_data.away_goals
                num_away_games += 1
            else
                total_away_goals = game_data.away_goals
                num_away_games = 1
                grouped_goals[game_data.away_team] = [total_away_goals, num_away_games]
            end
        end
        return grouped_goals
    end

    # def games_per_team
    #     team_count = Hash.new(0)
    #     @games.each do |game|
    #         team_count[game[1].away_team] += 1
    #     end
    #     binding.pry
    # end
end