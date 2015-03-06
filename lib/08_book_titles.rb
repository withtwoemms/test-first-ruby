require 'csv'


class Book
    # TODO: your code goes here!

    attr_reader :articles, :conjunctions, :prepositions, :title, :uncapitalized_words

    #puts contents

    def initialize
    # does not work if CSV stuff not within initialize method
        contents = CSV.open('uncapitalized_words.csv',headers: true, header_converters: :symbol)

        @articles = []
        @conjunctions = []
        @prepositions = []

        contents.each {|row|
            @articles << row[:articles]
            @conjunctions << row[:conjunctions]
            @prepositions << row[:prepositions]
        }

        @articles = @articles.compact
        @conjunctions = @conjunctions.compact
        @prepositions = @prepositions.compact

        @uncapitalized_words = @articles + @conjunctions + @prepositions
    end
    
    def title=(title) 
        # arg of the "title" method...
        @title = titlize(title)
    end

    def titlize(title)
=begin
        @title = title.split(" ").each_with_index{|word, i|
            (@uncapitalized_words.include?(word) && i != 0) ? word : word.capitalize
        }
=end
        @title = title.split(" ").each_with_index{|word, i|
            if @uncapitalized_words.include?(word) && i != 0
                word
            else
                word.capitalize!
            end
        }
=begin
        @title = title.split(" ").each_with_index.map{|word, i| 
            word.capitalize 
            unless (
                (@articles.include?(word) && i != 0) || 
                (@conjunctions.include?(word) && i != 0) || 
                (@prepositions.include?(word) && i != 0)
            )
        }
=end
        #puts @title.join(" ")
        return @title.join(" ")
    end

    private :titlize 

    puts Book.inspect 
end
