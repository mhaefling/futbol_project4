require 'csv'

class StatTracker

    def self.from_csv(locations)
        team_stats = []
        location = locations[:teams]
        CSV.foreach(location, headers: true, header_converters: :symbol) do |row|
            require 'pry'; binding.pry
            new_stat = {
                team_id: row[:team_id].to_i,
                franchise_id: row[:franchise_id].to_i,
                team_name: row[:team_name],
                abbreviation: row[:abbreviation],
                stadium: row[:stadium],
                link: row[:link]
            }
        end
    end
end