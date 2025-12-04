package utils

import "core:os"
import "core:strings"
import "core:fmt"

parse_lines_to_arr :: proc(file: string) -> (bool, []string) {
    data, ok := os.read_entire_file_from_filename(file)

    if !ok {
        fmt.eprintln("Failed to load file ", file)
        return false, nil
    }

    // Taking bytes and converting to string
    file_contents := string(data)

    // Split by \r\n
    lines : []string = strings.split(file_contents, "\r\n")

    fmt.println(lines)
    return true, lines
}