= Eigenschaften von Programmiersprachen

Eine Liste dieser Art ist umstritten, da es unterschiedliche Meinungen über den Wert jeder bestimmten Spracheigenschaft im Vergleich zu anderen gibt. Obwohl es auch aufgrund der Unterschiedlichen Anwendungsbereiche einer Programmiersprache keine allgemeingültigen Vorteile gibt, werden die folgenden Kriterien häufig genannt.
@stansifer_1995[S. 60], @sebesta_2019[S. 41]

== Lesbarkeit <sec-readability>

Ein wichtiges Kriterium für die Beurteilung einer Programmiersprache ist die Leichtigkeit, mit der Programme gelesen und verstanden werden können.
Der in unserer neuen Sprache geschriebene Quellcode wird öfter gelesen als geschrieben und Wartungen, bei welchen viel gelesen wird, sind ein wichtiger Teil des Entwicklungsprozesses.
Da die Wartungsfreundlichkeit zu einem großen Teil durch die Lesbarkeit von Programmen bestimmt wird, ist sie eine wichtige Maßnahme zur Verbesserung der Qualität von Programmen und Programmiersprachen.
In den folgenden Unterabschnitten werden Merkmale beschrieben, die zur Lesbarkeit einer Programmiersprache beitragen.
@sebesta_2019[S. 42f]

=== Einfachheit

Die allgemeine Einfachheit einer Programmiersprache wirkt sich stark auf ihre Lesbarkeit aus.
Eine Sprache mit vielen Grundstrukturen ist schwerer zu verstehen als eine mit wenigen. Programmierer, die eine komplexe Sprache verwenden müssen, lernen oft nur eine Teilmenge der Sprache und ignorieren andere.
Probleme mit der Lesbarkeit treten immer dann auf, wenn der Programmverfasser eine andere Teilmenge gelernt hat als die, mit der der Leser vertraut ist.
@stansifer_1995[S. 61], @sebesta_2019[S. 43]

Weiterhin kann das Überladen von Operatoren, bei dem ein einzelner Operator viele verschiedene Implementierung haben kann, die Einfachheit beinflussen.
Das ist zwar oft sinnvoll, kann aber das Lesen erschweren, wenn Benutzern erlaubt wird, ihre eigenen Überladungen zu erstellen und sie dies nicht in einer vernünftigen Art und Weise tun.
Es ist jedoch durchaus akzeptabel, `+` zu überladen, um es sowohl für die Ganzzahl- als auch für die Gleitkommaaddition zu verwenden.
In diesem Fall vereinfachen Überladungen die Sprache, da sie die Anzahl der verschiedenen Operatoren reduzieren.
@sebesta_2019[S. 43f], @sebesta_2019[S. 664]

Eine dritte Charakteristik, welche die Einfachheit einer Programmiersprache negativ beeinträchtigt, ist das Vorhandensein zu vieler Möglichkeiten, dieselbe Operation auszuführen.
@sebesta_2019[S. 43]

Andererseits kann man es mit der Einfachheit auch übertreiben.
Beispielsweise sind Form und Bedeutung der meisten Assembler-Anweisungen sehr einfach.
Da komplexere Steueranweisungen fehlen, ist die Programmstruktur jedoch weniger offensichtlich.
Es werden mehr Anweisungen benötigt als in entsprechenden Programmen einer höheren Programmiersprache.
Die gleichen Argumente gelten auch für den weniger extremen Fall von Sprachen mit unzureichenden Kontroll- und Datenstrukturen.
@sebesta_2019[S. 44]

=== Orthogonalität

Orthogonalität _(griech. orthos „gerade, aufrecht, richtig, rechtwinklig“)_ in einer Programmiersprache bedeutet, dass eine kleine Menge von primitiven Konstrukten auf wenige Arten kombiniert werden können, um die Kontroll- und Datenstrukturen der Sprache aufzubauen.
Außerdem sollte jede mögliche Kombination von Primitiven legal und sinnvoll sein.
Ein Mangel an Orthogonalität führt also zu Ausnahmen an den Regeln der Sprache.
Je weniger Ausnahmen es gibt, desto leichter ist die Sprache zu lesen, zu verstehen und zu erlernen.
@sebesta_2019[S. 44ff]

Die Bedeutung eines orthogonalen Sprachelements ist unabhängig vom Kontext, in dem es in einem Programm vorkommt.
Alles kontextunabhängig zu machen, kann aber auch zu unnötiger Komplexität führen.
Da Sprachen eine große Anzahl von Primitiven benötigen, führt ein hoher Grad an Orthogonalität zu einer Explosion von Kombinationen.
Selbst wenn die Kombinationen einfach sind, erzeugt ihre Anzahl Komplexität.
Die Einfachheit einer Sprache ist daher zumindest teilweise das Ergebnis einer Kombination aus einer relativ geringen Anzahl von primitiven Konstrukten und einer begrenzten Verwendung des Konzepts der Orthogonalität.
@stansifer_1995[S. 60f], @sebesta_2019[S. 46f]

=== Datentypen

Die Lesbarkeit kann noch weiter verbessert werden, indem den Benutzern die Möglichkeit gegeben wird, geeignete Datentypen und Datenstrukturen zu definieren.
Dies gilt insbesondere für Booleans und Enumerationen. @sebesta_2019[S. 47]
In einigen Sprachen, die keinen Boolean-Typen bieten, könnte z.B. der folgende Code verwendet werden:

```hs
let use_timeout = 1
```

Die Bedeutung dieser Anweisung ist unklar, und kann in einer Sprache mit Boolean-Typen wesentlich klarer dargestellt werden:

```hs
let use_timeout = True
```

#pagebreak()

=== Syntax <sec-syntax>

Die Lesbarkeit eines Programms wird außerdem stark von seiner Syntax beeinflusst.
Syntax bezieht sich auf die Regeln und die Struktur, die vorgeben, wie ein Programm in einer bestimmten Programmiersprache geschrieben werden muss.
Diese Regeln definieren die Reihenfolge, den Aufbau und die Verwendung von Anweisungen, Ausdrücken, Schlüsselwörtern und Zeichensetzung innerhalb der Sprache.
Auch hier ist es sinnvoll, die Grundsätze der Einfachheit und Orthogonalität anzuwenden.
Daher sollten Elemente mit ähnlicher Bedeutung ähnlich geschrieben werden.
Zu viele Alternativen, um den Code mit der gleichen Bedeutung zu schreiben, verstoßen ebenfalls gegen die Orthogonalität.
Letztlich hängt die Lesbarkeit einer Sprache jedoch von individuellen Vorlieben und Vorkenntnissen ab.
Die Übernahme von Teilen der Syntax bekannter Sprachen in eine neue Sprache ist sinnvoll, da diese Teile bereits vielen bekannt sind.
@stansifer_1995[S. 61ff], @sebesta_2019[S. 48f]

== Schreibbarkeit <sec-writability>

Die Leichtigkeit, mit der eine Programmiersprache verwendet werden kann, um Programme für eine bestimmte Aufgabe zu schreiben, wird als ihre Schreibfähigkeit bezeichnet.
Die Sprachmerkmale, die die Lesbarkeit verbessern, tragen auch zu ihrer Schreibbarkeit bei.
Denn das Schreiben eines Programms erfordert häufig das erneute Lesen von Teilen des Codes.
Um die Schreibbarkeit zu optimieren sollte die Syntax dem Programmierer dabei helfen, so wenig wie möglich im Programm herumzuspringen.
Das macht es einfacher, sich auf das Schreiben des Codes zu konzentrieren.
Dies kann durch eine Syntax erreicht werden, die wie im Englischen
// TODO: [Englisch ist die Sprache in der die meisten Programmiersprachen geschrieben werden.],
auf einer Leserichtung von links nach rechts basiert. \
@sebesta_2019[S. 49ff]

Neben einer leicht verständlichen Syntax ist es für eine Programmiersprache wichtig, dass sie eine klare und einfache Struktur hat.
So kann sich ein Programmierer auf eine Aufgabe konzentrieren, anstatt mehrere Konzepte gleichzeitig im Kopf behalten zu müssen.
Dadurch verringert sich auch die Fehleranfälligkeit.
In anderen Worten: Eine Sprache sollte die Anzahl der Dinge minimieren, über die der Nutzer gleichzeitig nachdenken muss. \
@sebesta_2019[S. 49ff]

#pagebreak()

== Verlässlichkeit

Ein Programm gilt als zuverlässig, wenn es unter allen Bedingungen die erwartete Leistung erbringt und dies auch in Zukunft tun wird.
@sebesta_2019[S. 51]

=== Spezifikation

Eine Programmiersprache ohne eine standardisierte Spezifikation kann kaum als zuverlässig angesehen werden.
Bei dieser Spezifikation handelt es sich um eine Reihe von Regeln, die eine Implementierung der Sprache befolgen muss, um sicherzustellen, dass sich die Programme wie vorgesehen verhalten.
Sie sollte alle möglichen Kombinationen an Merkmalen der Programmiersprache abdecken.
@scott_2016[S. 615]

In einigen Fällen kann das Verhalten bestimmter Merkmale unzureichend definiert sein.
Dies kann zu verschiedenen Implementierungen führen, die unterschiedliche Ergebnisse liefern.
Einige der Ergebnisse können schädlich sein, da die Implementierungen nicht unbedingt über alle Ausführungen, Versionen oder Optimierungsstufen konsistent bleiben.
@iso_24772_1_2019[S. 21], @michell_2009[S. 190]

Verhaltensweisen, die in der Spezifikation nicht erwähnt werden, nennt man _unspezifiziertes Verhalten_.
_Undefiniertes Verhalten_ sind Verhaltensweisen, die zwar erwähnt werden, deren Verhalten aber nicht festgelegt ist.
Beide stellen eine große Herausforderung für die Benutzer der Sprache dar, da sie nicht sicher sein können, wie und ob ihr Programm ausgeführt wird.
Aus diesem Grund sollte eine Sprache möglichst wenige solcher Verhaltensweisen aufzeigen.
@iso_24772_1_2019[S. 21]

=== Sicherheit

Zusätzlich zu den Sicherheitslücken, die durch unspezifiziertes oder undefiniertes Verhalten entstehen, gibt es weitere Probleme.
Diese sollten angegangen werden, um die Sicherheit des Programms zu gewährleisten.
Eines dieser Probleme ist das Aliasing, welches auftritt, wenn mehrere Variablen auf dieselbe Speicherstelle verweisen.
Dies kann zu unerwarteten Änderungen an den Daten führen und Fehler verursachen, die nur schwer zu erkennen sind.
Um diese Risiken zu mindern, kann die Programmiersprache mit robusten statischen Analysemechanismen entworfen werden, wie z.B. Daten-/Kontrollflussanalyse, Bounds- und Typ-Checking.
Dadurch wird sichergestellt, dass die Annahmen des Benutzers über die zu verarbeitenden Daten korrekt sind, was zur Vermeidung von Fehlern beiträgt und die Zuverlässigkeit von Programmen verbessert.
@sebesta_2019[S. 51ff], @iso_24772_1_2019[S. 81f], @iso_24772_1_2019[S. 37f], \
@iso_24772_1_2019[S. 16]

=== Zukunftssicherheit

Eine Programmiersprache kann zukunftssicher gemacht werden, indem sie mit Blick auf Skalierbarkeit und Wartungsfreundlichkeit entwickelt wird.
Technische Schulden können unter Kontrolle gehalten werden, indem übermäßig komplexe Konstrukte vermieden werden, und das Feedback von Benutzern und Entwicklern berücksichtigt wird.

Grundlegende Änderungen an einer Sprache können sinnvoll sein, um grundlegende Designprobleme zu beheben oder neue, bahnbrechende Technologien einzubinden.
Solche Änderungen müssen jedoch sorgfältig durchgeführt werden, da sie zu Problemen mit der Rückwärtskompatibilität führen können.
Die Auswirkungen von Änderungen können abgeschwächt werden, indem man die langfristigen Auswirkungen von Entscheidungen im Sprachdesign berücksichtigt.

Ein Beispiel hierfür sind reservierte Schlüsselwörter, die Programmierer nicht zur Namensgebung verwenden dürfen.
Viele Sprachen fügen dieser Liste Schlüsselwörter hinzu, die in der Zukunft verwendet werden könnten, um spätere grundlegende Änderungen zu vermeiden.
@sebesta_2019[S. 344]
