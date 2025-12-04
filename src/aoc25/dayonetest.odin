package aoc25

import "core:testing"
import "core:fmt"

dataset := []string {"L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82"}

@(test)
test_initial_dataset :: proc(t: ^testing.T) {
    res := compute(dataset)
    fmt.println("Result: ", res)
    testing.expect(t, res == 3, "Should be 3")
}