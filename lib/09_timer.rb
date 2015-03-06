class Timer 
    attr_reader :seconds

    def initialize
        @seconds = 0
        
        @secs2mins = 60
        @mins2hour = 60
    end

    def seconds=(seconds)
        @seconds = seconds
    end 
    
    def time_string
        secs = @seconds % @secs2mins
        mins = @seconds / @secs2mins % @secs2mins 
        hours = @seconds / @secs2mins / @mins2hour

        time = "#{sprintf('%02d',hours)}:#{sprintf('%02d',mins)}:#{sprintf('%02d',secs)}"
    end

    puts self.inspect + " class loaded..."
    puts "new methods available: #{:seconds}, #{:time_string}"
end
