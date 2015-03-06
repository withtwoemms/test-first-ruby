def add(num1, num2)
    return num1 + num2
end
##########
def subtract(num1, num2)
    return num1 - num2
end
##########
def sum(array)
    sum = 0
    i = 0
    while i < array.length
        sum += array[i]
        i += 1
    end

    return sum
end
##########
def multiply(array)
    product = 1
    i = 0
    while i < array.length
        product *= array[i] 
        i += 1 
    end

    return product
end
##########
def power(num1, num2)
    return num1 ** num2
end
##########
def factorial(num)
    factorial = 1

    if num == 0 || num == 1
        return factorial
    end

    while num >= 2 
         
        factorial *= num
        num -= 1
    end

    return factorial
end
