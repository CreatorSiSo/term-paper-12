````rym
trait FromString {
	/// The associated error which can be returned from parsing.
	type Err

	/// Parses a string `s` to return a value of this type.
	///
	/// If parsing succeeds, return the value inside [`Ok`], otherwise
	/// when the string is ill-formatted return an error specific to the
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
	func from_string(s: string) -> Result<Self, Self.Err>
}

/// An error returned when parsing a `bool` using [`from_str`] fails
@derive(Debug, Clone, PartialEq, Eq)
@non_exhaustive
pub struct ParseBoolError

impl FromStr for bool {
	type Err = ParseBoolError

	/// Parse a `bool` from a string.
	///
	/// The only accepted values are `"true"` and `"false"`. Any other input
	/// will return an error.
	///
	/// # Examples
	///
	/// ```
	/// use core.str.FromStr
	///
	/// assert_eq(FromStr.from_str("true"), Ok(true))
	/// assert_eq(FromStr.from_str("false"), Ok(false))
	/// assert(<bool as FromStr>.from_str("not even a boolean").is_err())
	/// ```
	///
	/// Note, in many cases, the `.parse()` method on `string` is more proper.
	///
	/// ```
	/// assert_eq("true".parse(), Ok(true))
	/// assert_eq("false".parse(), Ok(false))
	/// assert("not even a boolean".parse.<bool>().is_err())
	/// ```
	func from_str(s: string) -> Result<bool, ParseBoolError> {
		match s {
			"true" => Ok(true),
			"false" => Ok(false),
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

pub func generator(input: string) -> List<uint> {
	input
		.split("\n\n")
		.map(|calories_str| {
			calories_str
				.lines()
				.filter_map(|num_str| match num_str.parse(uint) {
					Ok(val) => Some(val),
					Err(_) => None,
				})
				.sum()
		})
		.collect()
}

pub func part_1(input: [uint]) -> uint {
	mut input = List.from(input)
	input.sort()
	input[0]
}

pub func part_2(input: [uint]) -> uint {
	mut input = List.from(input)
	input.sort()
	input.reverse()

	input[0] + input[1] + input[2]
}
```
