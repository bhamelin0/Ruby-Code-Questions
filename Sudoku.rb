# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  square_size = 3

  board.each do |row|
      return false if !is_valid_row(row)
  end

  board.length.times do |index|
      return false if !is_valid_col(board, index)
  end

  square_size.times do |x|
      square_size.times do |y|
          return false if !is_valid_square(board, x*square_size, y*square_size,  square_size)
      end
  end

  return true
end

def is_valid_row(row)
  return false if !validateArrStrings(row)
  row = row.select do |val|
      val != "."
  end
  return row.uniq.length == row.length
end

def is_valid_col(board, index_col)
  colArr = Array.new(board.length)
  colArr.length.times do |index|
      colArr[index] = board[index][index_col]
  end

  return false if !validateArrStrings(colArr)
  colArr = colArr.select do |val|
      val != "."
  end

  return colArr.uniq.length == colArr.length
end

def is_valid_square(board, top_left_x, top_left_y, square_size)
  squareArr = Array.new(board.length)
  arrIndex = 0
  square_size.times do |x|
      square_size.times do |y|
          squareArr[arrIndex] = board[top_left_y + y][top_left_x + x]
          arrIndex = arrIndex + 1
      end
  end

  return false if !validateArrStrings(squareArr)
  squareArr = squareArr.select do |val|
      val != "."
  end
  return squareArr.uniq.length == squareArr.length
end

def string_is_valid(string)
  val = string.to_i
  return val > 0 && val < 10 || string == "."
end

def validateArrStrings(arr)
  arr.each do |val|
      return false if !string_is_valid(val)
  end
end


board = [[".",".","4",".",".",".","6","3","."],[".",".",".",".",".",".",".",".","."],["5",".",".",".",".",".",".","9","."],[".",".",".","5","6",".",".",".","."],["4",".","3",".",".",".",".",".","1"],[".",".",".","7",".",".",".",".","."],[".",".",".","5",".",".",".",".","."],[".",".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".",".","."]]
puts is_valid_sudoku(board)
