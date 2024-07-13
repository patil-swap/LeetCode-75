=begin
Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.

Example 1:

Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]

Example 2:

Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]

Example 3:

Input: temperatures = [30,60,90]
Output: [1,1,0]

Constraints:

1 <= temperatures.length <= 105
30 <= temperatures[i] <= 100

=end

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  temperatures_index = 1
  stack = [0]
  while temperatures_index < temperatures.size
    while stack.size > 0 and temperatures[stack[-1]] < temperatures[temperatures_index]
      popped_index = stack.pop
      temperatures[popped_index] = temperatures_index - popped_index
    end

    stack << temperatures_index
    temperatures_index = temperatures_index +1
  end
  stack.each { |index| temperatures[index] = 0 }
  temperatures
end
