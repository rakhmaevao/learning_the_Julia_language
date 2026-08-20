# ВНИМАНИЕ: эталонное решение (спойлер!) из JuliaCN/LeetCode.jl

using LeetKit.Support

function is_word_exist(board::Matrix{Char}, word::String)
    function _backtracking_search(board::Matrix{Char}, word::String, pos::CartesianIndex{2},
                                  depth::Int)::Bool
        depth > length(word) && return true
        (pos ∉ CartesianIndices(board) || board[pos] != word[depth]) && return false
        board[pos] += 256
        res = _backtracking_search(board, word, pos + CartesianIndex(1, 0), depth + 1) ||
              _backtracking_search(board, word, pos + CartesianIndex(-1, 0), depth + 1) ||
              _backtracking_search(board, word, pos + CartesianIndex(0, 1), depth + 1) ||
              _backtracking_search(board, word, pos + CartesianIndex(0, -1), depth + 1)
        board[pos] -= 256
        return res
    end
    for idx in CartesianIndices(board)
        _backtracking_search(board, word, idx, 1) && return true
    end
    return false
end
