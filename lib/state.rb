class State < Country
    @@states = []
    @@all = []

    def initialize(attributes)
        super
    end

    def self.all
        @@states
    end
end