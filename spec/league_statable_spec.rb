require './spec/spec_helper.rb'

RSpec.describe LeagueStatable do
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

    describe '#sort_away_teams' do
        it 'sorts games by away teams' do
            @stat_tracker.group_away_teams
            expect(@stat_tracker.sort_away_teams).to eq(Array)
        end
    end

    

    describe '#lowest_scoring_visitor' do
        it 'returns lowest scoring visitor in league' do
            expect(@stat_tracker.lowest_scoring_visitor).to eq("San Jose Earthquakes")
        end
    end

    describe '#lowest_scoring_home_team' do
        it 'returns lowest scoring visitor in league' do
            expect(@stat_tracker.lowest_scoring_home_town).to eq("Utah Royals FC")
        end
    end
end