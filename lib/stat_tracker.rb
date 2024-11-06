require 'csv'
require './spec/spec_helper'

class StatTracker
    attr_reader :teams, :games, :game_teams
    def initialize
        @teams = {}
        @games = {}
        @game_teams = {}
    end

    def self.from_csv(locations)
        stat_tracker = StatTracker.new
        stat_tracker.load_teams_data(locations[:teams])
        stat_tracker.load_games_data(locations[:games])
        binding.pry
    end

    def load_teams_data(location)
        CSV.foreach(location, headers: true, header_converters: :symbol) do |row|
            new_team = Team.new(row[:team_id], row[:teamname])
            @teams[new_team.team_id] = new_team.name
        end
    end
    
    def load_games_data(location)
        CSV.foreach(location, headers: true, header_converters: :symbol) do |row|
            new_game = Game.new(row[:game_id], row[:season], row[:away_team_id], row[:home_team_id], row[:away_goals].to_i, row[:home_goals].to_i)
            @games[new_game.game_id] = [new_game.season, new_game.away_team, new_game.home_team, new_game.away_goals, new_game.home_goals]
        end
    end
end

