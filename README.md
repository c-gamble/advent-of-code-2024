# Advent of Code 2024

Solutions for Advent of Code 2024 in Python, Rust, and C++.

## Setup

1. Create a `.env` file in the root directory with:

```
AOC_COOKIE=your_aoc_session_cookie
BASE_PATH=/path/to/your/project
```

2. Make the setup script executable:

```bash
chmod +x new_day.sh
```

3. Create a new day:

```bash
./new_day.sh -d N  # where N is the day number
```

## Python Setup & Running

Python solutions use a virtual environment and requirements.txt for dependencies.

```bash
# Initial setup
cd python
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt

# Running solutions
cd python
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
python day1/p1.py  # Run part 1 of day 1
python day1/p2.py  # Run part 2 of day 1
```

## Rust Setup & Running

Rust solutions use a workspace structure where each day is a separate package with two binaries (part1 and part2).

```bash
# Running solutions
cd rust
cargo run --bin part1 --package day1  # Run part 1 of day 1
cargo run --bin part2 --package day1  # Run part 2 of day 1

# Running tests
cargo test --package day1  # Run tests for day 1

# Running with release optimizations
cargo run --release --bin part1 --package day1
```

## C++ Setup & Running

C++ solutions are standalone files that need to be compiled before running.

```bash
# Compiling and running (using g++)
cd cpp/day1
g++ -std=c++17 p1.cpp -o p1  # Compile part 1
g++ -std=c++17 p2.cpp -o p2  # Compile part 2
./p1  # Run part 1
./p2  # Run part 2

# Alternative: Compile and run in one step
g++ -std=c++17 p1.cpp -o p1 && ./p1
```

## Project Structure

```
.
├── cpp/
│   └── dayN/
│       ├── p1.cpp
│       └── p2.cpp
├── inputs/
│   └── dayN/
│       ├── real.in  # Your puzzle input
│       └── test.in  # Example input for testing
├── python/
│   ├── .venv/
│   ├── requirements.txt
│   └── dayN/
│       ├── p1.py
│       └── p2.py
├── rust/
│   ├── Cargo.toml
│   └── dayN/
│       ├── Cargo.toml
│       └── src/
│           └── bin/
│               ├── part1.rs
│               └── part2.rs
├── .env
└── new_day.sh
```

## Adding New Days

Simply run:

```bash
./new_day.sh -d N  # where N is the day number
```

This will:

1. Create all necessary directories and files
2. Download your input from Advent of Code (using your session cookie)
3. Create template solution files in all languages
4. Create an empty test input file
