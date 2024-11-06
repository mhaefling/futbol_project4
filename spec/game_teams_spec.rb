require './spec/spec_helper'

RSpec.describe GameTeams do
  before(:each) do
    @game_teams = GameTeams.new(2012030221, 3, "away", "loss", "John Tortorella", 2, 8, 44)
  end

  describe "#initialize" do 
    it 'exists' do
      expect(@game_teams).to be_a(GameTeams)
    end

    it 'has readable attributes' do
      expect(@game_teams.team_id).to eq(3)
      expect(@game_teams.hoa).to eq("away")
      expect(@game_teams.result).to eq("loss")
      expect(@game_teams.head_coach).to eq("John Tortorella")
      expect(@game_teams.goals).to eq(2)
      expect(@game_teams.shots).to eq(8)
      expect(@game_teams.tackles).to eq(44)
    end
  end
end