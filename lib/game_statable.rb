module GameStatable

    # Counts all of the keys in the game_teams hash and divides them by 2
    # Divides them by two because each game is entered twice with the team id 
    # concatenated to the end of the game_id
    # => Integer: 7441
    def total_game_count
        # binding.pry
        @game_teams.count / 2
    end

    # Counts all the key values in the game_teams hash comparing the hoa value to confirm
    # it was a home game, and the result value to confirm it was a win and then converts the total
    # count to a float.
    # => Float: 3237.0
    def total_home_wins
        home_games = @game_teams.count do |game|
            game[1].hoa == "home" && game[1].result == "WIN"
        end.to_f
    end

    # Counts all the key values in the game_teams hash comparing the hoa value to confirm
    # it was a away game, and the result value to confirm it was a win and then converts the total
    # count to a float.
    # => Float: 2687.0
    def total_visitor_wins
        visitor_games = @game_teams.count do |game|
            game[1].hoa == "away" && game[1].result == "WIN"
        end.to_f
    end
    
    # Determines the percent of home wins by taking the result of the total_home_wins method (3237.0)
    # and dividing it by the result of the total_game_count method (7441) and then rounding the return
    # value down to 2 decimal places.
    # => Float: 0.44
    def percentage_home_wins
        home_wins_percent = total_home_wins / total_game_count
        home_wins_percent.round(2)
    end

    # Determines the percent of visitor wins by taking the result of the total_visitor_wins method (2687.0)
    # and dividing it by the result of the total_game_count method (7441) and then rounding the return
    # value down to 2 decimal places.
    # => Float: 0.36
    def percentage_visitor_wins
        visitor_wins_percent = total_visitor_wins / total_game_count
        visitor_wins_percent.round(2)
    end

    # iterates over the gam
    def count_of_games_by_season

        season_counts = {}  
        games.each do |season|
            season = games.season  
            if season_counts[season]
            season_counts[season] += 1  
            else
            season_counts[season] = 1   
            end
        end
        
        season_counts
        
    end
end