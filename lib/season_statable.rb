module SeasonStatable
        # Returns the name of the team with the most tackles for a given season
    def most_tackles(season_id)
        tackles_by_team = calculate_tackles(season_id)
        team_with_most_tackles = find_team_with_most_tackles(tackles_by_team)
        team_name_from_id(team_with_most_tackles)
    end
#         # calls on calculate_tackles to get a hash with team:id as the key 
#         # and the total number of tackles.
#         # Itll also find the team w/ the highest number of tackles and using the 
#         # find_team_with_most_tackles. OR the ..least_tackles.
    # Returns the name of the team with the fewest tackles for a given season
    def fewest_tackles(season_id)
        tackles_by_team = calculate_tackles(season_id)
        team_with_least_tackles = find_team_with_fewest_tackles(tackles_by_team)
        team_name_from_id(team_with_least_tackles)
    end

#          #Helper method to calculate tackles for each team for a given season
    def calculate_tackles(season_id)
        tackles_by_team = Hash.new(0)
#          #creates a new hash called tackles_by_team with a default value of 0
#          #iterate over all game teams, using season_id as the hash 
        @game_teams.each_value do |game_team|
        game = @games[game_team.game_id]
        next unless game && game.season == season_id  # Filter by season

        team_id = game_team.team_id
        tackles = game_team.tackles
        tackles_by_team[team_id] += tackles
        end

        tackles_by_team
    end

    # Helper method to find the team with the most tackles
    def find_team_with_most_tackles(tackles_by_team)
        tackles_by_team.max_by { |_, tackles| tackles }&.first
    end

    # Helper method to find the team with the least tackles
    def find_team_with_fewest_tackles(tackles_by_team)
        tackles_by_team.min_by { |_, tackles| tackles }&.first
    end

    # Helper method to convert team_id to team name
    def team_name_from_id(team_id)
        @teams[team_id].name
    end

    # Helper method, returns an array of game_id's for the given season
    def games_by_season(season)
        season_games = []
        @games.find_all do |game|
            if game[1].season == season
                season_games << game[1].game_id
            end
        end
        return season_games
    end
    
    # Helper method, returns a hash with the team_id as keys and their total shots and goals for the provided season as an array value.
    def team_season_shot_goals(season_games)
        team_shot_goal_count = Hash.new do |team_shot_goal_count, team_id| 
            team_shot_goal_count[team_id] = [0, 0]
        end
        season_games.each do |game|
            @game_teams.each do |game_id|
                if game_id[1].game_id == game
                    team_shot_goal_count[game_id[1].team_id][0] += game_id[1].goals
                    team_shot_goal_count[game_id[1].team_id][1] += game_id[1].shots
                end
            end
        end
        return team_shot_goal_count
    end

    # Helper method, returns a hash with the team_id as the keys with their shots to goals ratio percentage.
    def team_ratios(team_shot_goal_count)
        team_ratios = Hash.new(0)
        team_shot_goal_count.each do |team|
            team_ratios[team[0]] = team[1][0].to_f / team[1][1].to_f
        end
        return team_ratios
    end

    def best_ratio(team_ratios)
        team_ratios.max_by do |team|
            team[1]
        end[0]
    end

    def worst_ratio(team_ratios)
        team_ratios.min_by do |team|
            team[1]
        end[0]
    end

    def most_accurate_team(season)
        team_id = best_ratio(team_ratios(team_season_shot_goals(games_by_season(season))))
        return team_name_from_id(team_id)
    end

    def least_accurate_team(season)
        team_id = worst_ratio(team_ratios(team_season_shot_goals(games_by_season(season))))
        return team_name_from_id(team_id)
    end
end