require './spec/spec_helper.rb'

RSpec.describe SeasonStatable do
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


        describe "#most_tackles" do
            it 'returns the team with the most tackles' do
                expect(@stat_tracker.most_tackles("20132014")).to eq "FC Cincinnati"
                expect(@stat_tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
                # team_with_most_tackles = @stat_tracker.most_tackles

                # expect(@stat_tracker.most_tackles).to be_a(String)
                # expect(@stat_tracker.most_tackles.to_i).to be > 0
            end
        end

        describe "#fewest_tackles" do
            it 'returns the team with the least tackles' do
                expect(@stat_tracker.fewest_tackles("20132014")).to eq "Atlanta United"
                expect(@stat_tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
                # team_with_least_tackles = @stat_tracker.fewest_tackles
                
                # expect(@stat_tracker.fewest_tackles).to be_a(String)
                # expect(@stat_tracker.fewest_tackles.to_i).to be > 0
            end
        end
    end


    # describe '#worst_coach' do
    #     it 'can return the worst coach in the season' do


    #         expect(@stat_tracker.worst_coach).to eq("The coach with the least wins for the 20122013 season is John Tortorella with 0 wins")
    #     end
    # end