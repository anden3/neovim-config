local aoc = s({
        trig = "aoc",
        dscr = "A snippet for a new day using cargo-aoc",
    },
    fmta([[
    #[aoc(day<day_number>, part1)]
    pub fn part1(input: &str) ->> i64 {
        let mut result = 0;
        dbg!(input);
        result
    }

    // #[aoc(day<day_number>, part2)]
    // pub fn part2(input: &str) ->> i64 {
    //     let mut result = 0;
    //
    //     result
    // }

    #[cfg(test)]
    mod tests {
        const TEST: &str = "<test>";

        #[test]
        fn test_1() {
            assert_eq!(super::part1(TEST), <test_result>);
        }

        // #[test]
        // fn test_2() {
        //     assert_eq!(super::part2(TEST), <test_result>);
        // }
    }
]], {
        day_number = i(1, "day number"),
        test = i(2, "test input"),
        test_result = i(3, "test result")
    }, {
        repeat_duplicates = true
    }))


return {
    aoc
}
