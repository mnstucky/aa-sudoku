class Tile

attr_reader :fixed, :value

    def initialize(value)
        @value = value
        if value == 0
            @fixed = false
        else
            @fixed = true
        end
    end

    def edit(value)
        @value = value
    end

    def valid_move?
        return false if @fixed == true
        true
    end

end