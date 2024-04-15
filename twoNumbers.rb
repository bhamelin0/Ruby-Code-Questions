# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}


def add_two_numbers(l1, l2)
    carry = 0
    result = 0
    resultNodes = nil
    currentNode = nil
    while l1 != nil || l2 != nil do
        val = (l1 ? l1.val : 0) + (l2 ? l2.val : 0) + carry
        carry = val >= 10 ? 1 : 0
        val = val % 10

        newNode = ListNode.new(val)
        currentNode != nil ? currentNode.next = newNode : resultNodes = newNode
        currentNode = newNode

        if l1 then l1 = l1.next end
        if l2 then l2 = l2.next end
    end

    if carry > 0 then currentNode.next = ListNode.new(carry) end

    return resultNodes
end



# 
# 4
#------
# [7][0][8]

# [7][0][3][1]
# Add the current list items together and continue if < 10
# If > 10, store in carry integer and add it to next item
# At the end, if carry integer, append to end of list

# substitute 0 if we reached the end of one of the lists