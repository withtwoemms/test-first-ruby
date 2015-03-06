class Array
    # TODO: 
    #   > need [arr].sum instead of Array.new.sum([arr])

    attr_reader :total

    def sum(array=[])
        @total = 0
        self.each{|num|
            @total += num
        }
        return @total
    end

    def square(array=[])
        arr = []
        self.each{|num|
            arr << num * num
        } 
        return arr
    end

    def square!(array=[])
        self.map!{|num|
            num * num
        } 
    end

    puts self.inspect + " class is loaded..."
    puts "available methods: #{:sum}, #{:square}, #{:square!}"
end
