def translate(word)
    word = word.downcase.split(" ")
    #phrase = phrase.downcase.split(" ")
    vowels = ["a","e","i","o","u"]
    alphabet = *"a".."z"

    if word.length == 1
        if (alphabet.include?(word[0][0]) && !vowels.include?(word[0][0])) && (alphabet.include?(word[0][1]) && !vowels.include?(word[0][1])) && (alphabet.include?(word[0][2]) && !vowels.include?(word[0][2]))
            word[0] = word[0] + word[0][0] + word[0][1] + word[0][2] + "ay"
            word[0] = word[0][3..-1] 
        elsif (alphabet.include?(word[0][0]) && !vowels.include?(word[0][0])) && (alphabet.include?(word[0][1]) && !vowels.include?(word[0][1]))            
                if word[0][1] == "q"
                    word[0] = word[0] + word[0][0] + word[0][1] + word[0][2] + "ay"
                    word[0] = word[0][3..-1] 
                elsif
                    word[0] = word[0] + word[0][0] + word[0][1] + "ay"
                    word[0] = word[0][2..-1] 
                end
        elsif (alphabet.include?(word[0][0]) && !vowels.include?(word[0][0])) # first char consonant
                if word[0][0] == "q"
                    word[0] = word[0] + word[0][0] + word[0][1] + "ay"
                    word[0] = word[0][2..-1]
                else 
                    #puts("is a consonant")
                    word[0] = word[0] << word[0][0] + "ay"
                    word[0] = word[0][1..-1] #word[0].delete(word[0][0]) # delete doesn't work
                end 
        elsif vowels.include?(word[0][0]) # first char is vowel
            word[0] << "ay"
        end
    elsif word.length > 1
        print("more than two words")
        i = 0
        while i < word.length
            if (alphabet.include?(word[i][0]) && !vowels.include?(word[i][0])) && (alphabet.include?(word[i][1]) && !vowels.include?(word[i][1])) && (alphabet.include?(word[i][2]) && !vowels.include?(word[i][2]))
                word[i] = word[i] + word[i][0] + word[i][1] + word[i][2] + "ay"
                word[i] = word[i][3..-1] 
            elsif (alphabet.include?(word[i][0]) && !vowels.include?(word[i][0])) && (alphabet.include?(word[i][1]) && !vowels.include?(word[i][1])) 
                if word[i][1] == "q"
                    word[i] = word[i] + word[i][0] + word[i][1] + word[i][2] + "ay"
                    word[i] = word[i][3..-1] 
                elsif
                    word[i] = word[i] + word[i][0] + word[i][1] + "ay"
                    word[i] = word[i][2..-1] 
                end
            elsif (alphabet.include?(word[i][0]) && !vowels.include?(word[i][0])) # first char consonant
                if word[i][0] == "q"
                    word[i] = word[i] + word[i][0] + word[i][1] + "ay"
                    word[i] = word[i][2..-1] 
                else 
                    #puts("is a consonant")
                    word[i] = word[i] << word[i][0] + "ay"
                    word[i] = word[i][1..-1] #word[0].delete(word[0][0]) # delete doesn't work
                end 
            elsif vowels.include?(word[i][0]) # first char is vowel
                word[i] = word[i] + "ay"
            end
            i += 1
        end
    end

    return word.join(" ") 
end

print(translate("banana") + "\n")
print(translate("eat pie") + "\n")
print(translate("three") + "\n")
print(translate("quiet") + "\n")
