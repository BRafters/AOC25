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

    counter_one, counter_two := compute(lines)
    fmt.println("Result Part One", counter_one)
    fmt.println("Result Part Two", counter_two)
}

// Processes the computations
compute :: proc(algs : []string) -> (int, int) {
    // Will need something to calculate any sort of residual value
    dial := start
    counter_part_one := 0
    counter_part_two := 0
    temp: int

    // Pull out an algorithm (via loop)
    for i := 0; i < len(algs); i += 1 {
        dial, temp = process_alg(dial, algs[i])

        counter_part_two += temp
        if dial == default {
            counter_part_one += 1
        }
    }

    counter_part_two += counter_part_one
    return counter_part_one, counter_part_two
}

process_alg :: proc(dial: int, alg: string) -> (int, int) {
    char := strings.cut(alg, 0, 1)
    num, worked := strconv.parse_int(strings.cut(alg, 1, len(alg)))
    pre_result: int
    result: int
    counter := num / 100

    // If any num over 100, we'll divide by 100. The int result will be the initial rotations
    modded_num := num % 100

    if char == "R" {
        pre_result = dial + modded_num
    } else if char == "L" {
        pre_result = dial - modded_num
    }

    // If we started on 0, we don't count the rotation
    if dial != 0 && pre_result < 0 || pre_result > 100 {
        counter += 1
    }

    if pre_result > 99 {
        // We know we made a rotation here when we past 0. 1 + init_rotations
        result = pre_result % 100
    } else if pre_result < 0 {
        // If pre_result is less than zero, we can simply just add the negative value to 100
        result = pre_result + 100
    } else {
        result = pre_result
    }

    return result, counter
}

// "Due to newer security protocols, please use password 'method 0x434C49434B' until further notice."
// 'method 0x434C49434B' means you're supposed to count the number of times the dial points at 0