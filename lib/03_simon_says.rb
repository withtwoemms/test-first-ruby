def echo(phrase)
    phrase
end
##########
def shout(phrase)
    phrase.upcase
end
##########
def repeat(phrase, *num)
    if num.empty?
        return phrase + " " + phrase
    else
        container = []
        i = 0
        while i < num[0]
            container << phrase
            i += 1
        end
    
        return container.join(" ")
    end
end
##########
def start_of_word(word, num)
   return word[0..num - 1]
end
##########
def first_word(phrase)
    return phrase.split(" ")[0]
end
##########
def titleize(phrase)
    phrase = phrase.split(" ")

    little_words = "a,an,the,at,by,for,in,of,on,to,up,and,as,but,it,or,nor,over".split(",")

    i = 0
    while i < phrase.length
        phrase[i][0] = phrase[i][0].upcase unless little_words.include?(phrase[i]) && phrase[i][0] != phrase[0][0]
        i += 1
    end

    return phrase.join(" ")
end
