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
        if @fixed == true
            return false
        else
            @value = value
        end
    end

end