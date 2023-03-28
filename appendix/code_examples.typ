// = Rym Source Code Examples
= Rym Quellcode Beispiele

== Factorial

// Two possible implementations for calculating factorials.
// Pseudo code from Wikipedia:
Zwei mögliche Implementierungen für die Berechnung von Fakultäten. \
Pseudocode von Wikipedia @wikipedia_factorial:

```
define factorial(n):
  f := 1
  for i := 1, 2, 3, ..., n:
    f := f × i
  return f
```

// === Imperative approach
=== Imperativer Ansatz

```rym
func factorial(n: Uint) -> Uint {
  let mut result = 1
  for let i in 1..=n {
    result *= i
  }
  result
}
```

// === Declarative approach <sec-appendix-fac-decl>
=== Deklarativer Ansatz <sec-appendix-fac-decl>

```rym
func factorial(n: Uint) -> Uint {
  (1..=n).fold(1, (accum, i) -> accum * i)
}
```

=== Nutzung

```rym
factorial(1)  // 1
factorial(2)  // 2
factorial(3)  // 6
factorial(4)  // 24
factorial(5)  // 120
```

#pagebreak()

// == Builtin Print Function
== Eingebaute Print Function

// === Imperativer Ansatz

```rym
func print(..args: [impl Display], sep = " ", end = "\n") -> @Io {
  mut output = ""
  mut first_item = true

  for arg in args {
    if first_item { first_item = false } else { output.push(sep) }
    output.push(arg.fmt())
  }
  output.push(end)
  /* .. */
}
```

// === Declarative approach
=== Deklarativer Ansatz

```rym
func print(..args: [impl Display], sep = " ", end = "\n") -> @Io {
  const output = args.iter().map(item -> item.fmt()).join(sep)
  const output = output + end
  /* .. */
}
```

=== Nutzung

```rym
print("Hello World")                // "Hello World\n"
print("Hello World", end: "")       // "Hello World"

print(true, 2, "three")             // "true 2 three\n"
print(true, 2, "three", sep: ", ")  // "true, 2, three\n"
```

#pagebreak()

== Find Summands <sec-appendix-find-summands>

// Function for finding two items in a sorted list, that add up to the given sum.
Funktion zum Finden von zwei Elementen in einer sortierten Liste, die die angegebene Summe ergeben.

```rym
func summands(numbers: [I32], sum: I32) -> Option<[Usize; 2]> {
  let mut low = 0
  let mut high = numbers.len() - 1

  while low < high {
    const current_sum = numbers[low] + numbers[high]

    if current_sum == sum {
      return Some([numbers[low], numbers[high]])
    } else if current_sum < sum {
      low += 1
    } else {
      high -= 1
    }
  }

  None
}

let numbers = [-14, 1, 3, 6, 7, 7, 12]
let sum = -13

if let Some([left, right]) = summands(numbers, sum) {
  print(f"Sum of {left} and {right} = {sum}")
} else {
  print("Pointers have crossed, no sum found")
}
```
