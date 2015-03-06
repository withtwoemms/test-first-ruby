class RPNCalculator
    # TODO: Improvements I'd like to make...

    attr_reader :pair, :stack, :total

    def initialize
        @stack = []
        @total = 0.
    end

    def push(num)
        @stack << num
    end

    def plus
        if @stack.length >= 2
            pair = @stack.last(2)
            sum = pair.first + pair.last
            @total += sum
            @stack.pop(pair.length)
            return sum
#=begin
        elsif @stack.length == 1
            @total += @stack[0]            
            @stack.pop(1)
            return @total 
#=end
        elsif @stack.length == 0
            @last_total = @total
            raise "calculator is empty"
        end
    end

    def minus
        if @stack.length >= 2 
            pair = @stack.last(2)
            dif = pair.first - pair.last 
            @total += dif
            @stack.pop(pair.length)
            return @total
#=begin
        elsif @stack.length == 1
            @total -= @stack[0]
            @stack.pop(1)
            return @total
#=end
        elsif @stack.length == 0
            raise "calculator is empty"
        end
    end 

    def times
        if @stack.length >= 2 
            pair = @stack.last(2)
            prod = pair.first * pair.last 
            @total += prod
            @stack.pop(pair.length)
            return @total
#=begin
        elsif @stack.length == 1
            @total *= @stack[0]
            @stack.pop(1)
            return @total
#=end
        elsif @stack.length == 0
            raise "calculator is empty"
        end
    end 

    def divide
        if @stack.length >= 2 
            pair = @stack.last(2)
            div = pair.first.to_f / pair.last 
            @total += div
            @stack.pop(pair.length)
            return @total
#=begin
        elsif @stack.length == 1
            @total /= @stack[0]
            @stack.pop(1)
            return @total
#=end
        elsif @stack.length == 0
            raise "calculator is empty"
        end
    end

    def tokens(string)
        tokens = string.split(" ").map{|char|
            if char.match(/[0-9]+/) != nil # if char is a number..
                char.to_i
            else
                char.to_sym
            end
        }

        return tokens
    end

    def evaluate(string)
        @total = 0
        @stack = []
    
        return string.to_f unless string.include?(" ")

        string.match(/(-?\d) (-?\d) ([-+*\/])(?!\d)/) # adding "-?" to the regex on digits was important to the last test case: "1 2 3 * + 4 5 - /"
        $3 == "/" ? 
            result = $1.to_f.send($3, $2.to_f) 
            : 
            result = $1.to_i.send($3, $2.to_i)
        string.gsub!([$1,$2,$3].join(" "), result.to_s)

        evaluate(string)

    end 

    def value
        @total
    end

    puts self.inspect + " has been loaded..."
end
