// = Concept of a modern programming language
= Konzept einer Programmiersprache der nächsten Generation

// Rym is a general purpose language designed to work at a level above systems
// programming, while still allowing the use of lower level features when required.
// Although both an interpreter and a compiler can be used to implement Rym,
// the current implementation is an interpreter/* ^[An interpreter is a computer program that directly executes instructions written in a programming language.] */.
// However, this description makes no assumptions about the
// implementation and enables a future compiled version/* ^[A compiler is a computer program that translates computer code written in one programming language into another language.] */.
Rym ist eine Sprache für allgemeine Zwecke, die auf einer höheren Ebene als die System Programmierung arbeitet,
aber dennoch die Verwendung von tieferliegenden Funktionen gestattet.
Die aktuelle Implementierung ist nur ein Interpreter/* ^[Ein Interpreter ist ein Computerprogramm, das die in einer Programmiersprache geschriebene Anweisungen direkt ausführt.] */.
Rym kann jedoch auch durch einem Kompiler/* ^[Ein Kompiler ist ein Computerprogramm, das den in einer Programmiersprache geschriebenen Code in eine andere Sprache übersetzt.] */ umgesetzt werden.

Die Git-Repository für dieses Projekt ist unter https://github.com/CreatorSiSo/rym zu finden.

== Syntax

// The syntax follows the aspects mentioned in @sec-readability, especially @sec-syntax.
Die Syntax folgt den in /* @sec-readability */ sowie /* @sec-writability */ genannten Aspekten und ist so aufgebaut,
dass das Prinzip des Spiralcurriculums/* ^[Das Spiralcurriculum festigt Vorwissen durch wiederholte Begegnungen mit dem selben Thema und baut im Laufe der Zeit darauf auf. @spiral_curriculum] */ angewendet werden kann.
Rym ermöglicht es, zunächst sehr simplen Code zu schreiben, ohne alle Details der Sprache kennen zu müssen.
Später kann der Benutzer durch kleine Änderungen mehr Kontrolle erlangen.

// Rym can be considered part of the C-style languages, as it combines syntax from C, Go, Rust, F\# and others.
// The typical braces -- `{` and `}` -- are used for structure types and to enclose blocks of statements.
// Function definitions begin with "func", just as they do in Go or Swift, and the type declarations are very similar to those in F\#.
Rym kann als Teil der C-ähnlichen Sprachen betrachtet werden, da die Syntax ähnlich der von C, Go, Rust, TypeScript, F\# ist.
Die typischen geschweiften Klammern -- `{` und `}` -- werden für Struktur-Typen und zum Umschließen von Anweisungsblöcken verwendet.
Funktionsdefinitionen beginnen mit "func", genau wie in Go oder Swift und die Typ-Deklarationen sind denen in TypeScript sowie F\# sehr ähnlich.
#cite("go_spec", "swift_book_functions") @fsharp_spec[S. 39f]

// However, it differs from typical C-style syntax in one major way: It is primarily expression-based, like Rust and F\#.
// This means that most forms of value-producing or effect-causing evaluation are controlled by the syntax category of expressions.
// In contrast, statements are mostly used to contain and explicitly sequence the evaluation of expressions.
In einem Punkt gibt es jedoch große Unterschiede zur typischen C-Syntax: Rym ist, wie Rust und F\#, primär ausdrucksbasiert.
Das bedeutet, dass die meisten Formen der wertbildenden oder effektverursachenden Auswertung durch die Syntaxkategorie der Ausdrücke gesteuert werden.
Im Gegensatz dazu werden Anweisungen meist dazu verwendet, eine spezifische Reihe an Ausdrücken zu enthalten.
// TODO explain why expressions are useful

// Rym also has strict naming rules.
// Names can only begin with the ASCII characters "a-z", "A-Z" or "\_". After that, the numbers "0-9" are also allowed.
// This makes it easier for users to work together because the language forces them to write similar code.
// Variable, function and module names are written in _snake\_case_,
// user-defined types must use _PascalCase_ and the core built-in types such as `Bool` are single lowercase words.
// Snake case is used because the underscore improves readability.
// Pascal case distinguishes types from values.
Rym hat auch strikte Regeln für die Namensgebung.
Namen dürfen nur mit den ASCII-Zeichen `a-z`, `A-Z` oder `_` beginnen. Anschließend sind auch die Zahlen `0-9` erlaubt.
Dies erleichtert den Benutzern die Zusammenarbeit, da die Sprache sie veranlasst, ähn-lichen Code zu schreiben.
Variablen-, Funktions- und Modulnamen werden in _snake\_case_ geschrieben und die Namen von komplexen Typen müssen in _PascalCase_ geschrieben werden.
Snake-Case wird verwendet, da der Unterstrich die Lesbarkeit verbessert.
Pascal-Case vereinfacht die Unterscheidung von komplexen Datentypen und Werten.
@sebesta_2019[S. 344fff]

// TODO Explain difference between syntax and semantics

// == Comments
== Kommentare

Die typischen Kommentare von Sprachen im C-Stil sind auch Teil von Rym.
Um den Rest einer Zeile auszukommentieren wird `//` benutzt.
Wenn er über mehrere Zeilen reichen soll sind `/*` und `*/` die Begrenzungen für den Kommentar.
Außerdem kann die zweite Art in einnander verschachtelt werden,
solange die Anzahl der öffnenden `/*` den der schließenden `*/` entspricht.

// == Program Structure
== Programmstruktur

// Rym's execution model is based on packages, which can be either a library or an executable.
// Packages containing a `main` function can be run as standalone programs, while others are reusable libraries.
// These packages are made up of modules, functions, constants and other definitions that form a tree-like structure, providing organisation for the code.
Das Ausführungsmodell von Rym basiert auf Paketen, die entweder eine Bibliothek oder eine ausführbares Programm sein können.
Pakete, die eine Funktion namens `main` enthalten, können als eigenständige Programme ausgeführt werden, während andere wiederverwendbare Bibliotheken sind.
Diese Pakete bestehen aus Modulen, Funktionen, Konstanten und anderen Definitionen, die eine baumartige Struktur bilden und für die Organisation des Codes sorgen.

// Source files that represent a top-level module use the .rym extension.
// Rym also allows the execution of ".rys" script files, to allow for quick testing and to help people learning the language get started.
// These scripts work much like a JavaScript or Python file,
// where all statements are executed immediately without the need to define an entry function.
// Rym achieves this by simply wrapping the contents of the script in a `main` function.
Quelldateien, die ein Top-Level-Modul darstellen, verwenden die Erweiterung `.rym`.
Rym erlaubt auch die Ausführung von `.rys` Skriptdateien, um schnelle Tests zu ermöglichen und Personen, die die Sprache lernen, den Einstieg zu erleichtern.
Diese Skripte funktionieren ähnlich wie eine JavaScript- oder Python-Datei,
wo alle Anweisungen sofort ausgeführt werden, ohne dass eine Eingangsfunktion definiert werden muss.
Rym erreicht dies, indem es den Inhalt des Skripts einfach in eine Hauptfunktion einbettet.

// A look at the typical "Hello World!" script shows what this transformation looks like in practice _(main.rys)_ :
Ein Blick auf das typische "Hello World!" Skript zeigt, wie diese Umwandlung in der Praxis aussieht (`main.rys`) :

```rym
print("Hello World!")
```

// It is just as simple as a Python script that prints `Hello World!\n`, but actually gets transformed to this module file _(main.rym)_ :
Es ist genauso simpel wie ein Python-Skript, welches `"Hello World!\n"` ausgibt.
Tatsächlich wird es aber in diese Moduldatei umgewandelt (`main.rym`) :

```rym
func main() {
  print("Hello World!")
}
```

// == Variables
== Variablen

// Variables in Rym are either immutable, which is preferred, or mutable.
// The `let` keyword can be used to declare a new variable.
// Examples for creating variables can be found in @sec-appendix-variables.
Variablen in Rym sind entweder unveränderlich, was vorzuziehen ist, oder veränderbar.
Das Schlüsselwort `let` kann verwendet werden, um eine neue Variable zu erstellen.
Beispiele für die Erstellung von Variablen sind in @sec-appendix-variables zu finden.

// == Data Types
== Datentypen

// Types in Rym are generally declared with the keyword `type`.
// The keyword can be followed by some syntax that defines what values this type holds.
// All types in Rym can be described by the concept of algebraic data types _(ADT/ADTs)_ .
// This model associates each type with the set of values it can represent.
Typen in Rym werden im Allgemeinen mit dem Schlüsselwort `type` deklariert.
Dem Schlüsselwort kann eine Syntax folgen, die definiert, welche Werte dieser Typ enthält.
Alle Typen in Rym können durch das Konzept der algebraischen Datentypen _(ADT/ADTs)_ beschrieben werden.
Dieses Modell verknüpft jeden Typ mit der Menge der Werte, die er darstellen kann.

// === Unit Type
=== Unit

// The unit type originated in functional languages, but is very similar to the void type of C, C++, JavaScript, etc.
// It is the exact value that functions and expressions without a result return.
Der Unit-Typ hat seinen Ursprung in funktionalen Sprachen, ist aber dem void-Typ von C, C++, JavaScript usw. sehr ähnlich.
Er hat genau einen Wert und wird von Funktionen und Ausdrücken ohne Ergebnis zurückgeben.

// === Boolean Type
=== Booleans

// Boolean types are some of the simplest of all types and have been included in most general-purpose programming languages designed since 1960.
// The boolean type in Rym is called `Bool` like in Python, PHP, C\#, Go, Rust, Swift and many others.
// It was named after _George Boole_ who pioneered the field of mathematical logic.
Boolean-Typen gehören zu den einfachsten aller Typen und sind in den meisten seit 1960 entwickelten allgemeinen Programmiersprachen enthalten.
Der Boolean-Typ in Rym heißt `Bool`, wie in Python, PHP, C\#, Go, Rust, Swift und vielen anderen.
Er wurde nach _George Boole_ benannt, einem Pionier der mathematischen Logik.
#cite("php_ref_types", "csharp_spec_types", "go_spec", "rust_ref_types", "swift_docs")

// Boolean only have two possible values, `True` and `False`.
// Therefore they are often used to represent switches or flags in programs.
// Although other types, such as integers, can be used for these purposes,
// the use of boolean types is more readable.
// C and C++ still allow numeric expressions to be used as if they were boolean.
// This is not the case in their successor languages, Java and C\#. Therefore, Rym will not allow this either.
Booleans haben nur zwei mögliche Werte, `True` und `False`.
Deshalb verwendet man sie häufig, um Schalter oder Marker in Programmen darzustellen.
Obwohl auch andere Typen, wie z.B. Integer, für diese Zwecke verwendet werden können,
ist die Verwendung von Boolescher Werten besser lesbar.
In C und C++ können numerische Ausdrücke immer noch so verwendet werden, als wären sie Booleans.
In den nachfolgenden Sprachen, Java und C\#, ist dies nicht der Fall.
Daher wird Rym dies auch nicht erlauben.
#cite("java_spec_types", "csharp_spec_types") @sebesta_2019[S. 404]
// TODO: C, C++ citetation for numerics usable as booleans

// A boolean value could be represented by a single bit,
// but because a single bit of memory cannot be accessed efficiently on many machines,
// they are often stored in the smallest efficiently addressable cell of memory, typically a byte.
// As this detail is unimportant Rym does not specify how to store boolean values.
Ein Boolescher Wert könnte durch ein einziges Bit dargestellt werden.
Da aber auf vielen Rechnern nicht effizient auf ein einzelnes Bit im Speicher zugegriffen werden kann,
werden sie oft in der kleinsten effizient adressierbaren Speicherzelle gespeichert, in der Regel einem Byte.
Da dieses Detail unwichtig ist, spezifiziert Rym nicht, wie Boolesche Werte zu speichern sind.
@sebesta_2019[S. 404f]

// === Boolean Operations
=== Verwedung von Booleans

// A Boolean value may be created using the `True` or `False` literals.
Ein Boolescher Wert kann mit den Begriffen `True` oder `False` erstellt werden.

// TODO Explain that True and False are just enum vriants eg. types which is why they start with a capital letter

```rym
let var_1 = True
let var_2 = False
```

// In Rym the control-flow expressions _if_ and _while_ use booleans to decide whether some code should be executed or not.
In Rym verwenden die Kontrollflussausdrücke `if` und `while` Boolesche Werte, um zu ent-scheiden, welcher Code ausgeführt werden soll und vice versa.

```rym
let condition = True
if condition { /* do something once */ }
while condition { /* do something forever */ }
```

#pagebreak()

=== Integers

// Another very common primitive numeric data type is the integer.
// As seen in /* @tbl-int-formats */ defining a specific size for integers, is only supported by some programming languages.
// Some languages, for example C, C++ and C\# include unsigned integer types, which are types for integer values without signs.
// Unsigned types are often used for binary data. 8 bit large unsigned integers can for example represent exactly one byte.
// [@sebesta_2019 S. 400]
Ein weiterer sehr verbreiteter Datentyp ist der Integer, welcher nur in manchen Sprachen existiert.
Wie in /* @tbl-int-formats */ zu sehen, wird die Definition einer bestimmten Größe für Integers von noch weniger Programmiersprachen unterstützt.
Einige Sprachen unterstützen vorzeichenlose Integer-Typen.
Diese Typen werden zur Speicherung von natürlichen Zahlen und häufig auch von binären Daten verwendet.
Acht Bit große vorzeichenlose Integers können zum Beispiel genau einen Byte darstellen.

// The types for C and C++ that are represented in /* @tbl-int-formats */ are using the "cstdint" header
// as the language standards do not specify the sizes for default integer types and leave them up to the implementation.
// Types from this standard header file are however required to that exact size.
Die Typen für C und C++, welche in /* @tbl-int-formats */ dargestellt werden, verwenden den `cstdint` Header,
da ihre Standards die Größen für Integers nicht vorgeben und sie der Implementierung überlassen.
Die Typen aus der Header-Datei müssen jedoch genau diese Größe haben.
@cstdint_header

#figure(
	// caption: [Supported integer formats],
	caption: [Unterstützte Integer-Formate],
	table(
		columns: (auto, 1fr, auto, auto, auto, 1fr),
		[Size [Bits]], [Java],  [C\#],           [C, C++],              [Go],              [Rust],
		[8],           [byte],  [sbyte, byte],   [int8_t, uint8_t],     [int8, uint8],     [i8, u8],
		[16],          [short], [short, ushort], [int16_t, uint16_t],   [int16, uint16],   [i16, u16],
		[32],          [int],   [int, uint],     [int32_t, uint32_t],   [int32, uint32],   [i32, u32],
		[64],          [long],  [long, ulong],   [int64_t, uint64_t],   [int64, uint64],   [i64, u64],
		[32|64],       [---],   [nint, nuint],   [---],                 [int, uint],       [---],
		[128],         [---],   [---],           [---],                 [---],             [i128, u128],
		[pointer],     [---],   [---],           [intptr_t, uintptr_t], [intptr, uintptr], [isize, usize],
	)
) <tbl-int-formats>


// The "cstdint" header, Go and Rust have names for these types that clearly indicate how large a value is.
// Rym just uses Rust's version as it is the shortest one.
// They also allow for the future possiblity to add integers of arbitrary size.
Der `cstdint` Header, Go und Rust haben Namen für diese Typen, die eindeutig angeben, wie groß ein Wert ist.
Rym verwendet einfach die Version von Rust, da sie die kürzeste ist.
Diese Namen ermöglichen es auch in der Zukunft, Integers beliebiger Größe hinzuzufügen.

=== Floats

// Most languages provide floating point data types that adhere to the _IEEE-754_ floating point arithmetic standard @ieee754_2019 or its ISO adoption _ISO-60559_ @iso60559_2020.
// Some examples can be seen in @tbl-float-formats.
// C and C++ are marked with a question mark as their standards do not requiere the use of _IEEE-754_.
Die meisten Sprachen bieten Fließkommazahl-Typen an, die dem _IEEE-754_ @ieee754_2019 Standard für Fließkommaarithmetik oder seiner ISO-Adaption _ISO-60559_ @iso60559_2020 entsprechen.
Einige Beispiele dafür sind in @tbl-float-formats zu sehen.
C und C++ sind mit einem Fragezeichen gekennzeichnet, da ihre Standards die Verwendung von _IEEE-754_ nicht vorschreiben.

#figure(
	// caption: [Supported _IEEE-754_ floating point formats],
	caption: [Unterstützte _IEEE-754_ Fließkommazahl-Formate],
	table(
		columns: (auto, auto, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
		[Size [Bits]], [Js/Ts],  [Python], [PHP],   [Java],   [C\#],    [C, C++], [Go],      [Rust],
		[32],          [Number], [---],    [---],   [float],  [float],  [?],      [float32], [f32],
		[64],          [---],    [---],    [---],   [double], [double], [?],      [float64], [f64],
		[32|64],       [---],    [float],  [float], [---],    [---],    [---],    [---] ,    [---],
	)
) <tbl-float-formats>

// Rym -- again just like Rust -- provides the `F32` and `F64` types to allow for possible additions and changes in the future.
Rym bietet -- wieder genau wie Rust -- die Typen `F32` und `F64"` um Ergänzungen und Änderungen in der Zukunft zu ermöglichen.

=== Strings

Für die Arbeit mit Text bietet Rym den eingebauten Typ `String`.
Dieser kann verwendet werden, um UTF-8 kodierten Text zu speichern.
Ein neuer String beginnt und endet mit `"`.
Dazwischen können alle mit UTF-8 enkodierbaren Zeichen stehen.

```rym
"Hello World\n"
```

Für spezielle unsichtbare Zeichen, wie Zeilenumbrüche oder Tabs gibt es spezialle Sequenzen, die mit `\` beginnen.
// TODO: \ More readable ??????
Sie verbessern die Lesbarkeit dieser Zeichen.
Beispiels-weise steht `\n` im oben zu sehenden Code für einen Zeilenumbruch/* ^[`\n` stellt nur für Unix-Systeme einen vollen Zeilenumbruch dar, unter Windows muss `\r\n` benutzt werden.] */.

// - Rym:
//   - characters array: [char]
//   - dynamic characters vector: String

=== Komplexe Datentypen

Rym erlaubt neben den bereits erwähnten primitiven Datentypen auch die Verwendung komplexer Typen.
Zu diesen Typen gehören Arrays, die eine Liste von Elementen desselben Typs darstellen.
Vereinigungstypen oder auch Enumerationen werden verwendet, um darzustellen, dass ein Wert verschiedene Typen haben kann.
Strukturen können schließlich verwendet werden, um verschiedene Datentypen in einem Typ zu kombinieren.
Beispiele für die Erstellung und Verwendung verschiedener komplexer Datentypen finden sich in @sec-appendix-records, @sec-appendix-unions und @sec-appendix-impl.

// == Functions
== Funktionen

// Functions in Rym are declared by the `func` keyword followed by a name for the function,
// a comma-separated list of parameters and their respective types, and the function's return type.
// This means that a function with multiple parameters will generally look like this
Funktionen in Rym werden mit dem Schlüsselwort `func` deklariert, gefolgt von einem Namen für die Funktion,
einer durch Kommata getrennten Liste von Parametern und ihren jeweiligen Typen sowie dem Rückgabetyp der Funktion.
Eine Funktion mit mehreren Parametern sieht demnach folgendermaßen aus:

```rym
func name(param_0: Type0, param_1: Type1) -> ReturnType {
  // ..
}
```

// Just like in any _C-style_ language, this function can be called by specifying the name of the function, followed by a list of arguments in parentheses separated by commas.
// The arguments must match the types of the parameters defined in the function definition.
// The previous example function would be called as follows:
Wie in jeder Sprache im _C-Stil_ kann diese Funktion aufgerufen werden, indem man den Namen der Funktion angibt, gefolgt von einer Liste an Argumenten in Klammern, getrennt durch Kommata.
Die Argumente müssen mit den Typen der in der Funktionsdeklaration definierten Parameter übereinstimmen.
Die vorherige Beispielfunktion würde wie folgt aufgerufen werden:

```rym
name(argument0, argument1)
```

// === Scope
=== Speicherbereich der Funktion

// When a function is called, the variables and values in the current scope are temporarily suspended and a new scope is created for the function.
// This new scope contains the parameters of the function as variables, initialised with the values of the arguments passed to the function.
// The body of the function is then executed within this new scope, and any variables or values defined within the function are only accessible within this scope.
// When the function is complete, the function scope is destroyed and the original scope is restored.
// An example and explanation can be found in @sec-appendix-scope.
Wenn eine Funktion aufgerufen wird, werden die Variablen und Werte im aktuellen Speicherbereich vorübergehend ausgesetzt, und es wird ein neuer Speicherbereich für die Funktion erstellt.
Dieser neue Bereich enthält die Parameter der Funktion als Variablen, die mit den Werten der an die Funktion übergebenen Argumente initialisiert sind.
Der Hauptteil der Funktion wird dann in diesem neuen Bereich ausgeführt, und alle in der Funktion definierten Variablen oder Werte sind außerhalb des Bereichs der Funktion nicht zugänglich.
Wenn die Funktion beendet wurde, wird der Bereich der Funktion zerstört und der ursprüngliche Speicherbereich wird wiederhergestellt.
Ein Beispiel und eine Erklärung sind in @sec-appendix-scope zu finden.

// === Returning
=== Rückgaben

// All functions in Rym must be defined with a return type.
// This allows tools to analyse a function without having to look at its body.
// The return type is specified after the `->` arrow symbol in the function definition.
// If a return statement is encountered during execution, the value following the return statement is returned to the function callee.
Alle Funktionen in Rym müssen mit einem Rückgabetyp definiert werden.
Dies ermöglicht es Tools, eine Funktion zu analysieren, ohne sich ihren Körper ansehen zu müssen.
Der Rückgabetyp wird nach dem Pfeilsymbol `->` in der Funktionsdefinition angegeben.
Wenn während der Ausführung eine Return-Anweisung auftritt, wird der Wert, der auf die Anweisung folgt, an den Funktionsaufrufenden zurückgegeben.

// In the following example, the function `multiply` takes two integer arguments, `x` and `y`, and returns the result of their multiplication as an integer.
Im folgenden Beispiel nimmt die Funktion `multiply` zwei Integer-Argumente, `x` und `y`, und gibt das Ergebnis ihrer Multiplikation als Integer zurück.


```rym
func multiply(x: I32, y: I32) -> I32 {
  let result = x * y
  return x * y
}
```

// The function body contains a single statement that defines a local variable `result` and initialises it with the value of `x * y`.
// The return statement then specifies that the value of `result` should be returned as the result of the function.
// However, it is not necessary to specify a return statement in every function.
// The value of the last expression in the function body will be returned automatically.
Der Funktionskörper enthält eine einzige Anweisung.
Die lokale Variable `result` wird definiert und mit dem Wert von `x * y` initialisiert.
Die Return-Anweisung gibt dann an, dass der Wert von `result` als Ergebnis der Funktion zurückgegeben werden soll.
Es ist jedoch nicht notwendig, in jeder Funktion eine Return-Anweisung anzugeben.
Der Wert des letzten Ausdrucks im Funktionskörper wird automatisch zurückgegeben.

```rym
func multiply(x: I32, y: I32) -> I32 {
  x * y
}
```

// In this case, the value of the expression `x * y` is returned as the result of the function, without the need for a separate return statement.
// This allows for more concise and readable code, as the return statement is often unnecessary when the function body contains only a single expression.
In diesem Fall wird der Wert des Ausdrucks `x * y` als Ergebnis der Funktion zurückgegeben, ohne dass eine separate Return-Anweisung erforderlich ist.
Dies ermöglicht einen kürzeren und besser lesbaren Code, da die Return-Anweisung oft überflüssig ist, wenn der Funktions-körper nur einen einzigen Ausdruck enthält.

Weitere Eigenschaften der Funktionen aus Rym sind in @sec-appendix-functions beschrieben.

=== Closures, Anonyme Funktionen

// Rym tries to combine imperative and declarative approaches to programming and allows functions to be used like data.
// However, function declarations are statements and cannot be used as expressions.
// This can be very cumbersome when passing functions into a function call, as they must first be defined and then referenced by name.
// Closures solve this problem because they are an expression and allow functions to be created inline.
Rym versucht, imperative und deklarative Ansätze in der Programmierung zu kombinieren.
Deshalb ist es möglich Funktionen wie Daten zu behandeln.
Funktionsdeklarationen sind jedoch Anweisungen und können nicht als Ausdrücke verwendet werden.
Dies macht die Übergabe von Funktionen in einem Funktionsaufruf umständlich.
Closures lösen dieses Problem, da sie ein Ausdruck sind und die Erstellung von Funktionen direkt Vorort ermöglichen.
[@sebesta_2019 S. 665ff]

// TODO Where does the name closure come from?

// The exact types for parameters and the return value are inferred from the context.
// However, if necessary, they can be written down in the same way as function declarations.
// Their syntax is based on the function declarations of Rym, and can be written in the following way:
Die genauen Typen der Parameter und des Rückgabewerts werden aus dem Kontext abgeleitet.
Falls erforderlich, können sie jedoch in der gleichen Weise wie bei Funktionsdeklarationen notiert werden.
Ihre Syntax lehnt sich an die Funktionsdeklarationen von Rym an und kann wie folgt geschrieben werden:

```rym
(param_0, param_1) -> { /* .. */ }
(param_0, param_1) -> { /* .. */ }
(param) -> { /* .. */ }
(param) -> /* .. */
() -> /* .. */
```

// See @sec-appendix-closures and @sec-appendix-fac-decl for examples of how closures are used in Rym.
Siehe @sec-appendix-closures und @sec-appendix-fac-decl für Beispiele, wie Closures in Rym verwendet werden.

// == Operators
== Operatoren

// Rym provides a number of unary and binary operators.
// The unary operators include the `!` operator, which is used to invert the value of a boolean,
// the `-` operator, which is used to negate numbers
// and the `?` operator.
// This operator unpacks types such as `Option` or `Result`
// and returns the value from the current function if an unsuccessful variant -- `None` or `Err` -- is met. _(See @sec-qestion-mark-op)_
// Rym does not support the `++` and `-\-` operators,
// which are often used to increment or decrement an integer.
// They can often be used as a prefix or postfix, making it unclear what exactly these operators do.
Rym bietet eine Reihe von unären und binären Operatoren.
Zu den unären Operatoren gehören der `!` Operator, mit dem der Wert eines booleschen Wertes umgekehrt werden kann,
der `-` Operator, der zum Negieren von Zahlen verwendet wird
und der `?` Operator.
Dieser Operator entpackt Typen wie `Option` oder `Result`
und gibt bei einer erfolglosen Variante -- `None` oder `Err` -- den Wert der aktuellen Funktion zurück. _(Siehe @sec-qestion-mark-op)_
Rym unterstützt die Operatoren `++` und `--` nicht,
mit denen häufig ein Integer inkrementiert oder dekrementiert wird.
Sie können als Präfix oder Postfix verwendet werden, wodurch es unklar ist, wie genau diese Operatoren funktionieren.

// There are two categories of binary operators in Rym.
// Those in the first category produce a new value (Addition: `+` Subtraktion: `-` Multiplikation: `*` Division: `/` Rest: `%` Und: `&` Oder: `|`), (Gleich: `==` Kleiner: `<` Kleiner gleich `<=` Größer `>` Größer gleich `>=`) and the others change an existing variable (`=` `+=` `-=` `*=` `/=` `%=` `&=` `|=`).
// The assignment operators can only be used with variables that are marked as mutable.
// This very typical syntactic sugar is also supported:
In Rym gibt es zwei Kategorien von binären Operatoren.
Diejenigen der ersten Kategorie erzeugen einen neuen Wert /* ^[Addition: `+` Subtraktion: `-` Multiplikation: `\*` Division: `/` Rest: `%` Und: `&` Oder: `|`] */
,/* __TODO__^[Gleich: `==` Kleiner: `<` Kleiner gleich `<=` Größer `>` Größer gleich `>=`] */ und die anderen ändern eine bestehende Variable/* ^[Zuweisungen: `=` `+=` `-=` `*=` `/=` `%=` `&=` `|=`] */.
Die Zuweisungsoperatoren können nur mit Variablen verwendet werden, die als veränderbar gekennzeichnet sind.

Die folgende sehr typische Syntax, eine Alternative zu `++` und `--` wird ebenfalls unterstützt:

```rym
let mut counter = 0

counter = counter + 1
counter += 1

print(counter) // "2\n"
```

== Control Flow


Although Rym can be used to model control flow in a purely functional way it also supports imperative control flow expressions like (`if`, `else`, `match`) and loops (`loop`, `while`, `for`).
Examples for how these expressions are used can be found in @sec-appendix-expressions.

Obwohl Rym zur Beschreibung des Kontrollflusses in einer rein funktionalen Weise verwendet werden kann,
unterstützt es auch imperative Kontrollflussausdrücke wie (if, else, match) und Schleifen (loop, while, for).
Beispiele für die Verwendung dieser Ausdrücke können in @sec-appendix-expressions nachgelesen werden.


Furthermore Rym provides a mechanism for early exits from loops through the use of break statements.
The continue statement ends the current iteration of a loop and jumps starts the next one.
Return statements are used for early returns out of functions.

Außerdem bietet Rym einen Mechanismus zum vorzeitigen Verlassen von Schleifen durch die Verwendung von break-Anweisungen.
Die continue-Anweisung beendet die aktuelle Iteration einer Schleife und springt in die nächste.
Return-Anweisungen werden für das vorzeitige Verlassen von Funktionen verwendet.

== Tooling and Ecosystem

Rym has a growing ecosystem of tools and libraries that make it easier to develop, test, and deploy applications.
These tools include IDEs, text editors with Rym plugins, build tools, package managers, and libraries for various domains.
Rym's tooling and ecosystem are designed to be flexible and allow for easy integration with other systems and technologies.
