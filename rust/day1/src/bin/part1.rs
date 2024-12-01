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

    left_list.sort();
    right_list.sort();

    let mut answer: u32 = 0;
    for i in 0..left_list.len() {
        answer += left_list[i].abs_diff(right_list[i]);
    }
    
    return answer
}

fn main() {
    let result = solve("inputs/day1/real.in");
    println!("Result: {}", result);
}