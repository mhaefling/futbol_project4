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
        stat_tracker.load_team_data(locations[:teams])
        stat_tracker.load_game_data(locations[:games])
    end

    def load_team_data(location)
        CSV.foreach(location, headers: true, header_converters: :symbol) do |row|
            new_team = Team.new(row[:team_id], row[:teamname])
            @teams[new_team.team_id] = new_team.name
        end
    end
    
    def load_games_data(location)
        CSV.foreach(location, headers: true, header_converters: :symbol) do |row|
            binding.pry
            new_game = Game.new(row[:game_id], row[:season], row[:])
            @teams[new_team.team_id] = new_team.name
        end
    end
end

