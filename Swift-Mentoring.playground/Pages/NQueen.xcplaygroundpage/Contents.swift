//: [Previous](@previous)

import Foundation

// Board is N x N and we need to place N queen such that they
// don't attack each other.
func NQueen(board: [[Int]], queenNumber: Int) -> Int {
    // Base condition
    if queenNumber == board.count {
        print(board: board)
        return 1
    }
    
    var count = 0
    loop: for column in 0 ..< board.count {
        for row in 0 ..< queenNumber {
            let lastQueenColumn = board[row].firstIndex(of: 1) ?? 0
            if lastQueenColumn == column {
                continue loop
            }
            
            let rowDiffernce = queenNumber - row
            let columnDifference = lastQueenColumn - column
            
            if abs(rowDiffernce) == abs(columnDifference) {
                continue loop
            }
        }
        
        var boardCopy = board
        boardCopy[queenNumber][column] = 1
        
        count += NQueen(board: boardCopy, queenNumber: queenNumber + 1)
    }
    
    return count
}

private func print(board: [[Int]]) {
    let size = board.count
    
    for column in 0 ..< size {
        for row in 0 ..< size {
            let text = board[row][column] == 1 ? "Q" : "."
            print(text, terminator: " ")
        }
        
        print("")
    }
    
    print("")
}

let N = 5
var board = Array(repeating: Array(repeating: 0, count: N), count: N)
let count = NQueen(board: board, queenNumber: 0)
print("Count = \(count)")

//: [Next](@next)
