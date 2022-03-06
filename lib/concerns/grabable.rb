module Grabable
    module Store
        def save
            self.class.all << self
        end
    end
end