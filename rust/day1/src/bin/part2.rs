use std::collections::HashMap;

fn solve(input_path: &str) -> u32 {
    let input = std::fs::read_to_string(format!("/Users/coopergamble/code/competitions/aoc-2024/{}", input_path)).unwrap();

    let rows = input.lines().filter(|line| !line.is_empty());
    
    let mut left_list: Vec<u32> = Vec::new();
    let mut right_list: Vec<u32> = Vec::new();

    for row in rows {
        let numbers: Vec<&str> = row.split_whitespace().collect();
        
        if numbers.len() >= 2 {
            match (numbers[0].parse::<u32>(), numbers[1].parse::<u32>()) {
                (Ok(left), Ok(right)) => {
                    left_list.push(left);
                    right_list.push(right);
                },
                _ => println!("Failed to parse numbers in row: {}", row),
            }
        } else {
            println!("Row doesn't contain enough numbers: {}", row);
        }
    }  

    let mut frequencies: HashMap<u32, u32> = HashMap::new();
    for r in right_list {
        *frequencies.entry(r).or_default() += 1;
    }

    let mut answer: u32 = 0;
    for l in left_list {
        if !frequencies.contains_key(&l) {
            answer += 0;
            continue;
        }
        answer += l * frequencies[&l];
    }
    
    return answer
}

fn main() {
    let result = solve("inputs/day1/real.in");
    println!("Result: {}", result);
}