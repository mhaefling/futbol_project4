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


    #     describe "#most_tackles" do
    #     it "can return the team with the most total tackles based on season" do
    #         expect(@stat_tracker.most_tackles("2012030221")).to eq("FC Dallas")
    #     end
    # end


    # describe "#fewest_tackles" do
    #     it "can return the team with the fewest total tackles based on season" do
    #         expect(@stat_tracker.fewest_tackles("2012030221")).to eq("Atlanta United")
    #     end
    # end


    # describe '#worst_coach' do
    #     it 'can return the worst coach in the season' do


    #         expect(@stat_tracker.worst_coach).to eq("The coach with the least wins for the 20122013 season is John Tortorella with 0 wins")
    #     end
    # end
end