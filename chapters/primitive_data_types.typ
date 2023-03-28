= Primitive Data Types

Data types that are not defined in terms of other types are called primitive data types.
Nearly all programming languages provide a set of primitive data types.
Some of the primitive types are merely reflections of the hardware for example, most integer types and others require only a little nonhardware support for their implementation.
More complex types can be created by combining primitive types as we will see in /* @sec-algebraic-data-types */.
[@sebesta_2019 S. 400]


== Boolean <sec-bool>

Boolean types are perhaps the simplest of all types and have been included in most general-purpose languages designed since 1960.
They only have two possible values one for true and one for false.
Boolean types are often used to represent switches or flags in programs.
Although other types, such as integers, can be used for these purposes,
the use of boolean types is more readable.
C and C++ still allow numeric expressions to be used as if they were boolean.
This is not the case in the subsequent languages, Java and C\# which is why Rym will disallow this as well.
[@java_spec_types; @csharp_spec_types]
// TODO: C, C++ citetation for numerics usable as booleans


A boolean value could be represented by a single bit,
but because a single bit of memory cannot be accessed efficiently on many machines,
they are often stored in the smallest efficiently addressable cell of memory, typically a byte.
As this detail is trivial Rym does not specify how to store boolean values.
[@sebesta_2019 S. 404f]

The boolean type in Rym is called "bool" like in Python, PHP, C\#, Go, Rust, Swift and many others.
It is named after _George Boole_ who pioneered the field of mathematical logic.
[@php_ref_types; @csharp_spec_types; @go_spec; @rust_ref_types; @swift_docs]

// TODO Should bool be a union type of true and false?
// ```rym
// type bool = true | false
// ```


== Boolean Operations

A Boolean value may be created using the _true_ or _false_ literals
```rym
const var_1 = true
const var_2 = false
```
and is always the result for the comparison binary operators ==, <, <=, >= and >.
The comparision operations actually use the literals in their implementation as well,
which can be seen in /* @sec-polymorphism */.
There is also the unary not prefix operator represented by ! which allow one to invert a boolens value .
The prefix already suggests that this operator must come before the expression it operates on,
as the ! can be used as a unary postfix operator to unwrap a value and __TODO: INSERT CHAPTER REF__ explains why that is useful.

<!-- TODO Explain why Rym boolean operations work the way they work  -->

In Rym the control-flow expressions _if_ and _while_ use booleans to decide whether some code should be executed or not. How they work and why their syntax tooks like this will be covered in __TODO: INSERT CHAPTER REF__.
```rym
const condition = true
if condition { /* do something once */ }
while condition { /* do something forever */ }
```

== Numeric Types

=== Integer

Another very common primitive numeric data type is the integer.
The hardware of many computers supports several sizes of integers.
These sizes of integers, and often a few others, are supported by some programming languages.
As seen in /* @tbl-int-formats */, Java includes four signed integer sizes: byte, short, int, and long.
Some languages, for example C, C++ and C\# include unsigned integer types, which are types for integer values without signs.
Unsigned types are often used for binary data. 8 bit large unsigned integers can for example represent exactly one byte.
[@sebesta_2019 S. 400]

The types for C and C++ that are represented in /* @tbl-int-formats */ are using the "cstdint" header
as the language standards do not specify the sizes for default integer types and leave them up to the implementation.
Types from this standard header file are however required to that exact size.
[@iso_9899_2018 S. 0; @iso_14882_2020 S. 0] <!-- TODO citation pages -->

- Python ^[https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex]
  - size as large as needed
- PHP ^[https://www.php.net/manual/en/language.types.integer.php]
  - int
  - size platform dependent, 32bit\|64bit
- Java ^[https://docs.oracle.com/javase/specs/jls/se19/html/jls-4.html\#jls-4.2]
- C, C++:
  - char, short, int, long are not always the same size
  - cstdint header: c++ standard S. 493f.
- Go ^[https://go.dev/ref/spec#Numeric_types]
- Zig (special case) ^[https://ziglang.org/documentation/master/#Integers]
  - arbitrary size
  - size 1--65535
  - i{Size} eg. i333
  - u{Size} eg. u8
- Rust ^[https://doc.rust-lang.org/reference/types/numeric.html\#integer-types]

| Size [Bits] | Java  | C\#           | C, C++              | Go              | Rust         |
| :---------: | ----- | ------------- | ------------------- | --------------- | ------------ |
|      8      | byte  | sbyte, byte   | int8_t, uint8_t     | int8, uint8     | i8, u8       |
|     16      | short | short, ushort | int16_t, uint16_t   | int16, uint16   | i16, u16     |
|     32      | int   | int, uint     | int32_t, uint32_t   | int32, uint32   | i32, u32     |
|     64      | long  | long, ulong   | int64_t, uint64_t   | int64, uint64   | i64, u64     |
|   32\|64    | ---   | nint, nuint   | ---                 | int, uint       | ---          |
|     128     | ---   | ---           | ---                 | ---             | i128, u128   |
|   pointer   | ---   | ---           | intptr_t, uintptr_t | intptr, uintptr | isize, usize |

: Supported integer formats <tbl-int-formats> // tbl-colwidths="[16,10,16,23,19,16]"

=== Float

<!-- TODO Should I call this "Floating Point Numbers" insted? -->

Generally languages provide floating point data types that adhere to the "IEEE 754 - Floating-Point" arithmetic standard [@ieee754_2019] or its ISO adoption "ISO/IEC 60559" [@iso60559_2020]. How wide that support is can be seen in /* @tbl-float-formats */.

- IEEE 754
  - https://en.wikipedia.org/wiki/IEEE_754
  - active version is from 2019 [@ieee754_2019]
  - https://ieeexplore.ieee.org/document/8766229
  - same as ISO/IEC 60559
- Accessed: 02.01.2023
  - Js: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number
  - Python: https://docs.python.org/3/library/stdtypes.html#typesnumeric
  - PHP: https://www.php.net/manual/en/language.types.float.php
  - Java: https://docs.oracle.com/javase/specs/jls/se19/html/jls-4.html\#jls-4.2.3
  - Go: https://go.dev/ref/spec#Numeric_types
  - Rust: https://doc.rust-lang.org/reference/types/numeric.html\#floating-point-types
- Accessed: 09.01.2023
  - C\#
    - https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/types#837-floating-point-types
    - https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types
  - C, C++
    - C++ "The value representation of floating-point types is implementation-defined." S. 75
    - standards do not specific float format to use, they just mandate the minimum range and precision
    - https://en.cppreference.com/w/cpp/language/types

<!-- TODO: is float always `binary32` or can it be `decimal32` as well? -->

| Size [Bits] | Js/Ts  | Python | PHP   | Java   | C\#     | C, C++ | Go      | Rust |
| :---------: | ------ | ------ | ----- | ------ | ------ | ------ | ------- | ---- |
|     32      | Number | ---    | ---   | float  | float  | ?      | float32 | f32  |
|     64      | ---    | ---    | ---   | double | double | ?      | float64 | f64  |
|   32\|64    | ---    | float  | float | ---    | ---    | ---    | ---     | ---  |

: Supported IEEE-754 floating point formats <tbl-float-formats> // tbl-colwidths="[16,12,10,8,10,10,12,12,10]"

=== Decimal

- Pythony 09.01.2023
  - decimal.Decimal
  - The decimal module provides support for fast correctly rounded decimal floating point arithmetic.
  - Once constructed, Decimal objects are immutable.
  - https://docs.python.org/3/library/decimal.html

== Character

- Rym:
  - Name: char
  - valid utf-8 character
  - space: 1 byte?

| Language | Formats                  |
| -------: | ------------------------ |
|    Js/Ts | not supported            |
|   Python | not supported?           |
|      PHP | not supported?           |
|     Java | char: 16bit unsinged int |
|      C\# | ?                        |
|      C++ | ?                        |
|        C | ?                        |
|       Go | ?                        |
|     Rust | `char`                   |

: Character data types <tbl-chars> // tbl-colwidths="[15,85]"

- Java: 09.01.2023 https://docs.oracle.com/javase/specs/jls/se19/html/jls-4.html\#jls-4.2

== String

- Rym:
  - characters array: [char]
  - dynamic characters vector: String

```rym
const const_string: [char; 12] = "Hello World!"

impl Add for [char] {
  fn add(move self, move rhs: Self) -> Self {
    [..self, ..rhs]
    // or
    mut new_array = ['\0'; self.length + rhs.length]
    new_array[0..self.length] = self
    new_array[self.length..] = rhs
  }
}
```

{{< pagebreak >}}
