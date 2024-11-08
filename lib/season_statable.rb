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
end