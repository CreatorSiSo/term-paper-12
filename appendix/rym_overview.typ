// Appendix A --- Rym Overview
#heading[Rym Überblick]

// == Data Types
== Datentypen

// Most of the following structures are automatically imported for every file.

=== Booleans

```rym
type Bool = True | False
use Bool.True
use Bool.False
```

=== Integers

```rym
0
44
1834
999_999_999
```

=== Floats

```rym
0.1
-1.4
```

Ist die Dezimalstelle ```rym 0```, dann kann sie weggelassen werden.

```rym
-444.0
-444.
```

=== Text

```rym
type Char
'a' '\n' '\t' '\u{2192}'
```

```rym
type String
"Hello World!\n" "testing"
```

=== Records <sec-appendix-records>

```rym
type Vec3 = {
  x: F32,
  y: F32,
  z: F32,
}

let pos = Vec3 { x: 2.5, y: -1.2, z: 0.0, }
```

#pagebreak()

// === Enumerations / Union- / Sumtypes
=== Enumerationen / Vereinigungstypen <sec-appendix-unions>

```rym
type EnumName = Variant1 | Variant2 | VariantN

let variant = EnumName.VariantN
```

// There is also a shorter syntax for small enums:
Für kleine Enumerationen gibt es auch eine kürzere Syntax:

```rym
type SmallEnum = VerySmall | ActuallyLarge
```

// Each variant can be associated with a specific value.
// These values are automatically chosen if not defined and are usually represented by an integer:
Jede Variante kann mit einem bestimmten Wert verknüpft werden.
Diese Werte werden automatisch ausgewählt, wenn sie nicht definiert sind,
und werden normalerweise durch Integers dargestellt:

```rym
type EnumName =
  | Variant1 = 1
  | Variant2 = 2
  | VariantN = 156

let variant_n = EnumName.VariantN
let repr = variant_n as Uint       // 156
let variant_2 = 2 as EnumName      // EnumName.Variant2
```

// Builtin Enumerations
=== Eingebaute Enumerationen

// The Option type is used for something that might not have a value.
Der Option-Typ wird für etwas verwendet, das möglicherweise keinen Wert hat:

```rym
type Option<T> =
  | Some(T)
  | None

use Option.Some
use Option.None
```

// The Result type is used to specify that something can either have a value or contain an error.
Der Result-Typ wird verwendet, um anzugeben, dass etwas entweder einen Wert oder einen Fehler enthalten kann:

```rym
type Result<T, E> =
  | Ok(T)
  | Err(E)

use Result.Ok
use Result.Err
```

#pagebreak()

== Expressions <sec-appendix-expressions>

=== Block

// Block expression evaluate to the value of their last statement and, like any other expression, they can be used as an initializer for a variable:
Blockausdrücke geben den Wert ihrer letzten Anweisung zurück und können, wie jeder andere Ausdruck, als Initialisierer für eine Variable verwendet werden:

```rym
let outer_index = 0

let str = {
  let array = ["One", "Two", "Three"]
  array[outer_index]
}
print(str)  // "One\n"
```

=== If..Else

```rym
if expression {
  print("True branch")
}

if expression {
  print("True branch")
} else {
  print("False branch")
}
```

=== IfLet..Else

```rym
let maybe_value = Some(2)
if let Some(value) = maybe_value {
  print(value)
} else {
  print("None")
}
```

=== "?" Operator <sec-qestion-mark-op>

```rym
func read_to_string(path: string) -> Result<string, IoError> {
  let mut file = File.open(path)?
  let mut data = ""
  file.read_to_string(mut data)?
  Ok(data)
}
```

#pagebreak()

=== Match

// Used to destructure complex data types like enumerations:
Dient der Destrukturierung komplexer Datentypen wie Enumerationen:

```rym
match maybe_value {
  Some(value) => print(value)
  None => print("None")
}
```

// And works just as well with structures.
Und funktioniert genauso gut mit Strukturen:

```rym
match pos {
  Vec3 { x: 0.0, .. } => print("Position: on ground")
  Vec3 { y: 0.0, z: 0.0, .. } => print("Position: on x axis")
  Vec3 { x: 0.0, z: 0.0, .. } => print("Position: on y axis")
  Vec3 { x: 0.0, y: 0.0, .. } => print("Position: on z axis")
  Vec3 { x: 0.0, y: 0.0, z: 0.0 } => print("Position: at origin")
  Vec3 { x, y, z } => print("Position:", x, y, z)
}
```

// It is also possible to use `_` as a wildcard for catching all remaining cases.
Es ist auch möglich, `_` als Platzhalter zu verwenden, um alle übrigen Fälle zu erfassen:

```rym
match pos {
  Vec3 { x: 0.0, y: 0.0, z: 0.0 } => print("at origin")
  _ => print("not at origin")
}
```

=== While

```rym
let mut number = 3
while number > 0 {
  print("{number}!")
  number -= 1
}
print("LIFTOFF!!!")
```

```
3
2
1
LIFTOFF!!!
```

#pagebreak()

=== Loop

```rym
let mut counter = 0
let result = loop {
  counter += 1
  if counter == 10 { break counter * 2 }
}
print(f"The result is {result}")
```

```
The result is 20
```

=== For

```rym
let numbers = [10, 20, 30, 40, 50]
for number in numbers {
  print(f"the value is: {number}")
}
```

```
the value is: 10
the value is: 20
the value is: 30
the value is: 40
the value is: 50
```

=== Closures <sec-appendix-closures>

```rym
func twice(f: func(i32) -> i32) -> func(i32) -> i32 {
  x -> f(f(x))
}

let plus_three_twice = twice(i -> i + 3)
print(f"{plus_three_twice(10)}")
```

```
16
```


== Statements

=== Variablen <sec-appendix-variables>

```rym
let name = "Hello World!" // unveränderbare variable
let mut mut_name = "Hello " // änderbare variable
mut_name += "Universe!"
print(name, mut_name)
```

```
Hello World! Hello Universe!
```

// Uninitialized variables must have a value assigned to them before they can be used.
Nicht initialisierte Variablen müssen mit einem Wert versehen werden, bevor sie verwendet werden können:

```rym
let name
if condition { name = "Simon" } else { name = "Robert" }
print(name) // erlaubt, da "name" immer einen Wert hat
```

=== Use

// TODO: Does File.create even make sense??

```rym
use std.fs.{self, File}

let path = "./dad_jokes.txt"
let joke = "What should you do if you meet a giant? Use big words."
let create_result = File.create(path)
let write_result = fs.write(path, joke)
let data = fs.read_to_string(path).unwrap()

print(data)
```

```
What should you do if you meet a giant? Use big words.
```

=== Funktionen <sec-appendix-functions>

==== Scope <sec-appendix-scope>

// TODO: changeX is a misleading function name

// When the function "changeX(3)" is called, a new scope is created containing the parameter "x" initialised with the value "3".
// The outer variable "x" is not accessible inside the function scope and therefore does not affect the value of x.
// The variable "y" is also defined within this scope and initialised with the value 10.
// The body of the function is executed and the value of "x + y" (13) is returned.
// The function scope is then destroyed and the original scope is restored, resulting in the value "13" being assigned to the variable "result".
Wenn die Funktion "changeX(3)" aufgerufen wird, wird ein neuer Bereich erstellt, der den Parameter "x" enthält, welcher mit dem Wert "3" initialisiert wird.
Die äußere Variable "x" ist innerhalb des Bereichs der Funktion nicht zugänglich und hat daher keinen Einfluss.
Die Variable "y" wird ebenfalls in diesem Bereich definiert und mit dem Wert 10 initialisiert.
Der Hauptteil der Funktion wird ausgeführt und der Wert von "x + y" (13) zurückgegeben.
Anschließend wird der Funktionsbereich zerstört und der ursprüngliche Bereich wiederher-gestellt, so dass der Wert "13" der Variablen "result" zugewiesen wird.

```rym
let x = 5
func changeX(x: i32) -> i32 {
  let y = 10
  return x + y
}
let result = changeX(3)  // result = 13
```

#pagebreak()

// ==== Parameter Default Values
==== Standardwerte für Parameter

```rym
func increment(num: i32, by = 1) -> i32 {
  num + by
}

let plus_one = increment(100)         // 101
let plus_50 = increment(100, 50)      // 150
let plus_50 = increment(100, by: 50)  // 150
```
// ==== Force Named Arguments
==== Erzwingen von benannten Argumenten

```rym
func testing(pos_or_named: i32, .., named: string) { }

testing(2, named: "Hello World!")
testing(2, named: "Hello World!")
testing(pos_or_named: 2, named: "Hello World!")
testing(named: "Hello World!", pos_or_named: 2)
```

// ==== Variable Arguments
==== Variable Argumente

```rym
func concat(..strings: [string], sep = "") -> string {
  strings.join(sep)
}
let name = "Mr. Walker"
print(
  concat("Hello ", name, "!"),
  concat(2.to_string(), True.to_string(), name, sep: ", "),
  concat(sep: ", ", 2.to_string(), True.to_string(), name),
  sep: "\n"
)
```

```
Hello Mr. Walker!
2, True, Mr. Walker
2, True, Mr. Walker
```

#pagebreak()

=== Implementationen <sec-appendix-impl>

// Every type can have several "impl" blocks,
// that must be located in the same module as the type.
// They hold static/non-static methods and internal types.
// These methods are private by default and can be made public with the "pub" keyword.
Jeder Typ kann mehrere "impl" Blöcke haben,
welche sich im selben Modul wie der Typ befinden müssen.
Sie enthalten statische/nicht-statische Methoden und interne Typen.
Standardmäßig sind Methoden privat und können mit dem Schlüsselwort `pub` öffentlich gemacht werden:

```rym
type Bool = True | False

impl Bool {
  pub func then<T>(self, fn: func() -> T) -> Option<T> {
    if self { Some(fn()) } else { None }
  }
  pub func then_some<T>(self, value: T) -> Option<T> {
    if self { Some(value) } else { None }
  }
}
```

=== Traits / Typ-Klassen

// Traits are used to define common functionality between types:
Traits werden verwendet, um gemeinsame Funktionen zwischen Typen zu definieren:

```rym
trait Default {
  func default() -> Self
}
```

// They are implemented for specific types through separate implementations:
Sie werden für bestimmte Typen durch separate Implementierungen umgesetzt:

```rym
impl Default for Bool { func default() -> Self { False } }
impl Default for I32 { func default() -> Self { 0 } }
impl Default for String { func default() -> Self { "" } }
impl<T> Default for [T] { func default() -> Self { [] } }
```

// This is also how iterators are specified in Rym:
Auf diese Weise werden auch Iteratoren in Rym definiert:

```rym
trait Iterator {
  type Item
  func next(mut self) -> Option<Self.Item>
}
```

#pagebreak()

// These iterators can be used to implement a simple counter like the following or to go over all items of an array one by one.
Diese Iteratoren können verwendet werden, um einen einfachen Zähler wie den folgenden umzusetzen oder um beispielsweise alle Elemente eines Arrays einzeln zu durchlaufen.

```rym
type Counter = { count: usize, max: usize }

impl Iterator for Counter {
  type Item = usize

  func next(mut self) -> Option<Self.Item> {
    self.count += 1
    if self.count <= self.max { Some(self.count) } else { None }
  }
}

let mut counter = Counter { count: 0, max: 3 }
print(counter.next())
print(counter.next())
print(counter.next())
print(counter.next())
```

```
Some(1)
Some(2)
Some(3)
None
```
