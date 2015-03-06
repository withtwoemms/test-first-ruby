def reverser
    result = yield.split(/\b/).map{|word| word.reverse}.join
    return result
end

reverser {"hello"}
reverser {%{hello dolly}}


def adder(num=1)
    yield + 1 * num
end

adder {1}


def repeater(num=1)
    block_was_executed = block_given?
    n = 0
    while n < num
        yield
        n += 1 
    end
    block_was_executed
end
