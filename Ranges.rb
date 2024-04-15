# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
    sequenceArr = Array.new()
    x = 0
    while x < nums.length do
        startNum = nums[x]
        x+=1
        endNum = startNum

        while x < nums.length do
            break if endNum + 1 != nums[x]
            endNum = nums [x]
            x+=1
        end
        sequenceArr.push("#{startNum}#{startNum != endNum ? "->#{endNum}" : ""}")
    end

    return sequenceArr
end

# mark start number if > 0
# Loop for each element in nums
    # If sequence breaks: 
        #write down number before break 
        #create new string to store new number


# Loop while X < nums length
    #mark start sequence number, x++
    #Loop until sequence breaks:
        #mark second number so far, x++
    #create a string for the sequence and add to the array

