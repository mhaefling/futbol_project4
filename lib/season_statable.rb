module SeasonStatable
    def tackles(season)
        team_records = {}
 
 
        @game_teams.each do |game|
 
 
        @team_id = team_id
        @tackles = tackles.to_i
        #require "pry"; binding.pry
        team_records[team_id][:tackles] += tackles
        end
        team_records
    end
 
 
    # def most_tackles(tackle)
    #     @tackles_tracker = tackle
    #     @teams.tackle_tracker.max[0]
    # end
 
 
    # def fewest_tackles
    #     @tackles_tracker = tackle
    #     @teams.tackle_tracker.min[0]
    # end 
end