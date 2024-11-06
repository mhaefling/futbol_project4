require './spec/spec_helper.rb'

RSpec.describe GameStatable do
    before(:each) do
        game_path = './data/games.csv'
        team_path = './data/teams.csv'
        game_teams_path = './data/game_teams.csv'

        locations = {
            games: game_path,
            teams: team_path,
            game_teams: game_teams_path
        }
        
        @stat_tracker = StatTracker.from_csv(locations)
        @stat_tracker.extend(GameStatable)
    end
    describe '#total_game_count' do
        it 'returns the total amount of games' do

            expect(@stat_tracker.total_game_count).to eq(7441.0)
        end
    end

    describe '#total_home_wins' do
        it 'returns the total home game wins' do

            expect(@stat_tracker.total_home_wins).to eq(3237.0)
        end
    end

    describe '#total_visitor_wins' do
        it 'returns the total away game wins' do

            expect(@stat_tracker.total_visitor_wins).to eq(2687.0)
        end
    end


    describe '#percentage_home_wins' do
        it 'calculates the percentage of home wins' do
            expect(@stat_tracker.percentage_home_wins).to eq(0.44)
        end
    end

    describe '#percentage_visitor_wins' do
        it 'calculates the percentage of away wins' do

            expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
        end
    end
end