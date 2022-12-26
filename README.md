
# Landschaftsverwaltungsprojekt
Dieses Semsterprojekt der Hochschule Furtwangen ist in Koorperation mit dem Landschaftsverbund Tuttlingen entstanden.Dabei ging es darum, das der Verbund eine IOS App haben wollte, welche ihre Prozesse beschleunigt. Darunter fällt die Erstellung von Verträgen mit einem Landwirt.  Dieser bekommt Subvensionen anhand dessen wie er sein Feld bewirtschaftet. Deswegen kann man in der App zu den Verträgen Teilflächen hinzufügen. In diesen Flächen gibt man an, um welche Art von Bewirtschaftung es sich handelt. Des Weitern gibt man an, welche Pflanzenarten man gefunden hat. Zusätzlich kann man noch Information zu diesen Flächen eintragen. 

# Inhaltsverzeichnis
1. [Anleitung](#Anleitung)
2. [Schnittstellen](#Schnittstellen)
3. [Auf welcher Sprache basiert die App](#Auf-welcher-Sprache-basiert-die-App)
4. [Sicherstellung der Funktionalität](#Sicherstellung-der-Funktionalität)
5. [Probleme bei der Entwicklung](#Probleme-bei-der-Entwicklung)
6. [Verteilung der Aufgaben](#Verteilung-der-Aufgaben)
7. [Tracking der Aufgaben](#Tracking-der-Aufgaben)







# Anleitung
Wenn man die App startet wird dem Nutzer eine Onboarding Page angezeigt. Diese soll dazu dienen das dieser Sich in der App zu recht findet. 
<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/MainView.png" alt="alt text" width="200" />
</p>

Nachdem man das Onboarding erfolgreich abgeschlossen hat - landet man in der Hauptansicht der App. Dort gibt es nun verschiedene Möglichkeiten. Zum Einen kann man dort nun einen Vertrag anlegen
<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/NewContract.png" alt="alt text" width="200" />
</p>


Des Weitern kann man dort seinen bisher angelegten Verträge sich anzeigen lassen. Inklusive der zugehörigen Teilflächen. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/ContractOverview.png" alt="alt text" width="200" />
</p>

Das User Icon in der Hauptansicht dient dazu, sich ein Benutzerprofile anlegen zu können. Darunter zählt - Ein Nutzername, ein Bild. Aber auch der Import der CSV welche für die Artenzählung verwendet wird. Außerdem legt man dort fest, ob man die Pflanzenname auf Deutsch oder auf Latein haben will. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/UserView.png" alt="alt text" width="200" />
</p>


Die angelegten Verträge können nun auch Teilflächen beeinhalten. Auf diesen kann der Nutzer verschiedenen Aktion durchführen. Dazu zählen - Artzählung, Häufigkeitsschätzung, angelegte Information bearbeiten aber auch PDF und CSV exportieren.

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PossibleActions.png" alt="alt text" width="200" />
</p>

Um die Artenzählung dem Nutzer so einfach wie möglich zu machen, wird ihm eine Liste von Pflanzen angezeigt welche zu vor per CSV Importiert wurde. Diese Liste kann er durchsuchen mit Hilfe des Alphabets an der Seite. Damit ist es möglich eine Pflanze schneller zu finden. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PlantEstimation.png" alt="alt text" width="200" />
</p>

Nachdem die Pflanzenzählung durchgeführt wurde wird dem Nutzer die Möglichekeit gegeben zusätzliche Informationen hinzuzufügen. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PlantEstimationInfo.png" alt="alt text" width="200" />
</p>

Um den Export dem Nutzer zu erleichten hat er die Möglichekeit dies über diveres Apps auf seinem Iphone zu versenden. 
<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PossibleShareActions.png" alt="alt text" width="200" />
</p>

# Schnittstellen 
Der Nutzer hat die Möglichkeit seine Bilder entweder von der iPhone Galerie zu importieren aber auch per iCloud Drive. 
Somit kann er die Bilder am PC bearbeiten und in seine iCloud hochladen und direkt in seine App einfügen. 
Des Weitern hat der Nutzer die Möglichkeit seine CSV Datein im iCloud Drive abzuspreichern aber auch eine CSV Datei aus dem iCloud Drive zu importieren.


Bild auswahl woher die Datei kommt




# Auf welcher Sprache basiert die App
Die App wurde mit zwei Sprachen entwickelt - Objective C und Swift. Der Grund für diese Sprachauswahl ist - Der "Kunde" wollte eine IOS App. Somit hat es Sinn gemacht die Sprachen zu verweden, welche von Apple primär genutzt werden. Es gäbe noch die Möglichkeit diese App mit Hilfe von Flutter bzw Dart oder Kotlin KMM zu entwickeln. Da aber keine Android App gefordert war, haben wir uns dazu entscheiden den "Apple Weg" zu gehen. Diese hatte den Vorteil dass wir Xcode als IDE verwenden konnten. Diese Entwicklungsumgebung hat eine Integration für den deploy zu App Store Connect. Diesen Dienst mussten wir nutzen um die App im App Store zu veröffentlichen. 


# Sicherstellung der Funktionalität
Die App wurde während der Entwicklung mehrmals von uns getestet. Somit konnten wir Fehler direkt von Anfang an beheben. Sobald einen neue Funktion hinzugefüht wurde haben wir die App auf die Handy der ITP´ler installiert. Dies konnten dann überprüfen, ob das UI ihren Ehrwartungen entspricht aber auch ob die App möglicherweise Fehler enthält welche wir nicht gefunden haben. Der Vorteil wenn Leute die App testen welche mit der Entwicklung nichts zutuen hatten ist folgender. Sie konnten die App so nutzen wie es der Entverbrauchen auch tuen würde. Im Gegensatz zu uns. Wir wussten was wir drücken mussten damit die App nicht abstützt. Schlussendlich haben wir die App auch außenstehenden Personen gegeben. Das Feedback von diesen wurde gesammelt und in die App übertragen. Dadurch haben wir nochmals neue Ideen bekommen wie die App benutzerfreundlicher wird. Hierzu wurde eine Google Forms Befragung durchgeführt. 




# Probleme bei der Entwicklung
Das wohl größte Problem war, dass Luca keinen eigene Mac besitzt. Da es aber nur möglich ist eine IOS App auf einem Mac zuentwicklen musst er die WING Fakultät nach einen Zugang zum Mac Labor fragen. Auf Grund von verschiendesten Gründen hat dies sehr lange gedauert. Was dazu geführt hat, dass er nur einen sehr geringen Beitrag zum Projekt leisten konnte. Schlussendlich wurde das Projekt primäre von Marc und Martin entwickelt. 


# Verteilung der Aufgaben 
Wie in "Probleme bei der Entwicklung" bereits erwähnt wurde die Hauptarbeit von Marc und Martin geleistet. Dabei wurden die Aufgaben ca 40 / 60 aufgeteilt. Dies sah leider bei Luca anders aus. Er kümmerte sich um folgende Punkte. Sortierung der Verträge, Frist Auswahl auf das Jahr beschränken, Vorlage zur iCloud Schnittstelle. Bezüglich der UI. Dort hat er 5 Überschriften im finalen Produkt bearbeitet. All dies kann dem Grund geschuldet sein, dass er keinen Mac besaß. Dazu muss man aber auch sagen, dass es 2 Monate gedauert hat bis sich um einen Zugang zum Mac Labor bemührt wurde. In dieser Zeit wurde die App schon entwicklet. Somit waren die Hauptaufgaben schon erledigt bzw. begonnen, zugewiesen. 


# Tracking der Aufgaben
Die Tasks und Subtasks, welche zu bearbeiten waren, wurden über ein Trello-Board verwaltet. Untergliedert in "TO-DO", "NICE TO HAVEs", "IN BEARBEITUNG", "REVIEW", "DONE", "NICHT MEHR NÖTIG" und "UNNÖTIG".

TO-DO: Welche Tasks sind noch zu erledigen.
NICE TO HAVE: Aufgaben, die die App erfüllen kann, aber nicht unbedingt muss
IN BEARBEITUNG: Tasks, die aktuell bearbeitet werden.
REVIEW: Tasks, die bearbeitet wurden und in den Master gemerged werden sollen.
DONE: Erledigte Tasks.
NICHT MEHR NÖTIG: Tasks, die durch Abstimmungen mit dem Landschaftsschutzverband nicht mehr umzusetzen ist.
UNNÖTIG: Tasks, die zuviel eingestellt wurden.

Übersicht der Tasks:
https://trello.com/b/JR6x8QdX/landschaftsverwaltung

# Umfrage zur Benutzerbarkeit der APP

Die Bewertung 1 bedeutet - stimme ich überhaupt nicht zu
Die Bewertung 2 bedeutet - stimme ich nicht zu
Die Bewertung 3 bedeutet - neutral
Die Bewertung 4 bedeutet - stimme ich überwiegend zu
Die Bewertung 5 bedeutet - stimme ich voll zu



|Zeitstempel        |Die App erscheint mir unnötig kompliziert.|Ich finde, die App ist einfach zu benutzen.|Ich denke, ich bräuchte technische Unterstützung um die App nutzen zu können|Ich finde, dass die verschiedenen Funktionen der App gut integriert sind.|Die App erscheint mir zu uneinheitlich.|Ich glaube, dass die meisten Leute die Benutzung der App schnell erlernen können.|Die App erscheint mir sehr umständlich zu benutzen.|Ich fühle mich bei der Benutzung der App sehr sicher.|Ich musste einiges lernen, um mit der App zurecht zu kommen.|Ich denke, ich würde die App regelmäßig nutzen.|
|-------------------|------------------------------------------|-------------------------------------------|----------------------------------------------------------------------------|-------------------------------------------------------------------------|---------------------------------------|---------------------------------------------------------------------------------|---------------------------------------------------|-----------------------------------------------------|------------------------------------------------------------|-----------------------------------------------|
|20.12.2022 11:33:39|1                                         |5                                          |1                                                                           |5                                                                        |5                                      |5                                                                                |1                                                  |4                                                    |2                                                           |4                                              |
|20.12.2022 13:39:42|1                                         |5                                          |1                                                                           |4                                                                        |1                                      |5                                                                                |1                                                  |5                                                    |1                                                           |5                                              |
|20.12.2022 16:12:09|2                                         |4                                          |1                                                                           |4                                                                        |2                                      |5                                                                                |2                                                  |4                                                    |1                                                           |3                                              |
|20.12.2022 20:42:51|1                                         |4                                          |1                                                                           |4                                                                        |4                                      |3                                                                                |1                                                  |4                                                    |4                                                           |3                                              |
|20.12.2022 23:05:01|1                                         |5                                          |1                                                                           |5                                                                        |2                                      |5                                                                                |1                                                  |5                                                    |1                                                           |4                                              |
|23.12.2022 09:02:36|1                                         |5                                          |3                                                                           |4                                                                        |1                                      |4                                                                                |2                                                  |5                                                    |3                                                           |3                                              |
|23.12.2022 23:47:02|2                                         |4                                          |2                                                                           |4                                                                        |2                                      |4                                                                                |1                                                  |5                                                    |2                                                           |3                                              |
|24.12.2022 07:23:58|4                                         |4                                          |1                                                                           |4                                                                        |1                                      |4                                                                                |2                                                  |4                                                    |2                                                           |4                                              |
|24.12.2022 22:31:05|1                                         |5                                          |1                                                                           |5                                                                        |1                                      |5                                                                                |1                                                  |5                                                    |1                                                           |5                                              |
|25.12.2022 15:31:58|1                                         |5                                          |2                                                                           |3                                                                        |2                                      |5                                                                                |1                                                  |5                                                    |2                                                           |4                                              |
|26.12.2022 08:45:16|1                                         |5                                          |1                                                                           |5                                                                        |1                                      |5                                                                                |1                                                  |5                                                    |1                                                           |5                                              |
|26.12.2022 11:47:20|1                                         |5                                          |1                                                                           |5                                                                        |1                                      |5                                                                                |1                                                  |5                                                    |1                                                           |5                                              |


Anhand unsere Auswertung nach der SuS - Methode konnten wir vestellen, dass die App den meistern Nutzer zusagt. Mit Hilfe des Onboardings konnten die Nutzer die App selbstständig benutzen. Zusammengefasst - die Auswertung ergab, dass wir als Entwickler keinen Handlungsbedarf für weitere Änderungen sehen. 










