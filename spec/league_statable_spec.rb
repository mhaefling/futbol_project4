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
    
    # describe '#sort_away_teams' do
    #     it 'sorts games by away teams' do
    #         @stat_tracker.group_away_teams
    #         # expect(@stat_tracker.sort_away_teams).to eq(Array)
    #     end
    # end

    # describe '#count_of_teams' do
    #     it 'returns the count of teams from the game_teams.csv file' do
    #         game_teams_path = './data/game_teams.csv'

    #         unique_team_count = LeagueStatable.count_of_teams(game_teams_path)

    #         expect(unique_team_count).to be > 0 
    #     end
    # end
end