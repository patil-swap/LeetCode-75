=begin
You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.

Notice that you may not slant the container.

Example 1:

Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

Example 2:

Input: height = [1,1]
Output: 1

Constraints:

n == height.length
2 <= n <= 105
0 <= height[i] <= 104
=end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  max_area = 0
  left_window_index = 0
  right_window_index = height.size - 1
  while left_window_index != right_window_index
    width = right_window_index - left_window_index
    left_height = height[left_window_index]
    right_height = height[right_window_index]
    if right_height <  left_height
      min_height = right_height
      right_window_index = right_window_index - 1
    else
      min_height = left_height
      left_window_index = left_window_index + 1
    end
    area = width * min_height
    max_area = area if area > max_area
  end
  max_area
end
