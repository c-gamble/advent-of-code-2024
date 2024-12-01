#!/bin/bash

# Source .env file if it exists
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
else 
    echo "Please create a .env file with AOC_COOKIE and BASE_PATH"
    exit 1
fi

# Check if -d parameter is provided
while getopts "d:" opt; do
  case $opt in
    d) day="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac
done

if [ -z "$day" ]; then
  echo "Please provide a day number using -d option"
  exit 1
fi

# Check if AOC_COOKIE environment variable exists
if [ -z "$AOC_COOKIE" ]; then
  echo "Please set AOC_COOKIE in .env file"
  exit 1
fi

if [ -z "$BASE_PATH" ]; then
  echo "Please set BASE_PATH in .env file"
  exit 1
fi

# Create necessary directories
mkdir -p "${BASE_PATH}/inputs/day${day}"
mkdir -p "${BASE_PATH}/python/day${day}"
mkdir -p "${BASE_PATH}/cpp/day${day}"

# Create Rust day package if it doesn't exist
if [ ! -d "${BASE_PATH}/rust/day${day}" ]; then
    mkdir -p "${BASE_PATH}/rust/day${day}/src/bin"
    
    # Create Cargo.toml for the day
    cat > "${BASE_PATH}/rust/day${day}/Cargo.toml" << EOF
[package]
name = "day${day}"
version.workspace = true
edition.workspace = true

[[bin]]
name = "part1"
path = "src/bin/part1.rs"

[[bin]]
name = "part2"
path = "src/bin/part2.rs"

[dependencies]
# Add day-specific dependencies here
EOF
fi

# Download input using curl
curl -s "https://adventofcode.com/2024/day/${day}/input" \
  -H "Cookie: session=${AOC_COOKIE}" \
  -o "${BASE_PATH}/inputs/day${day}/real.in"

# Create empty test input file
touch "${BASE_PATH}/inputs/day${day}/test.in"

# Create Python files
cat > "${BASE_PATH}/python/day${day}/p1.py" << EOF
def solve(input_path):
    with open("${BASE_PATH}/" + input_path) as f:
        lines = f.readlines()
    # TODO: Implement solution
    return 0

if __name__ == "__main__":
    result = solve("inputs/day${day}/real.in")
    print(f"Result: {result}")
EOF

cp "${BASE_PATH}/python/day${day}/p1.py" "${BASE_PATH}/python/day${day}/p2.py"

# Create Rust solution files
cat > "${BASE_PATH}/rust/day${day}/src/bin/part1.rs" << EOF
fn solve(input_path: &str) -> i32 {
    let input = std::fs::read_to_string(format!("${BASE_PATH}/{}", input_path)).unwrap();
    // TODO: Implement solution
    0
}

fn main() {
    let result = solve("inputs/day${day}/real.in");
    println!("Result: {}", result);
}
EOF

cp "${BASE_PATH}/rust/day${day}/src/bin/part1.rs" "${BASE_PATH}/rust/day${day}/src/bin/part2.rs"

# Create C++ files
cat > "${BASE_PATH}/cpp/day${day}/p1.cpp" << EOF
#include <iostream>
#include <fstream>
#include <string>

int solve(const std::string& input_path) {
    std::ifstream file(std::string("${BASE_PATH}/") + input_path);
    // TODO: Implement solution
    return 0;
}

int main() {
    int result = solve("inputs/day${day}/real.in");
    std::cout << "Result: " << result << std::endl;
    return 0;
}
EOF

cp "${BASE_PATH}/cpp/day${day}/p1.cpp" "${BASE_PATH}/cpp/day${day}/p2.cpp"

echo "Setup complete for day ${day}!"