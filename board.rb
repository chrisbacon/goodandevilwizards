class Board

    attr_reader :size, :tiles
    def initialize(size)
        @size = size
        @tiles = {}
        counter = 0
        while counter < 100
            @tiles[counter] = nil
            counter +=1
        end
    end

    def add_wizards_to_board(wizards)
        for wizard in wizards
            @tiles[wizard.position] = wizard
        end
    end
end
