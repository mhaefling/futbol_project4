require './spec/spec_helper'

RSpec.describe Team do
  before(:each) do
    @team = Team.new(1, "Atlanta United")
  end

  describe "#initialize" do
    it 'exists' do
      expect(@team).to be_a(Team)
    end

    it 'has a team_id' do
      expect(@team.team_id).to eq(1)
    end

    it 'has a name' do
      expect(@team.name).to eq("Atlanta United")
    end
  end
end