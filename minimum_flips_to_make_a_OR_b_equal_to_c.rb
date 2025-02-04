=begin
Given 3 positives numbers a, b and c. Return the minimum flips required in some bits of a and b to make ( a OR b == c ). (bitwise OR operation).
Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

Example 1:

Input: a = 2, b = 6, c = 5
Output: 3
Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)

Example 2:

Input: a = 4, b = 2, c = 7
Output: 1

Example 3:

Input: a = 1, b = 2, c = 3
Output: 0

Constraints:

1 <= a <= 10^9
1 <= b <= 10^9
1 <= c <= 10^9

=end

# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def min_flips(a, b, c)
  count = 0

  while ( a > 0 || b > 0 || c > 0)
      last_a = a & 1
      last_b = b & 1
      last_c = c & 1
      if last_c == 0
        count += last_a + last_b
      else
        count += 1 if last_a == 0 && last_b == 0
      end

      a = a >> 1
      b = b >> 1
      c = c >> 1
  end
  count
end
