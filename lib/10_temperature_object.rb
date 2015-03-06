class Temperature
  # TODO: your code goes here!
   
    def initialize(options={})
        @temperature = options
        if options == {}
            return "Hash input need---i.e. :f => 50" # never prints...
        end
    end

    class << self
        def from_fahrenheit(ftemp)
            @temperature = {:f => ftemp}
            return Temperature.new(@temperature)
        end

        def from_celsius(ctemp)
            @temperature = {:c => ctemp}
            return Temperature.new(@temperature)
        end 
    end
 
    def in_fahrenheit #use "optional hashes"
        if @temperature.keys[0] == :f
            return @temperature[:f]
        else 
            return @temperature[:c] * 9.0 / 5 + 32
        end
    end

    def in_celsius #use "optional hashes"
        if @temperature.keys[0] == :c
            return @temperature[:c]
        else
            return (@temperature[:f] - 32) * 5 / 9 
        end
    end


    puts self.inspect + " class loaded..."
    puts "available methods include: #{:in_fahrenheit}, #{:in_celsius}"
end



class Celsius < Temperature
    def initialize(ctemp)
        @temperature = {:c => ctemp}
    end
end

class Fahrenheit < Temperature
    def initialize(ftemp)
        @temperature = {:f => ftemp}
    end
end
