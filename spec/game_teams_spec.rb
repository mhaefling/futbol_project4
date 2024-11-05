require './spec/spec_helper'

RSpec.describe GameTeams do
  before(:each) do
    @game_teams = GameTeams.new(2012030221, {team_id: 3, hoa: "away", results: "loss", head_coach: "John Tortorella", goals: 2, shots: 8, tackles: 44})
  end

  describe "#initialize" do 
    it 'exists' do
      expect(@game_teams).to be_a(GameTeams)
    end

    it 'has readable attributes' do
      expect(@game_teams.team_id).to eq(3)
      expect(@game_teams.hoa).to eq("away")
      expect(@game_teams.results).to eq("loss")
      expect(@game_teams.head_coach).to eq("John Tortorella")
      expect(@game_teams.goals).to eq(2)
      expect(@game_teams.shots).to eq(8)
      expect(@game_teams.tackles).to eq(44)
    end
  end
end