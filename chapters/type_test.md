````rym
trait FromString {
	/// The associated error which can be returned from parsing.
	type Err

	/// Parses a String `s` to return a value of this type.
	///
	/// If parsing succeeds, return the value inside [`Ok`], otherwise
	/// when the String is ill-formatted return an error specific to the
	/// inside [`Err`]. The error type is specific to the implementation of the trait.
	///
	/// # Examples
	///
	/// Basic usage with [`int`], a type that implements `FromStr`:
	///
	/// ```
	/// use core.str.FromStr
	///
	/// const s = "5"
	/// const x = int.from_str(s).unwrap()
	///
	/// assert_eq(5, x)
	/// ```
	func from_string(s: String) -> Result<Self, Self.Err>
}

/// An error returned when parsing a `bool` using [`from_str`] fails
@derive(Debug, Clone, PartialEq, Eq)
@non_exhaustive
pub struct ParseBoolError

impl FromStr for bool {
	type Err = ParseBoolError

	/// Parse a `Bool` from a `String`.
	///
	/// The only accepted values are `"True", "true"` and `"False"`, `"false"`. Any other input
	/// will return an error.
	///
	/// # Examples
	///
	/// ```
	/// use core.str.FromStr
	///
	/// assert_eq(FromStr.from_str("True"), Ok(True))
	/// assert_eq(FromStr.from_str("true"), Ok(True))
	/// assert_eq(FromStr.from_str("False"), Ok(False))
	/// assert_eq(FromStr.from_str("false"), Ok(False))
	/// assert(<Bool as FromStr>.from_str("not even a boolean").is_err())
	/// ```
	///
	/// Note, in many cases, the `.parse()` method on `String` is more proper.
	///
	/// ```
	/// assert_eq("True".parse(), Ok(True))
	/// assert_eq("False".parse(), Ok(False))
	/// assert("not even a boolean".parse.<Bool>().is_err())
	/// ```
	func from_str(s: String) -> Result<Bool, ParseBoolError> {
		match s {
			"True" | "true" => Ok(True),
			"False" | "false" => Ok(False),
			_ => Err(ParseBoolError),
		}
	}
}

pub func parse<F: FromStr>(&self) -> Result<F, F.Err> {
	FromStr.from_str(self)
}
````

```rym
// Aoc day 1 on Rym

pub func generator(input: String) -> List<Uint> {
	input
		.split("\n\n")
		.map(calories_str => {
			calories_str
				.lines()
				.filter_map(num_str => match num_str.parse(Uint) {
					Ok(val) => Some(val),
					Err(_) => None,
				})
				.sum()
		})
		.collect()
}

pub func part_1(input: [Uint]) -> Uint {
	mut input = List.from(input)
	input.sort()
	input[0]
}

pub func part_2(input: [Uint]) -> Uint {
	mut input = List.from(input)
	input.sort()
	input.reverse()

	input[0] + input[1] + input[2]
}
```

```rym
use std.str.FromStr

func generator(input: String) -> impl Iterator<Item = (String, String)> {
	input.lines().map(line => {
		mut iter = line.split_whitespace()
		const left = iter.next().unwrap()
		const right = iter.next().unwrap()
		(left, right)
	})
}

func calc_score(other: Shape, own: Shape) -> Uint {
	own as Uint
		+ match (own, other) {
			// loose
			(.Rock, .Paper)
			| (.Paper, .Scissors)
			| (.Scissors, .Rock) => 0,
			// draw
			(.Rock, .Rock)
			| (.Paper, .Paper)
			| (.Scissors, .Scissors) => 3,
			// win
			(.Rock, .Scissors)
			| (.Paper, .Rock)
			| (.Scissors, .Paper) => 6,
		}
}

pub func part_1(input: string) -> Uint {
	generator(input).fold(0, (score, (left, right)) => {
		let other = left.parse().unwrap()
		let own = right.parse().unwrap()
		score + calc_score(other, own)
	})
}

pub fn part_2(input: &str) -> Uint {
	generator(input).fold(0, |score, (left, right)| {
		const other = left.parse()!
		const outcome = right.parse()!
		score
			+ calc_score(
				other,
				match (outcome, other) {
					(.Draw, _) => other,
					(.Loose, .Rock) => .Scissors,
					(.Loose, .Paper) => .Rock,
					(.Loose, .Scissors) => .Paper,
					(.Win, .Rock) => .Paper,
					(.Win, .Paper) => .Scissors,
					(.Win, .Scissors) => .Rock,
				},
			)
	})
}

@derive(PartialEq, Eq, Clone, Copy)
pub enum Shape {
	Rock = 1,
	Paper = 2,
	Scissors = 3,
}

impl FromStr for Shape {
	type Err = String

	func from_str(s: string) -> Result<Self, Self.Err> {
		match s {
			"A" | "X" => Ok(Self.Rock),
			"B" | "Y" => Ok(Self.Paper),
			"C" | "Z" => Ok(Self.Scissors),
			_ => Err(f"Unable to parse Shape from `{s}`"),
		}
	}
}

@derive(PartialEq, Eq)
pub enum Outcome {
	Loose = 1,
	Draw = 2,
	Win = 3,
}

impl FromStr for Outcome {
	type Err = String

	func from_str(s: string) -> Result<Self, Self.Err> {
		match s {
			"X" => Ok(Self.Loose),
			"Y" => Ok(Self.Draw),
			"Z" => Ok(Self.Win),
			_ => Err(f"Unable to parse Outcome from `{s}`"),
		}
	}
}
```

```rym
// const myList: [Uint] = [1, 2, 3, 4, 5, 6, 7]
// const mySimpleTerm = () -> if elem 5 myList then "high five" else "no five found"
// mySimpleTerm

const f = => true 						// correct, Fn() -> true
const f = => true { true }		// correct, Fn() -> true
const f = val => bool					// wrong, missing expression
const f = val => bool { val }	// correct, Fn() -> bool
const f = (val: bool) => val		// correct, Fn() -> bool

const double = num => num * 2
const sum = (a, b) => a + b

@type[Bool -> Bool]
const f = val => val // correct, Fn(val: bool) -> bool

const add_one = num => num + 1
const add_one = (num: Uint) => num + 1
const add_one = (num: Uint) => { num + 1 }
const add_one = (num: Uint) => Uint { num + 1 }

func add_one num -> num + 1
func add_one num -> Uint = num + 1
func add_one num: Uint -> Uint = num + 1

func add_one(num) = num + 1
func add_one(num: Uint) -> Uint = num + 1
func add_one(num: impl Add) -> num + 1
func add_one(num: impl Add) -> {
	num + 1
}

func add_one(num: Uint) num + 1
func add_one(num: Uint) = num + 1
func add_one(num: Uint) -> Uint num + 1
func add_one(num: Uint) -> Uint = num + 1
func add_one(num: Uint) -> Uint = { num + 1 }
func add_one(num: Uint) -> Uint { num + 1 }
```

```rym
func func_name param_1: Type, param_2: Type {}
func func_name param_1: Type, param_2: Type -> () {}

func min(a: Uint, b: Uint) -> Uint {
	if a < b { a } else { b }
}

func func_name(param_1: Type, param_2: Type) -> Uint match param_1, param2 {
	Type.One, Type.Two => 8
	Type.Two, Type.Two => 6
	_, _ => 0
}
func func_name(param_1: Type, param_2: Type) -> Uint {
	match param_1, param2 {
		Type.One, Type.Two => 8
		Type.Two, Type.Two => 6
		_, _ => 0
	}
}
func func_name(param_1: Type, param_2: Type) -> Uint {
	match (param_1, param2) {
		(Type.One, Type.Two) => 8
		(Type.Two, Type.Two) => 6
		_ => 0
	}
}
```

Function declaration

```rym
func name(param_1: Type1, param_2: Type1) -> ReturnType {
	// ..
}
```
