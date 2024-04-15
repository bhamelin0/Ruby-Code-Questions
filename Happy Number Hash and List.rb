# @param {Integer} n
# @return {Boolean}
def is_happy(n)
    hashMap = Hash.new()
    
    while n != 1 do
        numArray = Array.new()

        # loop until n is fully parsed
        while n > 0 do
            lastDigit = n % 10
            numArray.push lastDigit
            n = (n - lastDigit) / 10
        end

        # calculate the new n
        n = 0
        numArray.each do |val|
            n = n + val*val
        end

        return false if hashMap[n]
        hashMap[n] = true
    end

    return true
end

# Parse out each digit into a list numList
# calculate newNumber by adding n*n for each list item
# add newNumber to hash; if already exists return false
# repeat until 1, then return true
