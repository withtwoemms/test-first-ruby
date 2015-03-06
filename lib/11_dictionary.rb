class Dictionary
  # TODO: your code goes here!

    attr_reader :entries, :keywords

    def initialize
        @entries = {}
    end

    def entries
        @entries ||= {} 
    end

    def printable
        print_out = []
        i = 0
        while i < @entries.length
            print_out << "[#{self.keywords[i]}] \"#{@entries[self.keywords[i]]}\""
            i += 1
        end
        return print_out.join("\n")
    end

    def clear_all_entries
        @entries = {}
    end

    def keywords
        return self.entries.keys.sort
    end

    def add(word_definition)
        case word_definition
            when Hash then @entries.merge!(word_definition)
            when String then @entries[word_definition] = nil
        end
    end

    def include?(word)
        if @entries.keys.include?(word)
            return true
        else
            return false
        end
    end

    def find(pattern)
        regx = Regexp.new(pattern)

            found = self.entries.select{|word|
                word =~ regx
            } 
            return found
    end

    puts self.class.to_s + " has been loaded..."
        
    # FIX ME!!!
    #puts "methods available: " + %w(#{:add} #{:find} #{:include?} #{:keywords} #{:printable} #{:clear_all_entries} #{:entries})
end
