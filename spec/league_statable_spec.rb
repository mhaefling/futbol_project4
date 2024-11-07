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
    #         expect(@stat_tracker.sort_away_teams).to eq(Array)
    #     end
    # end

    # describe '#total_games_per_team' do

    # end

    # describe '#average_score' do
    #     it 'returns the average score based on hoa' do
    #         team_data = "3"


    #         expect(@stat_tracker.average_score(team_data)).to eq()
    #     end
    # end

    # Returns the total number of games a team played either home or away
    describe '#total_games_per_team_hoa' do
        it 'returns the total number of games a team played away' do
            team_id = '27'
            hoa = 'away'

            expect(@stat_tracker.total_games_per_team_hoa(team_id, hoa)).to eq(65)
        end

        it 'returns the total number of games a team played at home' do
            team_id = '27'
            hoa = 'home'

            expect(@stat_tracker.total_games_per_team_hoa(team_id, hoa)).to eq(65)
        end
    end

    describe '#sum_of_team_scores_hoa' do
        it 'returns the sum of the scores a team made while away' do
            team_id = '27'
            hoa = 'away'

            expect(@stat_tracker.sum_of_team_scores_hoa(team_id, hoa)).to eq(120)
        end

        it 'returns the sum of the scores a team made while home' do
            team_id = '27'
            hoa = 'home'

            expect(@stat_tracker.sum_of_team_scores_hoa(team_id, hoa)).to eq(143)
        end
    end

    describe "#average_score_hoa" do
        it 'returns the average score of all a teams away games' do
            team_id = '27'
            hoa = 'away'

            expect(@stat_tracker.average_score_hoa(team_id, hoa)).to eq(1.84615)
        end

        it 'returns the average score of all a teams home game' do
            team_id = '27'
            hoa = 'home'

            expect(@stat_tracker.average_score_hoa(team_id, hoa)).to eq(2.2)
        end
    end

    describe '#lowest_scoring_visitor' do
        it 'returns lowest scoring visitor in league' do
            expect(@stat_tracker.lowest_scoring_visitor).to eq("San Jose Earthquakes")
        end
    end

    describe '#lowest_scoring_home_team' do
        it 'returns lowest scoring visitor in league' do
            expect(@stat_tracker.lowest_scoring_home_team).to eq("Utah Royals FC")
        end
    end

    
end