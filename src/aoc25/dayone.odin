package aoc25

import "core:fmt"
import "core:strings"
import "core:strconv"
import "utils"

// Where the dial starts
start : int : 50
default : int : 0

// Handles the meh stuff
main :: proc() {
    ok, lines := utils.parse_lines_to_arr("data/dayonecontent.txt")

    if !ok {
        fmt.println("Failed to parse file")
    }

    fmt.println("Result ", compute(lines))
}

// Processes the computations
compute :: proc(algs : []string) -> int {
    // Will need something to calculate any sort of residual value
    dial := start
    counter := 0

    // Pull out an algorithm (via loop)
    for i := 0; i < len(algs); i += 1 {
        dial = process_alg(dial, algs[i])

        if dial == default {
            counter += 1
        }
    }

    return counter
}

process_alg :: proc(dial: int, alg: string) -> int {
    char := strings.cut(alg, 0, 1)
    num, worked := strconv.parse_int(strings.cut(alg, 1, len(alg)))
    num %= 100
    pre_result: int
    result: int

    // Right ++
    // Left --
    if char == "R" {
        pre_result = dial + num
    } else if char == "L" {
        pre_result = dial - num
    }

    // If the value is greater than 99, take the pre_result and mod it by 100
    if pre_result > 99 {
        result = pre_result % 100
    } else if pre_result < 0 {
        // If pre_result is less than zero, we can simply just add the negative value to 100
        result = 100 + pre_result
    } else {
        result = pre_result
    }

    return result
}

/* "Due to new security protocols,
the password is locked in the safe below.
Please see the attached document for the new combination."
*/

// 0 - 99 safe combination lock
// Sequence of rotations, one per line
    // Rotation starts with L or R
    // Rotation has a distance value which indicates how many clicks the dial should be rotated
    // starting from 11, R8 == 19, then L19 would equal 0
// The password is the number of times the dial is left pointing at 0 after any rotation in the sequence
// Dial starts at 50