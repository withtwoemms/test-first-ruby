module NumbersInWords
#TODO: REFACTOR!!

    TO_WORDS = {0=>"",1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",6=>"six",7=>"seven",8=>"eight",9=>"nine",10=>"ten",11=>"eleven",12=>"twelve",13=>"thirteen",14=>"fourteen",15=>"fifteen",16=>"sixteen",17=>"seventeen",18=>"eighteen",19=>"nineteen",20=>"twenty",30=>"thirty",40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",80=>"eighty",90=>"ninety"}

    POWERS_OF_TEN = {12=>"trillion",9=>"billion",6=>"million",3=>"thousand",2=>"hundred"}


    ONES = 0..9
    TENS = 10..99
    HUNDREDS = 100..999
    THOUSANDS = 1_000..999_999
    MILLIONS = 1_000_000..999_999_999
    BILLIONS = 1_000_000_000..999_999_999_999
    TRILLIONS = 1_000_000_000_000..999_999_999_999_999

    
    def in_words
        case self
        when ONES
            ones(self)
        when TENS
            tens(self)
        when HUNDREDS
            hundreds(self)
        when THOUSANDS
            thousands(self)
        when MILLIONS
            millions(self)
        when BILLIONS
            billions(self)
        when TRILLIONS
            trillions(self)
        end
    end

    def ones(num)
        if num == 0 && self == 0
            return "zero"
        elsif ONES.include?(num)
            return TO_WORDS[num]
        else
            raise "Fixnum out of ONES range"
        end
    end

    def tens(num)
        if TENS.include?(num)
            if TO_WORDS.include?(num)
                return TO_WORDS[num]
            else
                num_tens = num / 10 * 10
                num_ones = num % 10
                return "#{tens(num_tens)} #{ones(num_ones)}" 
            end 
        else
            raise "Fixnum out of TENS range"
        end
    end

    def hundreds(num)
        if HUNDREDS.include?(num)
            num_hundreds = num / 100 
            num_tens = num - num_hundreds * 100 
                if num_tens < 10 # may cause issue for negative numbers
                    num_tens = 0
                end
            num_ones = num % 10
            if num_tens == 0
                return "#{TO_WORDS[num_hundreds]} #{POWERS_OF_TEN[2]} #{ones(num_ones)}".strip
            else
                return "#{TO_WORDS[num_hundreds]} #{POWERS_OF_TEN[2]} #{tens(num_tens)}".strip
            end
        else
            return "" #raise "Fixnum out of HUNDREDS range"
        end
    end


    def thousands(num)
        num_word = []
        num_array = self.to_s.split("").map{|num| num.to_i}

        place_flag = 0
        while num_array.length > 0
            chunk = num_array.pop(3).join.to_i
            if place_flag == 0
                case chunk
                when ONES
                    num_word.unshift(ones(chunk))
                when TENS
                    num_word.unshift(tens(chunk))
                when HUNDREDS
                    num_word.unshift(hundreds(chunk))
                end
            elsif place_flag == 1
                thousands = chunk
                case thousands
                when ONES
                    num_word.unshift("#{ones(thousands)} #{POWERS_OF_TEN[3]}")
                when TENS
                    num_word.unshift("#{tens(thousands)} #{POWERS_OF_TEN[3]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(thousands)} #{POWERS_OF_TEN[3]}")
                end
            end
            place_flag += 1
        end
        
        return num_word.join(" ").strip
    end
    
    def millions(num)
        num_word = []
        num_array = self.to_s.split("").map{|num| num.to_i}

        place_flag = 0
        while num_array.length != 0
            chunk = num_array.pop(3).join.to_i
            if place_flag == 0
                case chunk
                when ONES
                    num_word.unshift(ones(chunk))
                when TENS
                    num_word.unshift(tens(chunk))
                when HUNDREDS
                    num_word.unshift(hundreds(chunk))
                end
            elsif place_flag == 1 && chunk != 0
                case chunk
                when ONES
                    num_word.unshift("#{ones(chunk)} #{POWERS_OF_TEN[3]}")
                when TENS
                    num_word.unshift("#{tens(chunk)} #{POWERS_OF_TEN[3]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(chunk)} #{POWERS_OF_TEN[3]}")
                end
            elsif place_flag == 2
                millions = chunk
                case millions
                when ONES
                    num_word.unshift("#{ones(millions)} #{POWERS_OF_TEN[6]}")
                when TENS
                    num_word.unshift("#{tens(millions)} #{POWERS_OF_TEN[6]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(millions)} #{POWERS_OF_TEN[6]}")
                end
            end
            place_flag += 1
        end


        return num_word.join(" ").strip
    end
    
    def billions(num)
        num_word = []
        num_array = self.to_s.split("").map{|num| num.to_i}

        place_flag = 0
        while num_array.length != 0
            chunk = num_array.pop(3).join.to_i
            if place_flag == 0
                case chunk
                when ONES
                    num_word.unshift(ones(chunk))
                when TENS
                    num_word.unshift(tens(chunk))
                when HUNDREDS
                    num_word.unshift(hundreds(chunk))
                end
            elsif place_flag == 1
                case chunk
                when ONES
                    num_word.unshift("#{ones(chunk)} #{POWERS_OF_TEN[3]}")
                when TENS
                    num_word.unshift("#{tens(chunk)} #{POWERS_OF_TEN[3]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(chunk)} #{POWERS_OF_TEN[3]}")
                end
            elsif place_flag == 2
                millions = chunk
                case millions
                when ONES
                    p "one mil"
                    num_word.unshift("#{ones(millions)} #{POWERS_OF_TEN[6]}")
                when TENS
                    num_word.unshift("#{tens(millions)} #{POWERS_OF_TEN[6]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(millions)} #{POWERS_OF_TEN[6]}")
                end
            elsif place_flag == 3
                billions = chunk
                case billions
                when ONES
                    num_word.unshift("#{ones(billions)} #{POWERS_OF_TEN[9]}")
                when TENS
                    num_word.unshift("#{tens(billions)} #{POWERS_OF_TEN[9]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(billions)} #{POWERS_OF_TEN[9]}")
                end
            end
            place_flag += 1
        end

        return num_word.join(" ").strip
    end

    def trillions(num)
        num_word = []
        num_array = self.to_s.split("").map{|num| num.to_i}

        place_flag = 0
        while num_array.length != 0
            chunk = num_array.pop(3).join.to_i
            if place_flag == 0
                case chunk
                when ONES
                    num_word.unshift(ones(chunk))
                when TENS
                    num_word.unshift(tens(chunk))
                when HUNDREDS
                    num_word.unshift(hundreds(chunk))
                end
            elsif place_flag == 1 && chunk != 0
                case chunk
                when ONES
                    num_word.unshift("#{ones(chunk)} #{POWERS_OF_TEN[3]}")
                when TENS
                    num_word.unshift("#{tens(chunk)} #{POWERS_OF_TEN[3]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(chunk)} #{POWERS_OF_TEN[3]}")
                end
            elsif place_flag == 2 && chunk != 0
                millions = chunk
                case millions
                when ONES
                    num_word.unshift("#{ones(millions)} #{POWERS_OF_TEN[6]}")
                when TENS
                    num_word.unshift("#{tens(millions)} #{POWERS_OF_TEN[6]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(millions)} #{POWERS_OF_TEN[6]}")
                end
            elsif place_flag == 3 && chunk != 0
                billions = chunk
                case billions
                when ONES
                    num_word.unshift("#{ones(billions)} #{POWERS_OF_TEN[9]}")
                when TENS
                    num_word.unshift("#{tens(billions)} #{POWERS_OF_TEN[9]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(billions)} #{POWERS_OF_TEN[9]}")
                end
            elsif place_flag == 4 && chunk != 0
                trillions = chunk
                case trillions
                when ONES
                    num_word.unshift("#{ones(trillions)} #{POWERS_OF_TEN[12]}")
                when TENS
                    num_word.unshift("#{tens(trillions)} #{POWERS_OF_TEN[12]}")
                when HUNDREDS
                    num_word.unshift("#{hundreds(trillions)} #{POWERS_OF_TEN[12]}")
                end
            end
            place_flag += 1
        end

        return num_word.join(" ").strip
    end

end

class Fixnum
    include NumbersInWords
end

class Bignum
    include NumbersInWords
end
