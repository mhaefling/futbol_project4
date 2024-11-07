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

    describe '#total_score' do
        it 'returns the sum score of winning and lossing teams' do
            game_data = @stat_tracker.games["2012030221"]

            expect(@stat_tracker.total_score(game_data)).to eq(5)
        end
    end

    describe "#highest_total_score" do
        it 'returns highest total score of teams' do
            expect(@stat_tracker.highest_total_score).to eq(11)
        end
    end

    describe "#lowest_total_score" do
        it 'returns the lowest total score of teams' do
            expect(@stat_tracker.lowest_total_score).to eq(0)
        end
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

    describe '#total_ties' do
        it 'returns the total amount of tie games' do

            expect(@stat_tracker.total_ties).to eq(1517.0)
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


    # describe '#count_of_games_by_season' do
    # expected = {
    #     "20122013"=>806,
    #     "20162017"=>1317,
    #     "20142015"=>1319,
    #     "20152016"=>1321,
    #     "20132014"=>1323,
    #     "20172018"=>1355
    #   }
    # end

    describe '#percentage_ties' do
        it 'calculates the percentage of tie games' do

            expect(@stat_tracker.percentage_ties).to eq(0.20)
        end

    end
end