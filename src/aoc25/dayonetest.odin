package aoc25

import "core:testing"
import "core:fmt"
import "core:strings"
import "core:strconv"

dataset := []string {"L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82"}

@(test)
test_part_one :: proc(t: ^testing.T) {
    expected_result_part_one :: 3
    buf_one: [size_of(expected_result_part_one)]byte

    res_part_one, res_part_two := compute(dataset)

    fmt.println("Result Part One: ", res_part_one)
    testing.expect(t, res_part_one == expected_result_part_one, strings.concatenate([]string{"Should be ", strconv.write_int(buf_one[:], expected_result_part_one, 10)}))
}

@(test)
test_part_two :: proc(t: ^testing.T) {
    expected_result_part_two :: 6
    buf_two: [size_of(expected_result_part_two)]byte

    res_part_one, res_part_two := compute(dataset)

    fmt.println("Result Part Two: ", res_part_two)
    testing.expect(t, res_part_two == expected_result_part_two, strings.concatenate([]string{"Should be ", strconv.write_int(buf_two[:], expected_result_part_two, 10)}))
}