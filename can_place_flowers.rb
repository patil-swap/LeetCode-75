=begin
You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.

Example 1:

Input: flowerbed = [1,0,0,0,1], n = 1
Output: true

Example 2:

Input: flowerbed = [1,0,0,0,1], n = 2
Output: false

Constraints:

1 <= flowerbed.length <= 2 * 104
flowerbed[i] is 0 or 1.
There are no two adjacent flowers in flowerbed.
0 <= n <= flowerbed.length

=end

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  return true if n == 0

  flowerbed.each_with_index do |place, index|
    next if place == 1
    left_is_empty = (index == 0 || flowerbed[index-1] == 0)
    right_is_empty = (index == flowerbed.size - 1 || flowerbed[index+1] == 0)
    if left_is_empty && right_is_empty
      flowerbed[index] = 1
      n -= 1
    end
    return true if n == 0
  end
  false
end
