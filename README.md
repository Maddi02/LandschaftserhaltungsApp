
# Landschaftsverwaltungsprojekt
Dieses Semsterprojekt der Hochschule Furtwangen ist in Koorperation mit dem Landschaftsverbund Tuttlingen entstanden.Dabei ging es darum, dass der Verbund eine IOS App haben wollte, welche ihre Prozesse vereinfacht und beschleunigt. Darunter fällt die Erstellung von Verträgen mit einem Landwirt.  Dieser bekommt Subvensionen anhand dessen, wie er sein Feld bewirtschaftet. Deswegen kann man in der App zu den Verträgen Teilflächen hinzufügen. In diesen Flächen gibt man an, um welche Art von Bewirtschaftung es sich handelt. Des Weitern gibt man an, welche Pflanzenarten man gefunden hat. Zusätzlich kann man noch ergänzente Information zu diesen Flächen eintragen. 

# Inhaltsverzeichnis
1. [Anleitung](#Anleitung)
2. [Schnittstellen](#Schnittstellen)
3. [Auf welcher Sprache basiert die App](#Auf-welcher-Sprache-basiert-die-App)
4. [Sicherstellung der Funktionalität](#Sicherstellung-der-Funktionalität)
5. [Probleme bei der Entwicklung](#Probleme-bei-der-Entwicklung)
6. [Verteilung der Aufgaben](#Verteilung-der-Aufgaben)
7. [Tracking der Aufgaben](#Tracking-der-Aufgaben)
8. [Umfrage zur Benutzerbarkeit der APP](#Umfrage-zur-Benutzerbarkeit-der-APP)
9. [Bauen der App](#Bauen-der-App)
10. [Lizenz](#Lizenz)
11. [App Store](#AppStore)







# Anleitung
Wenn man die App startet, wird dem Nutzer eine Onboarding Page angezeigt. Diese soll dazu dienen das dieser sich in der App zu recht findet. 
<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/MainView.png" alt="alt text" width="200" />
</p>

Nachdem man das Onboarding erfolgreich abgeschlossen hat,landet man in der Hauptansicht der App. Dort gibt es nun verschiedene Möglichkeiten. Zum Einen kann man dort nun einen Vertrag anlegen
<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/NewContract.png" alt="alt text" width="200" />
</p>


Des Weitern kann man sich dort seinen bisher angelegten Verträge anzeigen lassen. Inklusive der zugehörigen Teilflächen. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/ContractOverview.png" alt="alt text" width="200" />
</p>

Das User Icon in der Hauptansicht dient dazu, sich ein Benutzerprofile anlegen zu können. Darunter zählt - Ein Nutzername, ein Bild. Aber auch der Import der CSV, welche für die Artenzählung verwendet wird. Außerdem legt man dort fest, ob man die Pflanzenname auf Deutsch oder auf Latein haben will. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/UserView.png" alt="alt text" width="200" />
</p>


Die angelegten Verträge können nun auch Teilflächen beeinhalten. Auf diesen kann der Nutzer verschiedenen Aktion durchführen. Dazu zählen - Artzählung, Häufigkeitsschätzung, angelegte Information bearbeiten aber auch PDF und CSV exportieren.

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PossibleActions.png" alt="alt text" width="200" />
</p>

Um die Artenzählung dem Nutzer so einfach wie möglich zu machen, wird ihm eine Liste von Pflanzen angezeigt welche zuvor per CSV importiert wurde. Diese Liste kann er mit Hilfe des Alphabets an der Seite durchsuchen. Damit ist es möglich eine Pflanze schneller zu finden. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PlantEstimation.png" alt="alt text" width="200" />
</p>

Nachdem die Pflanzenzählung durchgeführt wurde, wird dem Nutzer die Möglichkeit gegeben, zusätzliche Informationen hinzuzufügen. 

<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PlantEstimationInfo.png" alt="alt text" width="200" />
</p>

Um dem Nutzer den Export zu erleichtern, hat er die Möglichekeit, dies über diveres Apps auf seinem iPhone zu versenden. 
<p float="left">
  <img src="https://github.com/Maddi02/LandschaftserhaltungsApp/blob/master/Photos/PossibleShareActions.png" alt="alt text" width="200" />
</p>

# Schnittstellen 
Der Nutzer hat die Möglichkeit, seine Bilder entweder von der iPhone Galerie zu importieren aber auch per iCloud Drive. 
Somit kann er die Bilder am PC bearbeiten und in seine iCloud hochladen und direkt in seine App einfügen. 
Des Weitern hat der Nutzer die Möglichkeit, seine CSV Datein im iCloud Drive abzuspreichern aber auch eine CSV Datei aus dem iCloud Drive zu importieren.


# Auf welcher Sprache basiert die App
Die App wurde mit zwei Sprachen entwickelt - Objective C und Swift. Der Grund für diese Sprachauswahl ist - Der "Kunde" wollte eine IOS App. Somit hat es Sinn gemacht diese Sprachen zu verweden, welche von Apple primär genutzt werden. Es gäbe noch die Möglichkeit, diese App mit Hilfe von Flutter bzw. Dart oder Kotlin KMM zu entwickeln. Da aber keine Android App gefordert war, haben wir uns dazu entscheiden den "Apple Weg" zu gehen. Diese hatte den Vorteil, dass wir Xcode als IDE verwenden konnten. Diese Entwicklungsumgebung hat eine Integration für den Deploy zu App Store Connect. Diesen Dienst mussten wir nutzen, um die App im App Store zu veröffentlichen. 


# Sicherstellung der Funktionalität
Die App wurde während der Entwicklung mehrmals von uns getestet. Somit konnten wir Fehler direkt von Anfang an beheben. Sobald einen neue Funktion hinzugefüht wurde, haben wir die App auf die Handy's der ITP´ler installiert. Diese konnten dann überprüfen, ob das UI ihren Ehrwartungen entspricht aber auch ob die App möglicherweise Fehler enthält, welche wir nicht gefunden haben. Der Vorteil wenn Leute die App testen, welche mit der Entwicklung nichts zu tun hatten ist folgender. Sie konnten die App so nutzen, wie es der Entverbrauchen auch tun würde. Im Gegensatz zu uns. Wir wussten, was wir drücken mussten, damit die App nicht abstützt. Schlussendlich haben wir die App auch außenstehenden Personen gegeben. Das Feedback von diesen wurde gesammelt und in die App übertragen. Dadurch haben wir nochmals neue Ideen bekommen wie die App benutzerfreundlicher wird. Hierzu wurde eine Google Forms Befragung durchgeführt. 

# Probleme bei der Entwicklung
Das wohl größte Problem war, dass man einen Mac für eine iOS Appentwicklung benötigt. Da dies nicht bei jedem aus unserem Team gegeben war, mussten wir einen Weg finden, wie wir dem Problem entgegen wirken. Die Lösung war, dass wir einen Zugang zum Mac-Labor bekommen hatten. Das andere schwerwiegende Problem war - die App in den Apple App Store zu bekommen. Dazu mussten wir uns mit den Apple Guidelines auseinader setzen. Nachdem wir zum ersten Mal die App in das Review bei Apple gegeben hatten, wurde diese von Apple abgelehnt. Als wir das Feedback von Apple bekamen, dass die UI nicht ihren Richtlinen entsprach, mussten wir uns internsiv mit dem Thema auseinadersetzen, was Apple genau will. Im Anschluss mussten wir die Anforderungen Apple seitig umsetzen. Was nochmals zu einem Mehraufwand gefüht hatte. So ging das Ganze mehrmals hin und her. Bis wir schlussendlich die Zusage von Apple erhalten hatten, dass die App nun ihren Richtlinen entsprach - und somit nun im Apple App Store verfügbar ist.  


# Verteilung der Aufgaben 
Im großen und Ganzen wurde die App zwischen uns AIN´lern gemeinsam entwickelt. Dies war vorallem von Vorteil, da jeder seine Gebiete hatte, um welche er sich gekümmert hat. Somit konnte man zusammen kontinuierlich die App entwickeln, was zu einem effektiven Workflow geführt hatte. Außerdem war es dadurch möglich, die Anforderungen des Landschaftserhaltungsverband umzusetzen - selbst wenn während des Projekt noch Wünsche des Verbandes dazu kamen.  


# Tracking der Aufgaben
Die Tasks und Subtasks, welche zu bearbeiten waren, wurden über ein Trello-Board verwaltet. Untergliedert in "TO-DO", "NICE TO HAVEs", "IN BEARBEITUNG", "REVIEW", "DONE", "NICHT MEHR NÖTIG" und "UNNÖTIG".

TO-DO: Welche Tasks sind noch zu erledigen. <br> 
NICE TO HAVE: Aufgaben, die die App erfüllen kann, aber nicht unbedingt muss. <br> 
IN BEARBEITUNG: Tasks, die aktuell bearbeitet werden. <br> 
REVIEW: Tasks, die bearbeitet wurden und in den Master gemerged werden sollen. <br> 
DONE: Erledigte Tasks. <br> 
NICHT MEHR NÖTIG: Tasks, die durch Abstimmungen mit dem Landschaftsschutzverband nicht mehr umzusetzen sind. <br> 
UNNÖTIG: Tasks, die zuviel eingestellt wurden. <br>  



[Übersicht der Tasks](https://trello.com/b/JR6x8QdX/landschaftsverwaltung)

# Umfrage zur Benutzerbarkeit der APP

Die Bewertung 1 bedeutet - stimme ich überhaupt nicht zu <br> 
Die Bewertung 2 bedeutet - stimme ich nicht zu <br> 
Die Bewertung 3 bedeutet - neutral <br> 
Die Bewertung 4 bedeutet - stimme ich überwiegend zu <br> 
Die Bewertung 5 bedeutet - stimme ich voll zu <br> 



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



# Bauen der App

1. Clone das Projekt

```bash
  git clone https://github.com/Maddi02/LandschaftserhaltungsApp.git
```

2. Gehe in den Ordner, wo Sie ihr Projekt geclont haben

```bash
  cd LandschaftserhaltungsApp
``` 
3. Öffnen Sie in XCode oder AppCode die .xcodeproj Datei
4. Das Projekt sollte nun automatisch von Ihrere IDE gebaut werden. 


## Lizenz

[MIT](https://choosealicense.com/licenses/mit/)

# AppStore
Nachdem Apple die App gründlich geprüft hat, können wir nun unser Projekt über den Apple App Store vertreiben. Somit bietet die App einen Mehrwert für die Landschaftspflegeverbande welche die gleichen Aufgaben durchführen wie der Landschaftserhaltungsverband Tuttlingen.

[Link zur App](https://apps.apple.com/de/app/lpr/id1660222879?l=en)



