package aoc25

import "core:fmt"
import "core:strings"
import "core:strconv"

// Where the dial starts
start : int : 50
default : int : 0

// Handles the meh stuff
main :: proc() {
    str: [dynamic]string
    append(&str, "L68")
    append(&str, "L30")
    append(&str, "R48")
    compute(str)
}

// Processes the computations
compute :: proc(algs : [dynamic]string) -> int {
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
    residual: int
    result: int

    // Right ++
    // Left --
    if char == "R" {
        residual = dial + num
    } else if char == "L" {
        residual = dial - num
    }

    if residual < 0 {
        result = 100 - (residual * -1)
    }
    else if residual > 99 {
        result = 0 + (residual % 100)
    }
    else {
        result = residual
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