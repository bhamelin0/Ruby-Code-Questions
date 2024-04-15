# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    rightLine = height.length - 1

    tallestLeft = 0
    tallestRight = height.length - 1
    tallestValue = area(tallestLeft, tallestRight, height)

    height.each_with_index do |leftLine, leftIndex|
        (rightLine).downto(0) do |rightIndex|

            if (height[rightIndex] - (rightIndex - rightLine)) > height[rightLine]
                rightLine = rightIndex
            end

            newValue = area(leftIndex, rightIndex, height)

            if (rightIndex - leftIndex) * height[leftIndex] <= tallestValue
                break
            end

            if newValue > tallestValue
                tallestValue = newValue
            elsif height[leftIndex] <= height[rightIndex]
                break
            end
        end
    end

    return tallestValue
end

# returns the value of a given area
def area(leftIndex, rightIndex, height)
    width = rightIndex - leftIndex
    h = height[leftIndex] < height[rightIndex] ? height[leftIndex] : height[rightIndex]

    return width * h
end

=begin
    Working from end first, can stop if we find a line equal to or greater than us for max value
    When a self or greater line height * length is less than a value we found, we can stop early
=end
