def measure(how_many=1) 
    start_time = Time.now

    how_many.times{|i|
        print "."
        yield    
    }
    end_time = Time.now

    elapsed = end_time - start_time

    if how_many == 1  
        return elapsed
    else
        return elapsed / how_many
    end
end
