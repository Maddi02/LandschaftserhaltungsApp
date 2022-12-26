
# Landschaftsverwaltungsprojekt
Dieses Semsterprojekt der Hochschule Furtwangen ist in Koorperation mit dem Landschaftsverbund Tuttlingen entstanden.Dabei ging es darum, das der Verbund eine IOS App haben wollte, welche ihre Prozesse beschleunigt. Darunter fällt die Erstellung von Verträgen mit einem Landwirt.  Dieser bekommt Subvensionen anhand dessen wie er sein Feld bewirtschaftet. Deswegen kann man in der App zu den Verträgen Teilflächen hinzufügen. In diesen Flächen gibt man an, um welche Art von Bewirtschaftung es sich handelt. Des Weitern gibt man an, welche Pflanzenarten man gefunden hat. Zusätzlich kann man noch Information zu diesen Flächen eintragen. 

# Inhaltsverzeichnis
1. [Anleitung](#Anleitung)
2. [Schnittstellen](#Schnittstellen)
3. [Auf welcher Sprache basiert die App](#Auf welcher Sprache basiert die App?)
4. [Sicherstellung der Funktionalität](#Auf welcher Sprache basiert die App?)
5. [Auf welcher Sprache basiert die App](#Sicherstellung der Funktionalität)
6. [Probleme bei der Entwicklung](#Probleme bei der Entwicklung)
7. [Verteilung der Aufgaben](#Verteilung der Aufgaben)







# Anleitung
Wenn man die App startet wird dem Nutzer eine Onboarding Page angezeigt. Diese soll dazu dienen das dieser Sich in der App zu recht findet. 

Bild von Onboarding

Nachdem man das Onboarding erfolgreich abgeschlossen hat - landet man in der Hauptansicht der App. Dort gibt es nun verschiedene Möglichkeiten. Zum Einen kann man dort nun einen Vertrag anlegen

Bild vertrag anlegen

Des Weitern kann man dort seinen bisher angelegten Verträge sich anzeigen lassen. Inklusive der zugehörigen Teilflächen. 

Bild Vertrag verwalten

Das User Icon in der Hauptansicht dient dazu, sich ein Benutzerprofile anlegen zu können. Darunter zählt - Ein Nutzername, ein Bild. Aber auch der Import der CSV welche für die Artenzählung verwendet wird. Außerdem legt man dort fest, ob man die Pflanzenname auf Deutsch oder auf Latein haben will. 

Bild user view. 

Wenn der Nutzer sich nun die bereits angelegten Flächen anschauen will, hat er die Möglichkeit dies über den Knopf "Verträge Verwalten" zu tuen. Dort werden ihm nun die Verträge angezeigt - diese kann er sich auch sortiern lassen. Das dient dazu, dass der Nutzer die relevanten Verträge auf Einmal sieht.

Bild verträge. 

Die angelegten Verträge können nun auch Teilflächen beeinhalten. Auf diesen kann der Nutzer verschiedenen Aktion durchführen. Dazu zählen - Artzählung, Häufigkeitsschätzung, angelegte Information bearbeiten aber auch PDF und CSV exportieren. Um den Export dem Nutzer zu erleichten hat er die Möglichekeit dies über diveres Apps auf seinem Iphone zu versenden. 

Bild verschiedene Aktionen PDF etc

Um die Artenzählung dem Nutzer so einfach wie möglich zu machen, wird ihm eine Liste von Pflanzen angezeigt welche zu vor per CSV Importiert wurde. Diese Liste kann er durchsuchen mit Hilfe des Alphabets an der Seite. Damit ist es möglich eine Pflanze schneller zu finden. 

Bild Pflanzen ausswählen. 


Nachdem die Pflanzenzählung durchgeführt wurde wird dem Nutzer die Möglichekeit gegeben zusätzliche Informationen hinzuzufügen. 

Bild zzusätzliche Infos



# Schnittstellen 
Der Nutzer hat die Möglichkeit seine Bilder entweder von der iPhone Galerie zu importieren aber auch per iCloud Drive. 
Somit kann er die Bilder am PC bearbeiten und in seine iCloud hochladen und direkt in seine App einfügen. 
Des Weitern hat der Nutzer die Möglichkeit seine CSV Datein im iCloud Drive abzuspreichern aber auch eine CSV Datei aus dem iCloud Drive zu importieren.


Bild auswahl woher die Datei kommt




# Auf welcher Sprache basiert die App? 
Die App wurde mit zwei Sprachen entwickelt - Objective C und Swift. Der Grund für diese Sprachauswahl ist - Der "Kunde" wollte eine IOS App. Somit hat es Sinn gemacht die Sprachen zu verweden, welche von Apple primär genutzt werden. Es gäbe noch die Möglichkeit diese App mit Hilfe von Flutter bzw Dart oder Kotlin KMM zu entwickeln. Da aber keine Android App gefordert war, haben wir uns dazu entscheiden den "Apple Weg" zu gehen. Diese hatte den Vorteil dass wir Xcode als IDE verwenden konnten. Diese Entwicklungsumgebung hat eine Integration für den deploy zu App Store Connect. Diesen Dienst mussten wir nutzen um die App im App Store zu veröffentlichen. 


# Sicherstellung der Funktionalität
Die App wurde während der Entwicklung mehrmals von uns getestet. Somit konnten wir Fehler direkt von Anfang an beheben. Sobald einen neue Funktion hinzugefüht wurde haben wir die App auf die Handy der ITP´ler installiert. Dies konnten dann überprüfen, ob das UI ihren Ehrwartungen entspricht aber auch ob die App möglicherweise Fehler enthält welche wir nicht gefunden haben. Der Vorteil wenn Leute die App testen welche mit der Entwicklung nichts zutuen hatten ist folgender. Sie konnten die App so nutzen wie es der Entverbrauchen auch tuen würde. Im Gegensatz zu uns. Wir wussten was wir drücken mussten damit die App nicht abstützt. Schlussendlich haben wir die App auch außenstehenden Personen gegeben. Das Feedback von diesen wurde gesammelt und in die App übertragen. Dadurch haben wir nochmals neue Ideen bekommen wie die App benutzerfreundlicher wird. Hierzu wurde eine Google Forms Befragung durchgeführt. 




# Probleme bei der Entwicklung
Das wohl größte Problem war, dass Luca keinen eigene Mac besitzt. Da es aber nur möglich ist eine IOS App auf einem Mac zuentwicklen musst er die WING Fakultät nach einen Zugang zum Mac Labor fragen. Auf Grund von verschiendesten Gründen hat dies sehr lange gedauert. Was dazu geführt hat, dass er nur einen sehr geringen Beitrag zum Projekt leisten konnte. Schlussendlich wurde das Projekt primäre von Marc und Martin entwickelt. 


# Verteilung der Aufgaben 
Wie in "Probleme bei der Entwicklung" bereits erwähnt wurde die Hauptarbeit von Marc und Martin geleistet. Dabei wurden die Aufgaben ca 30 / 70 aufgeteilt. Dies sah leider bei Luca anders aus. Er kümmerte sich um folgende Punkte. Sortierung der Verträge, Frist Auswahl auf das Jahr beschränken, Vorlage zur iCloud Schnittstelle. Bezüglich der UI. Dort hat er 5 Überschriften im finalen Produkt bearbeitet. All dies kann dem Grund geschuldet sein, dass er keinen Mac besaß. Dazu muss man aber auch sagen, dass es 2 Monate gedauert hat bis sich um einen Zugang zum Mac Labor bemührt wurde. In dieser Zeit wurde die App schon entwicklet. Somit waren die Hauptaufgaben schon erledigt bzw. begonnen, zugewiesen. 
















