def solve(input_path):

    left_list, right_list = [], []
    with open("/Users/coopergamble/code/competitions/aoc-2024/" + input_path) as f:
        lines = f.readlines()
        for line in lines:
            line = line.strip().split("   ")
            left_list.append(int(line[0]))
            right_list.append(int(line[1]))

    left_list.sort()
    right_list.sort()

    ans = 0
    for l, r in zip(left_list, right_list):
        ans += abs(l - r)

    return ans

if __name__ == "__main__":
    result = solve("inputs/day1/real.in")
    print(f"Result: {result}")
