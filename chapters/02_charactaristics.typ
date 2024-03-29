#import "../template.typ": TODO, jb

// = Characteristics of Programming Languages
= Eigenschaften von Programmiersprachen

// = Positive/Advantageous/Desirable Characteristics/Properties of Programming Languages
// = Desirable Characteristics of Programming Languages
// = Influences on Language Design
// = Eveluation Criteria

// Crucial to achieving this goal is to find out which features of a programming language are beneficial and vice versa.
// These are then evaluated in terms of how they affect the software development process, including maintenance.
// Such a list of characteristics is necessarily controversial, as it is difficult to get everyone to agree on the value of some given language property relative to others.
// In spite of these differences, most would probably agree that the following criteria are at least important.
Eine Liste dieser Art ist umstritten, da es unterschiedliche Meinungen über den Wert jeder bestimmten Spracheigenschaft im Vergleich zu anderen gibt.
Obwohl es auch aufgrund der Unterschiedlichen Anwendungsbereiche einer Programmiersprache keine allgemeingültigen Vorteile gibt, werden die folgenden Kriterien häufig genannt.
@stansifer_1995[S. 60] @sebesta_2019[S. 41]

// == Readability
== Lesbarkeit <sec-readability>

// One key criteria for judging a programming language is the ease with which programs can be read and understood.
// Source code written in our new language will possibly be read more often then written
// and maintenance, where a lot of reading happens, is as a major part of the developement cycle.
// Because ease of maintenance is determined in large part by the
// readability of programs, readability is an important measure to improve the
// quality of programs and programming languages.
// -- Readability should be considered in the context of the problem domain. --
// __TODO CONTEXT OF RYM__
// The following subsections describe characteristics that contribute to the
// readability of a programming language.
Ein wichtiges Kriterium für die Beurteilung einer Programmiersprache ist die Leichtigkeit, mit der Programme gelesen und verstanden werden können.
Der in unserer neuen Sprache geschriebene Quellcode wird öfter gelesen als geschrieben und Wartungen, bei welchen viel gelesen wird, sind ein wichtiger Teil des Entwicklungsprozesses.
#TODO[Cite source proving that code is more often read than written]
Da die Wartungsfreundlichkeit zu einem großen Teil durch die Lesbarkeit von Programmen bestimmt wird, ist sie eine wichtige Maßnahme zur Verbesserung der Qualität von Programmen und Programmiersprachen.
In den folgenden Unterabschnitten werden Merkmale beschrieben, die zur Lesbarkeit einer Programmiersprache beitragen.
@sebesta_2019[S. 42f]

// === Simplicity
=== Einfachheit

// The overall simplicity of a programming language strongly affects its readability.
// A language with a large number of basic constructs is more difficult to understand than a simpler one.
// Programmers who must use a complex language often learn just a subset of the language and ignore its other features.
// Readability problems occur whenever the program’s author has learned a different subset from that subset with which the reader is familiar.
Die Einfachheit einer Programmiersprache wirkt sich stark auf ihre Lesbarkeit aus.
Eine Sprache mit vielen Grundstrukturen ist schwerer zu verstehen als eine mit wenigen.
Programmierer, die eine komplexe Sprache verwenden müssen, lernen oft nur eine Teilmenge der Sprache und ignorieren andere.
Probleme mit der Lesbarkeit treten immer dann auf, wenn der Programmverfasser eine andere Teilmenge gelernt hat als die, mit der der Leser vertraut ist.
@stansifer_1995[S. 61] @sebesta_2019[S. 43]

// in which a single operator can have more than one meaning.
// Although this is often useful, it can lead to reduced readability if users are allowed to create their own overloading and do not do it sensibly.
// For example, it is clearly acceptable to overload "+" to use it for both integer and floating-point addition.
// In fact, this overloading simplifies a language by reducing the number of operators. How the overloading in Rym works is explained in @sec-polymorphism.
Weiterhin kann das Überladen von Operatoren/* ^[Wie das Überladen in Rym funktioniert, wird in @sec-polymorphism erklärt.] */, bei dem ein einzelner Operator viele verschiedene Implementierung haben kann, die Einfachheit beinflussen.
Das ist zwar oft sinnvoll, kann aber das Lesen erschweren, wenn Benutzern erlaubt wird, ihre eigenen Überladungen zu erstellen und sie dies nicht in einer vernünftigen Art und Weise tun.
Es ist jedoch durchaus akzeptabel, `+` zu überladen, um es sowohl für die Ganzzahl- als auch für die Gleitkommaaddition zu verwenden.
In diesem Fall vereinfachen Überladungen die Sprache, da sie die Anzahl der verschiedenen Operatoren reduzieren.
@sebesta_2019[S. 43f] @sebesta_2019[S. 664]

// feature multiplicity
// A third complicating characteristic of a programming language is, having more than one way to accomplish the same operation.
#TODO[write more?]
Eine dritte Charakteristik, welche die Einfachheit einer Programmiersprache negativ beeinträchtigt, ist das Vorhandensein zu vieler Möglichkeiten, dieselbe Operation auszuführen.
@sebesta_2019[S. 43]

#pagebreak()

// On the other hand, simplicity can be taken too far.
// For example, the form and meaning of most assembler instructions are very simple.
// Since more complex control statements are missing, the programme structure is less obvious.
// More of them are needed than in equivalent programs in a higher programming language.
// The same arguments apply to the less extreme case of languages with inadequate control and data structures.
Andererseits kann man es mit der Einfachheit auch übertreiben.
Beispielsweise sind Form und Bedeutung der meisten Assembler-Anweisungen sehr einfach.
Da komplexere Steueranweisungen fehlen, ist die Programmstruktur jedoch weniger offensichtlich.
Es werden mehr Anweisungen benötigt als in entsprechenden Programmen einer höheren Programmiersprache.
Die gleichen Argumente gelten auch für den weniger extremen Fall von Sprachen mit unzureichenden Kontroll- und Datenstrukturen.
@sebesta_2019[S. 44]

// === Orthogonality
=== Orthogonalität

// Orthogonality^[The word orthogonal comes from the mathematical concept of orthogonal vectors, which are independent of eachother.] in a programming language means that a small set of primitive constructs can be combined in a small number of ways to build the control and data structures of the language.
// Furthermore, every possible combination of primitives should be legal and meaningful.
// Therefore, a lack of orthogonality leads to exceptions to the rules of the language.
// The more orthogonal the design of a language, the fewer exceptions the language rules require.
// Fewer exceptions mean a higher degree of regularity in the design, which makes the language easier to learn, read, and understand.
Orthogonalität _(griech. orthos „gerade / aufrecht / richtig / rechtwinklig“)_ in einer Programmiersprache bedeutet, dass eine kleine Menge von primitiven Konstrukten auf wenige Arten kombiniert werden können, um die Kontroll- und Datenstrukturen der Sprache aufzubauen.
Außerdem sollte jede mögliche Kombination von Primitiven legal und sinnvoll sein.
Ein Mangel an Orthogonalität führt also zu Ausnahmen an den Regeln der Sprache.
Je weniger Ausnahmen es gibt, desto leichter ist die Sprache zu lesen, zu verstehen und zu erlernen.
@sebesta_2019[S. 44ff]

// The meaning of an orthogonal language feature is independent of the context of its appearance in a program.
// But making everything context independent can lead to unnecessary complexity as well.
// Because languages require a large number of primitives, a high degree of orthogonality results in an explosion of combinations.
// So, even if the combinations are simple, their sheer numbers leads to complexity.
// Simplicity in a language, therefore, is at least in part the result of a combination of a relatively small number of primitive constructs and a limited use of the concept of orthogonality.
Die Bedeutung eines orthogonalen Sprachelements ist unabhängig vom Kontext, in dem es in einem Programm vorkommt.
Alles kontextunabhängig zu machen, kann aber auch zu unnötiger Komplexität führen.
Da Sprachen eine große Anzahl von Primitiven benötigen, führt ein hoher Grad an Orthogonalität zu einer Explosion von Kombinationen.
Selbst wenn die Kombinationen einfach sind, erzeugt ihre Anzahl Komplexität.
Die Einfachheit einer Sprache ist daher zumindest teilweise das Ergebnis einer Kombination aus einer relativ geringen Anzahl von primitiven Konstrukten und einer begrenzten Verwendung des Konzepts der Orthogonalität.
@stansifer_1995[S. 60f] @sebesta_2019[S. 46f]

// === Data Types
=== Datentypen

// Readability can be increased even more by allowing users to define adequate data types and data structures for specific use cases.
// This especially applies to Booleans and Enumerations.
// For example, in some languages that do not provide a Boolean type the following code could be used:
Die Lesbarkeit kann noch weiter verbessert werden, indem den Benutzern die Möglichkeit gegeben wird, geeignete Datentypen und Datenstrukturen zu definieren.
Dies gilt insbesondere für Booleans und Enumerationen. @sebesta_2019[S. 47]
In einigen Sprachen, die keinen Boolean-Typen bieten, könnte z.B. der folgende Code verwendet werden:

```rym
let use_timeout = 1
```

// The meaning of this statement is unclear, whereas in a language that includes Boolean types, the following would be used:
Die Bedeutung dieser Anweisung ist unklar, #TODO[Explain why it is unclear (time in ms/s vs truthy value)] und kann in einer Sprache mit Boolean-Typen wesentlich klarer dargestellt werden:

```rym
let use_timeout = True
```

#pagebreak()

=== Syntax <sec-syntax>

// Syntax greatly impacts the readability of programs.
// It refers to the rules and structure of a programming language.
// These rules define how a program must be written including the arrangement and formation of statements, expressions, keywords, punctuation.

// As is advantageous if not everything is completely new when getting to know the language, as it can then be learned more quickly if you already know how to program.

// The readability of a program is greatly influenced by its syntax.
// Syntax refers to the set of rules and structure that dictate how a program must be written in a particular programming language.
// These rules define the order, construction and use of statements, expressions, keywords and punctuation within the language.
// It makes sense to apply the principles of simplicity and orthogonality here too.
// Therefore, elements of similar meaning should be written similarly.
// Having too many alternatives for writing code with the same meaning also violates orthogonality.
// Ultimately, however, the readability of a language depends on individual preferences and prior knowledge.
// Adopting parts of the syntax of well-known languages into a new one therefore makes a lot of sense.
Die Lesbarkeit eines Programms wird außerdem stark von seiner Syntax beeinflusst.
Syntax bezieht sich auf die Regeln und die Struktur, die vorgeben, wie ein Programm in einer bestimmten Programmiersprache geschrieben werden muss.
Diese Regeln definieren die Reihenfolge, den Aufbau und die Verwendung von Anweisungen, Ausdrücken, Schlüsselwörtern und Zeichensetzung innerhalb der Sprache.
Auch hier ist es sinnvoll, die Grundsätze der Einfachheit und Orthogonalität anzuwenden.
Daher sollten Elemente mit ähnlicher Bedeutung ähnlich geschrieben werden.
Zu viele Alternativen, um den Code mit der gleichen Bedeutung zu schreiben, verstoßen ebenfalls gegen die Orthogonalität.
Letztlich hängt die Lesbarkeit einer Sprache jedoch von individuellen Vorlieben und Vorkenntnissen ab.
Die Übernahme von Teilen der Syntax bekannter Sprachen in eine neue Sprache ist sinnvoll, da diese Teile bereits vielen bekannt sind.
@stansifer_1995[S. 61ff] @sebesta_2019[S. 48f]

// == Writability
== Schreibbarkeit <sec-writability>

// Writability is a measure of how easily a language can be used to create programs for a chosen problem domain.
// Most of the language characteristics that affect readability also affect writability.
// This follows directly from the fact that the process of writing a program requires the programmer to frequently reread the part of the program that they just wrote.

// As programming languages are usually based on english, which is written from left to right.
// Therefore it is beneficial if the syntax prevents having to jump around as much as possible.

// The ease with which a programming language can be used to write programs for a particular task is known as its writeability.
// The language characteristics that improve readability also contribute to its writability, because writing a program often involves re-reading parts of the code.
// In order to optimise writability it is desirable for the syntax to minimise the need for the programmer to jump around, which makes it easier to focus on writing code.
// This can be achieved by having a syntax based on a left-to-right reading direction, as in English.
Die Leichtigkeit, mit der eine Programmiersprache verwendet werden kann, um Programme für eine bestimmte Aufgabe zu schreiben, wird als ihre Schreibfähigkeit bezeichnet.
Die Sprachmerkmale, die die Lesbarkeit verbessern, tragen auch zu ihrer Schreibbarkeit bei.
Denn das Schreiben eines Programms erfordert häufig das erneute Lesen von Teilen des Codes.
Um die Schreibbarkeit zu optimieren sollte die Syntax dem Programmierer dabei helfen, so wenig wie möglich im Programm herumzuspringen.
Das macht es einfacher, sich auf das Schreiben des Codes zu konzentrieren.
Dies kann durch eine Syntax erreicht werden, die wie im Englischen
#TODO[Missing Footnote], // Englisch ist die Sprache in der die meisten Programmiersprachen geschrieben werden.
auf einer Leserichtung von links nach rechts basiert.
@sebesta_2019[S. 49ff]


// In addition to easy-to-understand syntax, it is important for a programming language to have a clear and simple structure.
// This allows a programmer to concentrate on one task at a time, rather than having to keep several concepts in their head at the same time.
// A language with a straightforward and intuitive structure reduces the mental effort required to write code, making it easier to focus on the task at hand and reducing the potential for errors.
// In other words, a language that minimises the number of things a programmer has to think about at once is a key factor in improving its writability.
Neben einer leicht verständlichen Syntax ist es für eine Programmiersprache wichtig, dass sie eine klare und einfache Struktur hat.
So kann sich ein Programmierer auf eine Aufgabe konzentrieren, anstatt mehrere Konzepte gleichzeitig im Kopf behalten zu müssen.
Dadurch verringert sich auch die Fehleranfälligkeit.
In anderen Worten: Eine Sprache sollte die Anzahl der Dinge minimieren, über die der Nutzer gleichzeitig nachdenken muss.
@sebesta_2019[S. 49ff]

// == Reliability
== Verlässlichkeit

// A program is said to be reliable if it performs as expected under all conditions and will continue to in the future.
Ein Programm gilt als zuverlässig, wenn es unter allen Bedingungen die erwartete Leistung erbringt und dies auch in Zukunft tun wird.
@sebesta_2019[S. 51]

// === Specification
=== Spezifikation

//  A programming language without a standardised specification can hardly be considered reliable.
// This specification is a set of rules that an implementation of the language must obey to ensure that programs behave as intended.
// It should cover all possible combinations of programming language features.
Eine Programmiersprache ohne eine standardisierte Spezifikation kann kaum als zuverlässig angesehen werden.
Bei dieser Spezifikation handelt es sich um eine Reihe von Regeln, die eine Implementierung der Sprache befolgen muss, um sicherzustellen, dass sich die Programme wie vorgesehen verhalten.
Sie sollte alle möglichen Kombinationen an Merkmalen der Programmiersprache abdecken.
@scott_2016[S. 615]

// In some cases, the behaviour of certain features may be poorly defined.
// This can lead to different implementations that produce different results.
// Some of the possible outcomes can be harmful and the implementations are not required to remain consistent across executions, versions, or levels of optimisation.
In einigen Fällen kann das Verhalten bestimmter Merkmale unzureichend definiert sein.
Dies kann zu verschiedenen Implementierungen führen, die unterschiedliche Ergebnisse liefern.
Einige der Ergebnisse können schädlich sein, da die Implementierungen nicht unbedingt über alle Ausführungen, Versionen oder Optimierungsstufen konsistent bleiben.
@iso_24772_1_2019[S. 21] @michell_2009[S. 190]

// Behaviours that are not mentioned in the specification are called _unspecified behaviour_, and _undefined behaviour_ if they are mentioned, but it is not defined how they behave.
// They pose a significant challenge to users of the language, as they cannot be sure how and whether their program will run.
// For this reason, a language should have as few of them as possible.
Verhaltensweisen, die in der Spezifikation nicht erwähnt werden, nennt man _unspezifiziertes Verhalten_.
_Undefiniertes Verhalten_ sind Verhaltensweisen, die zwar erwähnt werden, deren Verhalten aber nicht festgelegt ist.
Beide stellen eine große Herausforderung für die Benutzer der Sprache dar, da sie nicht sicher sein können, wie und ob ihr Programm ausgeführt wird.
Aus diesem Grund sollte eine Sprache möglichst wenige solcher Verhaltensweisen aufzeigen.
@iso_24772_1_2019[S. 21]

// === Open Source

// Open source programming languages are those whose source code is freely available for anyone to use, modify, and distribute. This can be a significant advantage for software development, as it allows for a wider range of people to contribute to the language, which can lead to more innovation and faster development. Additionally, open source languages allow for more transparency, which can improve trust in the language and the programs created with it.
// Future Proof

// A future-proof programming language is one that is designed to be able to evolve and adapt over time. This can be an important characteristic for a language to have, as it allows for the language to remain relevant and useful even as technology and programming practices change.

// One way that a language can be future-proof is by allowing for breaking changes. Breaking changes refer to changes that alter the way the language works in such a way that existing programs may no longer work as intended. While these changes can be disruptive in the short term, they can also be necessary for the language to evolve and adapt to new technology and programming practices.

// Another way that a language can be future-proof is by reserving keywords. Reserved keywords are words that are reserved for specific use in the language, and cannot be used as variable or function names. This can allow for the language to introduce new features and functionality without causing conflicts with existing programs.

// Overall, having a language that is future-proof allows for the language to stay relevant and useful for a longer period of time, thus making it more reliable for the development process.

// === Safety
=== Sicherheit

// Safety is also an important aspect of specification, as it helps to avoid undefined behavior and aliasing, which can lead to unexpected and unpredictable results. Type checking is another important aspect of specification, as it helps to ensure that the program is using the correct data types in the correct way, which can help to prevent errors and improve the overall reliability of the program.

// In addition to the security issues introduced by unspecified or undefined behaviour, there are other concerns that should be addressed to ensure the security of the program.
// One of these is mutable aliasing, which occurs when multiple variables reference the same memory location.
// This can result in unexpected changes to the data and can lead to bugs that are very difficult to detect.
// To mitigate these risks, the programming language can be designed with robust static analysis mechanisms, such as data/control flow analysis, bounds checking and type checking in mind.
// This ensures that the user's assumptions about the data being processed are correct, which helps to prevent bugs and improves the overall reliability of programs.
Zusätzlich zu den Sicherheitslücken, die durch unspezifiziertes oder undefiniertes Verhalten entstehen, gibt es weitere Probleme.
Diese sollten angegangen werden, um die Sicherheit des Programms zu gewährleisten.
Eines dieser Probleme ist das Aliasing, welches auftritt, wenn mehrere Variablen auf dieselbe Speicherstelle verweisen.
Dies kann zu unerwarteten Änderungen an den Daten führen und Fehler verursachen, die nur schwer zu erkennen sind.
Um diese Risiken zu mindern, kann die Programmiersprache mit robusten statischen Analysemechanismen entworfen werden, wie z.B. Daten-/Kontrollflussanalyse, Bounds- und Typ-Checking.
Dadurch wird sichergestellt, dass die Annahmen des Benutzers über die zu verarbeitenden Daten korrekt sind, was zur Vermeidung von Fehlern beiträgt und die Zuverlässigkeit von Programmen verbessert.
@sebesta_2019[S. 51ff] @iso_24772_1_2019[S. 81f] @iso_24772_1_2019[S. 37f] @iso_24772_1_2019[S. 16]

// === Future Proof
=== Zukunftssicherheit

// A programming language can be made future-proof by designing it with scalability and maintainability in mind.
// Technical debt can be kept under control by avoiding the use of overly complex constructs, and incorporating feedback from users and developers.
// Breaking changes to a language can make sense in order to address fundamental design issues or to incorporate new, game-changing technologies.
// However, such changes must be made carefully, as they can cause backward compatibility issues.
// The impact of breaking changes can be mitigated by considering the long-term implications of language design decisions.
// An example of this are reserved keywords, which programmers are not allowed to use for naming purposes.
// Many languages add keywords to this list that may be used in the future to avoid breaking changes later on.
Eine Programmiersprache kann zukunftssicher gemacht werden, indem sie mit Blick auf Skalierbarkeit und Wartungsfreundlichkeit entwickelt wird.
Technische Schulden können unter Kontrolle gehalten werden, indem übermäßig komplexe Konstrukte vermieden werden, und das Feedback von Benutzern und Entwicklern berücksichtigt wird.

Grundlegende Änderungen an einer Sprache können sinnvoll sein, um grundlegende Designprobleme zu beheben oder neue, bahnbrechende Technologien einzubinden.
Solche Änderungen müssen jedoch sorgfältig durchgeführt werden, da sie zu Problemen mit der Rückwärtskompatibilität führen können.
Die Auswirkungen von Änderungen können abgeschwächt werden, indem man die langfristigen Auswirkungen von Entscheidungen im Sprachdesign berücksichtigt.

Ein Beispiel hierfür sind reservierte Schlüsselwörter, die Programmierer nicht zur Namensgebung verwenden dürfen.
Viele Sprachen fügen dieser Liste Schlüsselwörter hinzu, die in der Zukunft verwendet werden könnten, um spätere grundlegende Änderungen zu vermeiden.
@sebesta_2019[S. 344]

// Portability

// Portability is another important characteristic of a programming language. A program that is portable can be easily adapted to different platforms and environments. This is especially important for programs that are intended to be used in multiple locations or by

// Certain languages (e.g., Smalltalk and Python) are sometimes referred to as
// “interpreted languages” because most of their semantic error checking must
// be performed at run time. Certain other languages (e.g., Fortran and C)
// are sometimes referred to as “compiled languages” because almost all of their
// semantic error checking can be performed statically. This terminology isn’t
// strictly correct: interpreters for C and Fortran can be built easily, and a com-
// piler can generate code to perform even the most extensive dynamic semantic
// checks. That said, language design has a profound effect on “compilability.”
// @scott_2016
