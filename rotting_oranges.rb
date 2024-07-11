=begin
You are given an m x n grid where each cell can have one of three values:

0 representing an empty cell,
1 representing a fresh orange, or
2 representing a rotten orange.

Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

Example 1:

Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
Output: 4

Example 2:

Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
Output: -1
Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.

Example 3:

Input: grid = [[0,2]]
Output: 0
Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.

Constraints:

m == grid.length
n == grid[i].length
1 <= m, n <= 10
grid[i][j] is 0, 1, or 2.

=end
# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  time = 0
  fresh = 0
  rows = grid.length
  cols = grid[0].length
  queue = []

  (0...rows).each do |r|
    (0...cols).each do |c|
      fresh += 1 if grid[r][c] == 1
      queue << [r, c] if grid[r][c] == 2
    end
  end

  directions = [[0,1], [0, -1], [1,0],[-1,0]]

  while !queue.empty? && fresh > 0
    (0...queue.length).each do |i|
      r, c = queue.shift
      directions.each do |dr, dc|
        row = dr + r
        col = dc + c
        next if row < 0|| row == rows || col < 0 || col == cols || grid[row][col] != 1

        grid[row][col] = 2
        queue << [row, col]
        fresh -= 1
      end
    end
    time += 1
  end
  fresh == 0 ? time : -1
end
