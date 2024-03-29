// = Analyzing existing programming languages
= Analyse bestehender Programmiersprachen

// The next step in finding an answer is to investigate currently used programming languages, especially those that have appeared more recently.
// The goal is to find out what they have changed compared to the older languages.
Der nächste Schritt auf der Suche nach einer Antwort besteht darin, die derzeit verwendeten Programmiersprachen zu untersuchen, insbesondere diejenigen, die erst vor kurzem erschienen sind.
Ziel ist es, herauszufinden, was diese im Vergleich zu den älteren Sprachen verändert haben.

// == Data to analyze
== Zu analysierende Daten

// To keep the number of languages within a reasonable range, only the most popular programming languages of 2022 were analysed.
// The primary source for this data is the _StackOverflow Developer Survey 2022_, a global survey conducted annually since 2011, aimed at anyone who programs.
// Below this paragraph one can see a statistic from the survey, where programming languages are ranked according to their popularity.
// Participants were asked to vote for all languages they used last year and would use again.
// The height of a bar corresponds to the number of votes that language received.
Um die Zahl der Sprachen in einem vernünftigen Rahmen zu halten, wurden nur die beliebtesten Programmiersprachen des Jahres 2022 analysiert.
Die Hauptquelle für diese Daten ist der _StackOverflow Developer Survey 2022_, eine weltweite Umfrage, die seit 2011 jährlich durchgeführt wird und sich an alle richtet, die programmieren.
Unterhalb dieses Absatzes kann man eine Statistik aus der Umfrage sehen, in der die Programmiersprachen nach ihrer Beliebtheit geordnet sind.
Die Teilnehmer wurden gebeten, für alle Sprachen zu stimmen, die sie im letzten Jahr verwendet haben und wieder verwenden würden.
Die Höhe eines Balkens entspricht der Anzahl der Stimmen, die diese Sprache erhalten hat.
#cite("so_surveys", "so_survey_2022", "so_survey_2022_data")

// TODO: Color should show the prog lang age
#figure(
	image(height: 262pt, "../data/stackoverflow-survey-2022.png"),
	// Popularity of programming languages in 2022
	caption: [Die beliebtesten Programmiersprachen im Jahr 2022],
) <fig-so-survey>

// The original data also mentions HTML, CSS, SQL, Bash/Shell, and PowerShell.
// These are not considered here because they are highly specialised and in part not Turing-complete. // [^tc-note]
// [^tc-note]: A Turing-complete language can be used to implement any algorithm. @scott_2009, @scott_2016
In den ursprünglichen Daten werden auch HTML, CSS, SQL, Bash/Shell und PowerShell erwähnt.
Diese werden hier nicht berücksichtigt, da sie hochspezialisiert und teilweise nicht Turing-vollständig /* [^tc-note] */ _(engl. Turing-complete)_ sind.

// [^tc-note]: Eine Turing-vollständige Sprache kann zur Umsetzung jedes beliebigen Algorithmus benutzt werden. @scott_2009, @scott_2016

// TODO: Reword once age is visible in diagram
// According to the StackOverflow Developer Survey 2022, JavaScript (1995), Python (1991), Typescript (2012), Java (1995), C\# (2000), C++ (1985), PHP (1995), C (1978), Go (2009) and Rust (2010) are the ten most widely used programming languages.
// On average, these languages are therefore 25 years old.
// @age_prog_langs

#pagebreak()

== Neuere Programmiersprachen

// TODO Mention that ts is second most popular language

// All of the newer programming languages that appear in the statistics are inspired by, or even the successors of, other languages.
// These languages include, for example, TypeScript a statically typed language that builds on JavaScript by adding optional type annotations and other features.
// Developed and maintained by Microsoft, it has gained considerable popularity in recent years, particularly in large-scale web development projects.
// TypeScript's static typing allows for better tooling and increased developer productivity, making it easier to catch bugs early in the development process.
// Because it is just a super-set of JavaScript, developers are able to adopt TypeScript incrementally into existing JavaScript projects.
Alle neueren Programmiersprachen, die in der Statistik aufgeführt sind, wurden von anderen Sprachen inspiriert oder sind sogar die Nachfolger dieser Sprachen.
Eine dieser Sprachen ist TypeScript, eine statisch typisierte Sprache, die JavaScript um optionale Typ-Annotationen und andere Funktionen erweitert.
Sie wird von Microsoft entwickelt und hat in den letzten Jahren vor allem bei großen Webentwicklungsprojekten stark an Popularität gewonnen.
Da es sich nur um ein Erweiterung von JavaScript handelt, können Entwickler TypeScript schrittweise in bestehende JavaScript Projekte integrieren.
@ts_web


// In recent years, Rust has become a very popular programming language.
// Originally developed by Graydon Hoare at Mozilla, Rust is now an independent community project.
// The language is designed with systems programming in mind, combining both safety and speed.
// With a strong focus on type safety, memory safety (without relying on automatic garbage collection) and concurrency.
// Rust prohibits both null and dangling pointers.
// These are known to cause hard-to-debug bugs which, according to Google, are responsible for over 50% of all bugs in Android.
In den letzten Jahren hat sich Rust zu einer sehr beliebten Programmiersprache entwickelt.
Ursprünglich von Graydon Hoare bei Mozilla entwickelt, ist Rust heute ein unabhängiges Gemeinschaftsprojekt.
Die Sprache ist für die Systemprogrammierung gedacht und kombiniert Sicherheit und Geschwindigkeit.
Der Schwerpunkt liegt auf Typsicherheit, Speichersicherheit (ohne automatische Garbage Collection) und Parallelität.
Rust verbietet sowohl Null- als auch Dangling-Pointer.
Diese sind bekannt dafür, schwer zu behebende Fehler zu verursachen, die laut Google, für über 50% aller Bugs in Android verantwortlich sind.
#cite("infoq_rust_interview", "rust_web", "google_rust") @scott_2016[S.867f]


// Kotlin from JetBrains^[JetBrains is a company that develops integrated development environments] can be seen as the successor to Java.
// It is more concise, expressive and secure, interoperates with Java and continues to run on the Java Virtual Machine (JVM).
// Apache's^[The Apache Software Foundation is a nonprofit organisation supporting open source software projects. @apache] Groovy, Closure and Scala are further languages based on the JVM
// that have not gained as much popularity as Kotlin.
// One of the biggest factors in its success has been Google's official support for Android development using Kotlin.
Kotlin von JetBrains /* TODO ^[JetBrains ist ein Unternehmen, das integrierte Entwicklungsumgebungen entwickelt] */ kann als Nachfolger von Java angesehen werden, der übersichtlicher, klarer und sicherer ist.
Die Interoperabilität mit Java ist durch die Verwendung der Java Virtual Machine (JVM) weiterhin gewährleistet.
Groovy von Apache /* TODO^[Die Apache Software Foundation ist eine gemeinnützige Organisation, die Open-Source Softwareprojekte unterstützt. @apache] */, Closure und Scala sind weitere Sprachen, die auf der JVM basieren, aber nicht so populär geworden sind wie Kotlin.
Einer der größten Faktoren für den Erfolg war die offizielle Unterstützung von Google für Android-Entwicklung mit Kotlin.
#cite("groovy_web", "groovy_docs", "closure_web", "closure_ref", "scala_web", "scala_origins", "scala_spec", "jetbrains_web", "kotlin_web", "kotlin_ref", "android_kotlin") @scott_2016[S.867f]


// Google has also created some programming languages of their own, including Go, Dart and Carbon.
// Go was created to combine the efficiency of compiled languages with the simplicity of scripting languages.
// It is used for building networked services, large-scale web applications and other concurrent software.
// Dart was developed to provide fast user interface development across multiple platforms.
// Using the flutter framework one can create cross-platform apps for Android, IOS, Web, Windows, macOS and Linux.
// Carbon, an experimental successor to C++, is the most recent project.
// It was released at the end of 2022 and is still far from mature.
Google hat auch einige eigene Programmiersprachen entwickelt, darunter Go, Dart und Carbon.
Go wurde entwickelt, um die Effizienz von kompilierten Sprachen mit der Einfachheit von Skriptsprachen zu kombinieren.
Es wird für die Entwicklung von vernetzten Diensten, groß angelegten Webanwendungen und anderer parallel laufender Software verwendet.
Dart wurde entwickelt, um eine schnelle Entwicklung von Benutzeroberflächen für viele Plattformen zu ermöglichen.
Mit dem Flutter-Framework lassen sich plattform-übergreifende Anwendungen für Android, IOS, Web, Windows, macOS und Linux erstellen.
Das jüngste Projekt ist Carbon, ein experimenteller Nachfolger für C++.
Es wurde erst Ende 2022 veröffentlicht und ist noch lange nicht ausgereift.
#cite("go_web", "go_spec", "flutter_multi", "carbon")

// Swift, on the other hand, was introduced by Apple in 2014 as a replacement for Objective-C.
// It was designed to be more readable, safer and faster than Objective-C and has quickly gained popularity in the iOS and macOS development community.
// Swift offers modern language features like functional programming, generics and type inference, making it easier to write complex software systems.
// Swift has also gained popularity in server-side development with the introduction of Swift on the server, a project that enables the use of Swift for backend systems. -->
// TODO Refine sources
Swift hingegen wurde 2014 von Apple als Ersatz für Objective-C eingeführt.
Swift soll lesbarer, sicherer und schneller als Objective-C sein
und hat bei iOS- und macOS-Entwicklern schnell an Popularität gewonnen.
Swift bietet moderne Features wie funktionale Programmierung, Generics und Typinferenz, die das Schreiben komplexer Softwaresysteme erleichtern.
Swift hat mit der Einführung von Swift on the Server, einem Projekt, das die Verwendung von Swift für Backend-Systeme ermöglicht, auch in der serverseitigen Entwicklung an Popularität gewonnen.
#cite("swift_docs", "swift_org")

//  TODO mention that most languages are open source
// Swift is also open-source, meaning that developers from all around the world can contribute to its development and evolution. -->

//  - __TODO__
//   - Julia: Developed to be used in scientific, engineering, and technical computing, Julia is a high-performance, high-level dynamic programming language. It is designed to be easy to use and has a syntax similar to that of MATLAB or Python. Julia is particularly well-suited for data science and numerical computing and it's been gaining popularity among researchers and data scientists. -->

// == Innovations / Recent Changes
== Neuerungen


// These new languages improve on their predecessors by fixing many problems and inconveniences that they encountered and could not remove.
// New features that improve safety and usability are sometimes ported back to older languages where possible.
Diese neueren Sprachen unterscheiden sich von ihren Vorgängern dadurch, dass Lösungen für viele Probleme und Unannehmlichkeiten gefunden wurden, die von ihren Vorgängern nicht gelöst werden konnten.
Neue Funktionen, die zur Verbesserung der Sicherheit und der Benutzerfreundlichkeit beitragen, werden jedoch -- soweit dies möglich ist -- in die älteren Sprachen übernommen.

// === Type Systems
=== Typ-Syteme


// A common change is the introduction of static typing, or at least type annotations.
// This feature allows the compiler or third party tools to check for type errors at compile time, making it easier to catch bugs early in the development process.
// TypeScript is a very good example of this, as it adds an entire type system on top of JavaScript, which can prevent about 15% of often occuring bugs.
// @to_type_or_not_to_type[S. 7]
// There is even a proposal to add type annotations to JavaScript, so that tools like TypeScript can skip large parts of the compilation step.
// #cite("stateofjs_missing", "tc39_type_annotations")
// Other dynamically typed languages, like Python and PHP already support type hints and Lua has tools that are similar to TypeScript.
// All the other languages just mentioned (Rust, Kotlin, Go, Dart, Swift) require static types.
Eine gängige Änderung ist die Einführung der statischen Typisierung oder zumindest der Typ-Hinweise _(engl. type annotations)_.
Diese Funktion ermöglicht es dem Compiler oder Tools von Drittanbietern, während der Kompilierung auf Typfehler zu prüfen, Dadurch wird es einfacher, Fehler zu einem frühen Zeitpunkt im Entwicklungsprozess zu erkennen.
TypeScript ist ein sehr gutes Beispiel dafür, da es ein komplettes Typisierungssystem für JavaScript bereitstellt, welches etwa 15% der häufig auftretenden Fehler verhindern kann.
@to_type_or_not_to_type[S. 7]
Es gibt sogar einen Entwurf, JavaScript mit Typ-Hinweisen zu versehen, so dass Werkzeuge wie TypeScript große Teile des Kompilierungsschrittes überspringen können.
#cite("stateofjs_missing", "tc39_type_annotations")
Andere dynamisch typisierte Sprachen wie Python und PHP unterstützen bereits Typ-Hinweise, und Lua verfügt über Werkzeuge, die TypeScript sehr ähnlich sind.
Alle anderen gerade genannten Sprachen (Rust, Kotlin, Go, Dart, Swift) erfordern statische Typen.
#cite("python_docs_typings", "python_pep_484", "php_ref_type_declarations", "go_spec", "rust_ref_types", "swift_docs")

// The problem is that their syntax can get very verbose, which is why many type systems allow for type inference.
// It allows the language to automatically determine the type of a value or expression based on its usage, without the user to explicitly declare it.
// Originally coming from functional languages like Haskell, F\# and OCaml it has found its way into TypeScript, Go, Rust, Kotlin, Dart, Swift and many more.
// Even C++, Java and C\# have added support for it in some places.
Das Problem ist, dass ihre Syntax sehr umfangreich werden kann, weshalb viele Typsysteme Typinferenz ermöglichen.
Dadurch kann die Sprache automatisch den Typ eines Wertes oder Ausdrucks auf der Grundlage seiner Verwendung bestimmen, ohne dass der Benutzer ihn explizit angeben muss.
Ursprünglich kommt dieses System von funktionellen Sprachen wie Haskell, F\# und OCaml und hat seinen Weg zu TypeScript, Go, Rust, Kotlin, Dart, Swift und vielen anderen gefunden.
Selbst C++, Java und C\# haben an einigen Stellen entsprechende Funktionen hinzugefügt.
#cite("ts_handbook_type_inference", "go_spec", "rust_ref_let_stmt", "rust_ref_influences", "swift_docs", "cpp_ref_auto", "java_spec_type_inference") @kotlin_ref[S. 236] @dart_spec[S. 12] @fsharp_spec[S. 13]

// Type classes are another concept from functional languages, particularly Haskell.
// They are used for validating connections between user-defined or external data structures, and for extending their functionality.
// Type classes have been adapted into several programming languages, including Swift, where they are known as protocols, C++, where they are called concepts
// and Rust, where they are referred to as traits.
// Java, C\# and many other languages have similar, although less powerful constructs called interfaces.
Typ-Klassen sind ein weiteres Konzept aus dem Bereich der funktionalen Sprachen, insbesondere Haskell.
Sie werden zur Validierung von Verbindungen zwischen benutzer-definierten oder externen Datenstrukturen verwendet, und zur Erweiterung ihrer Funktion-alität.
Typ-Klassen wurden in verschiedene Programmiersprachen übernommen, darunter Swift, wo sie als "protocols" bekannt sind, C++, wo sie "concepts" heißen
und Rust, wo sie "traits" genannt werden.
Java, C\# und viele andere Sprachen haben ähnliche, wenn auch weniger leistungsfähige Konstrukte
und heißen oft "interfaces".
#cite("swift_book_protocols", "rust_ref_traits", "java_spec_interfaces", "csharp_spec_interfaces") @haskell_spec[S. 44f] @iso_14882_2020[S. 526]

// === Null Safety
=== Null Sicherheit


// Tony Hoare considers calling null references, which he added to ALGOL W in 1965, his "billion dollar mistake" @infoq_null_ref.
// They can represent the absence of a value, but can also cause hard to find bugs if not properly handled.
// To address this, many programming languages have introduced null safety features that make it easier for developers to handle and prevent null pointers.
// These include optional classes, nullable type hints, and optional enums.
// The null coalescing operator and optional chaining operator are also commonly used to handle these issues and make code more readable.
Tony Hoare betrachtet die von ihm 1965 zu ALGOL W hinzugefügten Nullreferenzen als seinen
"Milliarden-Dollar-Fehler" @infoq_null_ref. Sie können das Nichtvorhandensein eines Wertes darstellen, aber auch
schwer zu findende Fehler verursachen, wenn sie nicht richtig behandelt werden. Um dieses Problem zu lösen, haben viele Programmiersprachen
Sicherheitsfunktionen eingeführt, die es den Entwicklern erleichtern, mit Null-Pointern umzugehen und sie zu vermeiden.
Dazu gehören optionale Klassen, Typen, Enums und Typ-Hinweise.
Der Null-Coalescing-Operator und der optionale Verkettungsoperator werden ebenfalls häufig verwendet, um diese Probleme zu umgehen und den Quellcode zu verkürzen.
// TODO Citation needed

//  - null safety
//   - explain what it means
//   - mention "the billion dollar mistake"
//   - Ts
//     - checks for "undefined" and "null" at compile time
//   - Rust
//     - null safe by design
//     - Option enum
//   - Java
//     - Optional class
//   - C\#
//     - checks for values that could be null at compile time
//     - nullable type: T?
//   - C++
//     - added std::optional
//   - PHP
//     - added nullable type hint
//   - Kotlin
//     - has nullable types
//     - checks for null safety at compile time
//   - Dart
//     - Version 2.0 added opt-in null safety checks
//     - Version 3.0 requires null safety checks
//   - Swift
//     - optional enum (works similar to Rust)
//   - optional/nullable type
//     - often indicated by putting a "?" after the types name: "Type?"
//   - Null coalescing operator
//     - Js, Ts, C\#, Kotlin, Dart, Swift, PHP, Ruby
//   - Optional chaining / Null conditional operator
//     - Js, Ts, C\#, PHP (Null-safe operator), Kotlin (Safe calls), Dart, Swift

=== Deklarative und funktionale Programmierung


// Most of the changes just mentioned originated in the field of declarative and, more specifically, functional languages.
// Their recent popularity has led to an increasing adoption of their features in general-purpose programming languages.
// This is in response to the need for more intuitive, readable, and efficient code, as well as better handling of complex problems and data structures.
// For example, C++ has added features to support functional programming through the addition of a `functional` module, and the implementation of algorithms to work with iterators.
// @iso_14882_2020[S. 622-684]
// TypeScript, Rust, Go, Dart, Kotlin and Swift all support functional programming features such as higher-order functions and immutable data structures.
// Although they make it easier to see where side effects can occur, support for controlling them could be improved.
Die meisten der soeben erwähnten Änderungen haben ihren Ursprung im Bereich der deklarativen und insbesondere der funktionalen Sprachen.
Ihre zunehmende Popularität hat dazu geführt, dass ihre Besonderheiten zunehmend in allgemeinen Programmiersprachen eingesetzt werden.
Dies ist eine Reaktion auf den Bedarf an intuitivem, lesbarem und effizientem Code sowie an einer besseren Handhabung komplexer Probleme und Datenstrukturen.
C++ hat zum Beispiel Funktionen zur Unterstützung der funktionalen Programmierung hinzugefügt.
Dies geschah durch die Hinzufügung des `functional` Moduls und die Implementierung von Algorithmen zur Arbeit mit Iteratoren.
@iso_14882_2020[S. 622-684]
TypeScript, Rust, Go, Dart, Kotlin und Swift unterstützen alle Merkmale der funktionalen Programmierung wie z.B.
Funktionen höherer Ordnung/* ^[Funktionen höherer Ordnung sind Funktionen, welche andere Funktionen als Parameter verwenden oder eine Funktion zurüchgeben.] */
und unveränderliche Daten-strukturen.
Obwohl sie es einfacher machen, zu sehen, wo Seiteneffekte auftreten können, könnte die Unterstützung für deren Kontrolle verbessert werden.
#cite("rust_ref_influences", "blog_logrocket_functional_go", "swift_book_closures") @dart_spec[S. 126fff] @kotlin_ref[S. 331f]


// The integration of these paradigms into general purpose programming languages has allowed developers to take advantage of the strengths of both imperative and declarative programming styles, resulting in a more flexible and expressive programming experience.
// This trend is likely to continue in the future, as the demand for more sophisticated and efficient programming solutions continues to grow.
Die Integration dieser Paradigmen in allgemeine Programmiersprachen ermöglicht es Entwicklern, die Stärken der imperativen und deklarativen Programmierstile gleichzeitig zu nutzen, was zu einer flexibleren und ausdrucksstärkeren Programmierung führt.
Dieser Trend wird sich in Zukunft wahrscheinlich fortsetzen, da die Nachfrage nach anspruchs-volleren und effizienteren Programmierlösungen weiter steigt.
@github_readme_functional_programming

// === Modular Project Structure
=== Modulare Projektstruktur

// Apart from the differences between declarative and imperative programming languages, they also have one change in common.
// The systems used to modularise projects and to import an item from one module into another have improved greatly.
// In older languages, this was traditionally done by simply inserting the contents of another file.
// Today, built-in packaging systems are the de facto standard.
// C++20 adds support for modules that work like this, and JavaScript adapted a similar system in 2015.
// Rust, Go, Dart, Kotlin and Swift have supported this functionality since their creation.
Abgesehen von den Unterschieden zwischen deklarativen und imperativen Programmier-sprachen haben sie eine Veränderung gemeinsam.
Die Systeme zur Modularisierung von Projekten und zum Importieren eines Elements aus einem Modul in ein anderes haben sich stark verbessert.
In älteren Sprachen geschah dies traditionell durch einfaches Einfügen des Inhalts einer anderen Datei.
Heute sind eingebaute Paketsysteme der De-facto-Standard.
C++20 bietet Unterstützung für Module, die auf diese Weise funktionieren, und JavaScript hat 2015 ein ähnliches System eingeführt.
Rust, Go, Dart, Kotlin und Swift haben diese Funktionalität von Anfang an unterstützt.
#cite("rust_ref_modules", "go_spec", "swift_book_access_control") @iso_14882_2020[S. 232-242] @ecmascript_spec[S. 390-425] @kotlin_ref[S. 295f]
