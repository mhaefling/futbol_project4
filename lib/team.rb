class Team
    attr_reader :team_id,
                :name
                
    def initialize(team_id, name)
        @team_id = team_id
        @name = name
    end
end