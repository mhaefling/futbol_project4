require './spec/spec_helper'

RSpec.describe StatTracker do
    describe '#instantiate' do
        it 'is a StatTracker' do
            stat_tracker = StatTracker.new

            expect(state_tracker).to be_a(StatTracker)
        end
    end

    describe '#from_csv' do
        it 'pulls in all the csv data' do
            team_path = './data/teams.csv'

            locations = {
            teams: team_path
            }

            stat_tracker = StatTracker.from_csv(locations)
            
            expect(stat_tracker.count).to eq(32)
            first = stat_tracker.first

            expect(first.team_id).to eq(1)
            expect(first.franchise_id).to eq(23)
            expect(first.team_name).to eq("Atlanta United")
            expect(first.abbreviation).to eq("ATL")
            expect(first.stadium).to eq("Mercedes-Benz Stadium")
            expect(first.link).to eq("/api/v1/teams/1")
        end
    end
end