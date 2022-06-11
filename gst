podnieś banan
otwórz beczka
n
rozmawiaj Bobo
tak
podnieś zepsuty_karabin
rozmawiaj Koko
tak
w
rozmawiaj Uebe
n
rozmawiaj Gnom
człowiek
rozmawiaj Uebe
atakuj Uebe
w
e
e
s
rozmawiaj Pająk
atakuj Pająk
podnieś portfel
n
w
w
rozmawiaj Uebe
e
e
n
otwórz skrzynia
wyjmij Excaliber z skrzynia
s
e
rozmawiaj Andrzej
e
atakuj Andrzej
podnieś klucz_do_fortu
e
w
w
w
rozmawiaj Koko
w
rozmawiaj Uebe
"The quest of Bananine
Jakub Budrewicz
Marcel Jarosz
Przemysław Rozwałka
2022"

Object subclass: Game [
    | isGameOver 
      location 
      locationPaths 
      locationDesc 
      inventory 
      itemsAtLocations 
      npcsAtLocations
      containersAtLocations 
      tasks
      finishedTasks
      skills 
      npcDialogs |

    "tasks"

    taskTrial := 'przejdź próbę w jaskini próby'.

    taskTalkUebe := 'porozmawiaj z Uebe'.

    taskKillBadGuys := 'zabij kłusowników'.

    taskAttackUebe := 'zaatakuj Uebe zaklęciem Potassium'.

    taskFindWallet := 'odzyskaj portfel Uebe z jaskini Kobry'.

    introductionText := #(
     'Jest rok 1950.'
     'Jesteś znanym poszukiwaczem przygód Robertem Gałązką.'
     'Niestety, podczas tej wyprawy w głąb afryki,'
     'twoja drużyna została schwytana przez tubylców.'
     'Jesteś skrępowany mocnymi sznurami,'
     'ostatnio straciłeś przytomność od mocnego uderzenia'
     'jakąś dziwną bronią obuchową.'
     'Czujesz, że zbliża się twój koniec,'
     'tubylcy pewnie cię zjedzą albo złożą w ofierze.'
     ''
     'Nagle jednak w dziczy zauważasz goryla, który zaczyna'
     'szarżować na twoich oprawców.'
     'Przerażeni ludzie uciekają w popłochu,'
     'Całkowicie o tobie zapominając.'
     'Upadasz na ziemię i tracisz przytomność.'
     ''
     '...po jakimś czasie budzisz się...'
     ''
    ).

    instructionsText := #(
     'Dostępne komendy:'
     ''
     'n,s,w,e                            -- idź w daną stronę'
     'gdzie jestem                       -- wyświetl informacje o miejscu'
     'pomoc                              -- wyświetl to menu'
     'koniec                             -- zakończ grę'
     'rozmawiaj <Postać>                 -- rozmawiaj z postacią'
     'atakuj <Postać>                    -- zaatakuj postać'
     'ekwipunek                          -- wyświetl ekwipunek'
     'postacie                           -- wyświetl postacie'
     'otwórz <Kontener>                  -- otwórz kontener'
     'umiejętności                       -- wyświetl umiejętności'
     'podnieś <Przedmiot>                -- podnieś przedmiot'
     'upuść <Przedmiot>                  -- upuść przedmiot'
     'wyjmij <Przedmiot> z <Kontener>    -- wyjmij przemiot z kontenera'
     'umieść <Przedmiot> w <Kontener>    -- włóż przedmiot do kontenera'
     'zadania                            -- wyświetl zadania'
     ''
    ).
 
    
    killBadGuysText := #(
    'z każdej strony widzisz uzbrojonych po zęby kłusowników.'
    'Na szczęście jesteś już pełnoprawnym wybrańcem i mistrzem sztuk walki Tiu-Fiu.'
    'Teraz dopełnia się twoje przeznaczenie.'
    'Kłusownicy otwierają ogień,'
    'ty jednak skutecznie unikasz wszystkich ich strzałów,'
    'w międzyczasie strzelając ze swojego pięknego Excalibra.'
    'W mgnieniu oka wszystkich dziesięciu kłusowników pada na ziemię'
    'a ty nabierasz jeszcze większej ochoty na banany z dżungli.'
    'Na zachodzie znajduje się wyjście.'
    ).

    dzunglaDesc := #(
    'Znajdujesz się w gęstej, ciemnej dżungli.'
    'Na północy znajduje się mała polanka która jest domem rodziny goryli.'
    ).

    rozwidlenieDesc := #(
    'Zbliżasz się do rozwidlenia świeżki.'
    'Na wschodzie wznosi się spory fort kłusowników,'
    'zaś na zachodzie znajduje się polanka Goryli.'
    'Na północy widzisz mroczny kamieniołom.'
    'Na południu dostrzegasz wejście do przerażającej jaskini Kobry'
     ).

    polankaDesc := #(
    'Zbliżasz się do sporej polanki,'
    'na której znajdują się dwa goryle z rodu Pumba.'
    'Potężny goryl Koko patrzy się na ciebie spokojnym wzrokiem.'
    'Mały Bobo skacze radośnie.'
    'Na południu znajduje się mroczna dżungla.'
    'Na wschodzie widzisz długą ścieżkę,'
    'a na zachodzie zjawiskowy klasztor Tiu-Fiu.'
     ).

    klasztorDesc := #(
    'Znajdujesz się w starożytnym budynku - sercu szkoły Tiu-Fiu.'
    'Po środku stoi mistrz starożytnych sztuk walki Tiu-Fiu - Uebe.'
    'Na wschodzie znajduje się Polanka goryli,'
    'a na północy jaskinia próby.'
     ).

    jprobyDesc := #(
    'Po wejściu do jaskini,'
    'wrota zamykają się za tobą.'
    'Po wielogodzinnej i ciężkiej tułaczce przez'
    'długą i głęboką jaskinię próby,'
    'odwodniony,'
    'głodny i zmęczony docierasz do dziwnego,'
    'ciemnego i oślizgłego pomieszczenia,'
    'całego pokrytego kurzem,'
    'pajęczynami,'
    'szkieletami i starymi książkami.'
    'Na fotelu zauważasz starego gnoma.'
     ).

    jkobryDesc := #(
    'Wchodzisz do ciemnej i przerażającej jaskini Kobry.'
    'Wyjście znajduje się na północy.'
    ).

    dziedziniecDesc := #(
    'Znajdujesz się przed wejściem fortu,'
    'które jest po twojej wschodniej stronie.'
    'Na zachodzie znajduje się ścieżka, z której przyszedłeś.'
    ).

    fortDesc := #(
    'Znajdujesz się na dziedzińcu fortu.'
    'Na zachodzie znajduje się wyjście.'
    ).

    kamieniolomDesc := #(
    'Stoisz po środku starego kamieniołomu,'
    'w głębi stoi ornamentna złota skrzynia.'
    'Na południu znajduje się wyjście.'
    ).

    kokoWelcome := #(
    'Witaj podróżniku! '
    'Niestety żyjemy w ciężkich czasach.'
    'Nasza rodzina stoi w obliczu zagłady!'
    'Źli kłusownicy polują na nas i robią z naszych skór dywany! '
    'Jeśli tak dalej pójdzie, to wszyscy zginiemy!'
    'Czy możesz nam pomóc?'
    'Na pewno zostaniesz sowicie nagrodzony bananami, jeśli ci się uda'
    ''
    '<tak/nie>'
    ).

    kokoUebeQuestion := #(
    'Czy porozmawiałeś już z Uebe?'
    ).

    kokoEndingPhrase := #(
    'Oto nasz wybawca Bananine!'
    ).

    kokoUebeQuestionNo := #(
    'A zatem wszyscy zginiemy!'
    ).

    kokoUebeQuestionYes := #(
    'Och, dziękuję!'
    'Powiadomię Uebe, mistrza starożytnych sztuk walki Tiu-Fiu'
    'o twojej dobroduszności, a na pewno ci pomoże!'
    'Poszukaj go na zachodzie.'
    ).

    gnomDefault := #(
    'SpAdAj StąD!!!1!!'
    ).

    gnomQuestion := #(
    'W starym forcie znowu wielka siła się zjawiła,'
    'kłusowników kiść dywanów wiele z nas zrobiła.'
    'Dnia takiego to mrocznego obudzi się w dżungli,'
    'Przedstawiciel brudnej, strasznej i złej rasy ludzi.'
    'Nie będzie to jednak postać zła, ani skalana,'
    'Lecz reinkarnacja naszego starożytnego Banana.'
    'Bananine - tak go zwać lud nasz prosty będzie,'
    'Jego osiągnięcia znane będą światu wszędzie.'
    ''
    'Taka przepowiednia widnieje na starożytnych freskach w moim domu Ghfjg,'
    'w górze Hasdkh.'
    'Ale niestety,'
    'przed każdym potencjalnym wybrańcem stoi test,'
    'którego zawalenie wiąże się ze strasznymi konsekwencjami.'
    '<gnom przystawia ci do czoła karabin AK-47>'
    'Jakie zwierzę chodzi rano na 4 nogach,'
    'na 2 w ciągu dnia i na 3 wieczorem?'
    ).

    gnomGoodAnswer := #(
    '<Zaskoczony gnom odstawia AK-47 na bok>'
    'Hmmmm....'
    'Ciekawa odpowiedź...'
    'Jeszcze nikt nie podał do tej pory sensownej odpowiedzi,'
    '<wskazuje palcem na stos szkieletów>'
    'ale twoja faktycznie zdaje się trzymać kupy.'
    'Uznajmy, że przeszedłeś tę próbę, człowieku.'
    '<Gnom uderza cię w głowę i tracisz przytomność>'
    '<Po jakimś czasie budzisz się w klasztorze Tiu-Fiu>'
    ).

    gnomBadAnswer := #(
    'Żaden z ciebie Bananine!'
    'GIŃ!'
    ).

    uebeNoKokoTask := #(
    'Ludzie nie mają czego szukać w tym świętym miejscu.'
    'Żegnam.'
    ).

    uebeGivingProbaTask := #(
    'Podobno chcesz nam pomóc... Hmmm...'
    'Być może przepowiednia ziści się w twojej osobie?'
    'W każdym razie, jeżeli twoja pomoc okaże się owocna,'
    'nagrodzę cię dożywotnim zapasem bananów.'
    'Jeśli chcesz nauczyć się sztuki Tiu-Fiu,'
    'musisz poprawnie przejść test w Jaskini Próby.'
    '<otwiera wrota jaskini próby>'
    'Nie martw się, to z pewnością bezpieczne.'
    ).

    uebeProbaTask := #(
    'Wejdź do jaskini próby!'
    'Przekonajmy się czy płynie w tobie krew Banana!'
    ).

    uebeAfterProba := #(
    'Interesujące...'
    'Jeśli pragniesz zostać moim uczniem i zgłębić tajniki Tiu-Fiu,'
    'najpierw udowodnij swoją wartość.'
    'Musisz odzyskać mój portfel ze starożytnej jaskini Kobry.'
    'Aby do niej dotrzeć, musisz skierować się na wschód.'
    'Wiele lat temu, złe pająki z rodu Kobry ukradły mi go.'
    'Jednak zanim pójdziesz - musisz nauczyć się zaklęcia Potassium;'
    'tylko wtedy pokonasz pająki z rodu Kobry, które gnieżdżą się w jaskini.'
    '<obsypuje cię potasem>'
    'Teraz, spróbuj rzucić na mnie zaklęcie Potassium! (zaatakuj Uebe)'
    ).

    uebeWalletTask := #(
    'Nie przychodź do mnie bez mojego portfela!'
    ).

    uebeAttackUebe := #(
    'Zaatakuj mnie zaklęciem Potassium!'
    ).

    uebeLearningTiuFiu := #(
    'Niesamowite!'
    'Udało ci się!'
    'Nareszcie mogę spłacić kredyt.'
    'Teraz nauczę cię walczyć w stylu Tiu-Fiu.'
    '<mija wiele miesięcy, a ty stajesz się coraz silniejszy...>'
    'Umiesz teraz sztukę walki Tiu-Fiu!'
    'Jednak wiedz,'
    'że sama umiejętność Tiu-Fiu nie pozwoli ci pokonać wszystkich kłusowników.'
    'Musisz jeszcze odnaleźć starożytny pistolet Luger Parabellum - Excaliber.'
    'On pozwoli ci pokonać złych zbrodniarzy.'
    'Oto starożytny klucz kiedyś znalazłem w zestawie Happy Meal - być może ci pomoże.'
    '... Powodzenia, przyjacielu.'
    ).

    uebeLearnedTiuFiu := #(
    'Czy odnalazłeś już mój stary pistolet Luger Parabellum - Excaliber?'
    'On pozwoli ci pokonać złych zbrodniarzy.'
    '...Powodzenia przyjacielu.'
    ).

    uebeEnding := #(
    'Oto nasz wybawca Bananine!!'
    'A oto twoja nagroda: dożywotni zapas bananów;'
    'możesz do końca życia żyć w naszej rodzinie i cieszyć się naszymi bananami.'
    'Pokój z tobą.'
    '<ZWYCIĘSTWO>'
    ).

    boboDefault := #(
    'U! U! A! A! AAAA!!'
    'BANANA!'
    ).

    andrzejDefault := #(
    'Nie rozmawiam z takimi jak ty!'
    'Wynoś się stąd, albo przerobię cię na dywan!'
    ).

    pajakDefault := #(
    'ASSHSHSHHSHSHHHHH!!!'
    ).

    "attacks"

    uebeAttackDefault := #(
    'Jak śmiesz!?'
    '<Uebe zabija cię magicznym zaklęciem Edudu>'
    ).

    uebeAttackTask := #(
    'Dobrze, jesteś gotowy.'
    'Skieruj się teraz na wschód i odzyskaj mój portfel.'
    ).

    boboAttack := #(
    'AAAAAAA!!!! - Bobo umiera.'
    'Zaskoczony Koko wyrywa ci ręce.'
    ).

    kokoAttack := #(
    'Koko patrzy na ciebie zaskoczony,'
    'jednym szybkim ruchem wyrywa ci wszystkie kończyny.'
    ).

    pajakKill := #(
    'Rzucasz na pająka zaklęcie mistrza Uebe - Potassium.'
    'Pająk momentalnie kurczy się do rozmiaru naparstka, a ty go rozdeptujesz.'
    'Zauważasz, że z pająka wypadł portfel mistrza Uebe.'
    ).

    pajakAttackDefault := #(
    'SSSDHHSHHSHSHSHHS'
    '<pająk z łatwością cię rozgniata na ścianie swoją wielką nogą>'
    ).

    andrzejKill := #(
    'Zastrzeliłeś łotrzyka Andrzeja.'
    'Z jego spodni wypadł klucz do fortu.'
    ).

    andrzejAttackDefault := #(
    'Andrzej jednym pchnięciem kłusowniczego sztyletu '
    'morduje cię i przerabia na dywan.'
    ).

    unkillableDefault := #(
    'HAHA, nie możesz mnie zabić.'
    ).

    Game class >> new [
        | g |
        g := super new.
        g init.
        ^g
    ]

    pickup: item [
        ((itemsAtLocations at: location) includes: item) ifTrue: [
            | itemsHere |
            itemsHere := (itemsAtLocations at: location) asSet.
            itemsHere remove: item.
            itemsAtLocations at: location put: itemsHere.
            inventory add: item.
            self printLinesNoCr: #('Podniosłeś '). 
            self printLines: (Array with: item).
            ^nil
        ].
        self printLines: #('Nie ma tu takiego przedmiotu' '')
    ]


    drop: item [
        (inventory includes: item) ifTrue: [
            inventory remove: item.
            (itemsAtLocations at: location) add: item.
            self printLinesNoCr: #('Upuściłeś '). 
            self printLines: (Array with: item).
            ^nil
        ].
        self printLines: #('Nie masz takiego przedmiotu' '')
    ]

    die [
        self printLines: #('Umarłeś' '').
        isGameOver := true
    ]

    win [
        self printLines: #('Zwycięstwo!!!' '').
        isGameOver := true
    ]


    noTaskYet: task [
        ^ ((tasks includes: task) | (finishedTasks includes: task)) not
    ]


    activeTask: task [
        ^ (tasks includes: task)
    ]

    finishedTask: task [
        ^ (finishedTasks includes: task)
    ]

    addTask: task [
        self printString: ''.
        self printString: ('Dodano nowe zadanie: ', task).
        tasks add: task
    ]

    finishTask: task [
        tasks remove: task.
        finishedTasks add: task.
        self printString: ''.
        self printString: ('Zadanie zakończone: ', task)
    ]

    removeFromInventory: item [
        inventory remove: item.
        self printString: ''.
        self printString: ('Przedmiot ', item, ' został usunięty z ekwipunku.')
    ]

    addToInventory: item [
        inventory add: item.
        self printString: ''.
        self printString: ('Przedmiot ', item, ' został dodany do ekwipunku.')
    ]
    
    newItem: item [
        | newLocationItems |
        newLocationItems := itemsAtLocations at: location asSet.
        newLocationItems add: item.
        itemsAtLocations at: location put: newLocationItems.
        self printString: ''.
        self printString: ('Możesz podnieść nowy przedmiot: ', item)
    ]

    addSkill: skill [
        skills add: skill.
        self printString: ''.
        self printString: ('Nowa umiejętność: ', skill)
    ]

    talk: npc [
        | npcsHere cmd |
        npcsHere := npcsAtLocations at: location.
        (npcsHere includes: npc) ifTrue: [

            "interactactive talks"

            (npc = 'Uebe') ifTrue: [
                (self noTaskYet: taskTalkUebe) ifTrue: [
                    self printLines: uebeNoKokoTask.
                    ^nil
                ].
                
                (self activeTask: taskTalkUebe) ifTrue: [
                    self printLines: uebeGivingProbaTask.
                    self finishTask: taskTalkUebe.
                    self addTask: taskTrial.
                    ^nil
                ].

                (self finishedTask: taskTrial) ifTrue: [
                    (self noTaskYet: taskAttackUebe) ifTrue: [
                        self printLines: uebeAfterProba.
                        self addTask: taskAttackUebe.
                        self addSkill: 'zaklęcie Potassium'.
                        ^nil
                    ].
                    (self activeTask: taskAttackUebe) ifTrue: [
                        self printLines: uebeAttackUebe.
                        ^nil
                    ].
                    (self activeTask: taskFindWallet) ifTrue: [
                        (inventory includes: 'portfel') ifTrue: [ 
                            self removeFromInventory: 'portfel'.
                            self addToInventory: 'klucz'.
                            self addSkill: 'Tiu Fiu'.
                            self finishTask taskFindWallet.
                            self addTask taskKillBadGuys.
                            ^nil
                        ].
                        self printLines: uebeWalletTask.
                        ^nil
                    ].
                    (self activeTask: taskKillBadGuys) ifTrue: [
                        self printLines: uebeLearnedTiuFiu.
                        ^nil
                    ].
                    (self finishedTask: taskKillBadGuys) ifTrue: [
                        self printLines: uebeEnding.
                        self win.
                        ^nil
                    ].
                    ^nil
                ].

                self printLines: uebeProbaTask.

                ^nil
            ]. 

            (npc = 'Gnom') ifTrue: [
                (self activeTask: taskTrial) ifTrue: [
                    self printLines: gnomQuestion.
                    cmd := self readCommand.
                    (cmd = 'człowiek') ifTrue: [
                        self printLines: gnomGoodAnswer.
                        location := 'klasztor'.
                        self finishTask: taskTrial.
                        self printLocationDescription.
                        ^nil
                    ].
                    self printLines: gnomBadAnswer.
                    self die.
                    ^nil
                ].
                self printLines: gnomDefault.
                ^nil
            ]. 

            (npc = 'Koko') ifTrue: [
                (self noTaskYet: taskTalkUebe) ifTrue: [
                    self printLines: kokoWelcome.
                    cmd := self readCommand.
                    (cmd = 'tak') ifTrue: [
                        self printLines: kokoUebeQuestionYes.
                        self addTask: taskTalkUebe.
                        ^nil
                    ].
                    self printLines: kokoUebeQuestionNo.
                    ^nil
                ].
                self printLines: kokoUebeQuestion.
                ^nil
            ]. 

            (npc = 'Bobo') ifTrue: [ " todo"
                self printLines: boboDefault.
                ^nil
            ]. 

            self printLines: (npcDialogs at: npc).

            ^nil
        ].
        self printLines: #('W tym miejscu nie ma takiej postaci') 
    ]

    attack: npc [
        | npcsHere cmd |
        npcsHere := npcsAtLocations at: location.
        (npcsHere includes: npc) ifTrue: [
            (npc = 'Uebe') ifTrue: [
                (self activeTask: taskAttackUebe) ifTrue: [
                    self printLines: uebeAttackTask.
                    self finishTask: taskAttackUebe.
                    self addTask: taskFindWallet.
                    ^nil
                ].
                self printLines: uebeAttackDefault.
                self die.
                ^nil
            ]. 

            (npc = 'Koko') ifTrue: [
                self printLines: kokoAttack.
                self die.
                ^nil
            ]. 

            (npc = 'Bobo') ifTrue: [
                self printLines: boboAttack.
                self die.
                ^nil
            ]. 

            (npc = 'Andrzej') ifTrue: [ 
                (inventory includes: 'Excaliber') ifTrue: [
                    self printLines: andrzejKill.
                    self newItem: 'klucz_do_fortu'.
                    ^nil
                ].
                self printLines: andrzejAttackDefault.
                self die.
                ^nil
            ]. 

            (npc = 'Pająk') ifTrue: [ 
                (skills includes: 'zaklęcie Potassium') ifTrue: [
                    self printLines: pajakKill.
                    self newItem: 'portfel'.
                    ^nil
                ].
                self printLines: pajakAttackDefault.
                self die.
                ^nil
            ]. 
            self printLines: unkillableDefault.
            ^nil
        ].
        self printLines: #('W tym miejscu nie ma takiej postaci').
        ^nil
    ]


    init [
        isGameOver := false.
        location := 'dżungla'.
        inventory := Set new.
        tasks := Set new.
        finishedTasks := Set new.
        skills := Set new.

        npcDialogs := Dictionary new.
        npcDialogs at: 'Andrzej' put: andrzejDefault.
        npcDialogs at: 'Pająk' put: pajakDefault.

        itemsAtLocations := Dictionary new.
        itemsAtLocations at: 'dżungla' put: #('banan').
        itemsAtLocations at: 'polanka' put: #().
        itemsAtLocations at: 'klasztor' put: #().
        itemsAtLocations at: 'jaskinia_próby' put: #().
        itemsAtLocations at: 'rozwidlenie' put: #().
        itemsAtLocations at: 'kamieniołom' put: #().
        itemsAtLocations at: 'jaskinia_kobry' put: #().
        itemsAtLocations at: 'dziedziniec' put: #().
        itemsAtLocations at: 'fort' put: #().

        npcsAtLocations := Dictionary new.
        npcsAtLocations at: 'dżungla' put: #().
        npcsAtLocations at: 'polanka' put: #('Koko' 'Bobo').
        npcsAtLocations at: 'klasztor' put: #('Uebe').
        npcsAtLocations at: 'jaskinia_próby' put: #('Gnom').
        npcsAtLocations at: 'rozwidlenie' put: #().
        npcsAtLocations at: 'kamieniołom' put: #().
        npcsAtLocations at: 'jaskinia_kobry' put: #('Pająk').
        npcsAtLocations at: 'dziedziniec' put: #('Andrzej').
        npcsAtLocations at: 'fort' put: #().


        containersAtLocations := Dictionary new.
        containersAtLocations at: 'dżungla' put: #('beczka').
        containersAtLocations at: 'polanka' put: #().
        containersAtLocations at: 'klasztor' put: #().
        containersAtLocations at: 'jaskinia_próby' put: #().
        containersAtLocations at: 'rozwidlenie' put: #().
        containersAtLocations at: 'kamieniołom' put: #('skrzynia').
        containersAtLocations at: 'jaskinia_kobry' put: #().
        containersAtLocations at: 'dziedziniec' put: #().
        containersAtLocations at: 'fort' put: #().

        locationPaths := Dictionary new.
        locationPaths at: 'dżungla' put: #(('n' 'polanka')).
        locationPaths at: 'polanka' put: #(('s' 'dżungla') ('w' 'klasztor') ('e' 'rozwidlenie')).
        locationPaths at: 'klasztor' put: #(('n' 'jaskinia_próby') ('e' 'polanka')).
        locationPaths at: 'jaskinia_próby' put: #(('s' 'klasztor')).
        locationPaths at: 'rozwidlenie' put: #(('w' 'polanka') ('n' 'kamieniołom') ('s' 'jaskinia_kobry') ('e' 'dziedziniec')).
        locationPaths at: 'kamieniołom' put: #(('s' 'rozwidlenie')).
        locationPaths at: 'jaskinia_kobry' put: #(('n' 'rozwidlenie')).
        locationPaths at: 'dziedziniec' put: #(('w' 'rozwidlenie') ('e' 'fort')).
        locationPaths at: 'fort' put: #(('w' 'dziedziniec')).

        locationDesc := Dictionary new.
        locationDesc at: 'polanka' put: polankaDesc.
        locationDesc at: 'dżungla' put: dzunglaDesc.
        locationDesc at: 'klasztor' put: klasztorDesc.
        locationDesc at: 'dziedziniec' put: dziedziniecDesc.
        locationDesc at: 'fort' put: fortDesc.
        locationDesc at: 'jaskinia_kobry' put: jkobryDesc.
        locationDesc at: 'jaskinia_próby' put: jprobyDesc.
        locationDesc at: 'kamieniołom' put: kamieniolomDesc.
        locationDesc at: 'rozwidlenie' put: rozwidlenieDesc.
    ]

    "Print strings from array in separate lines."

    printInventory [
        | argsDict |
        argsDict := Dictionary new.
        argsDict at: 'array' put: inventory.
        argsDict at: 'description' put: 'Ekwipunek:'.
        argsDict at: 'error' put: 'Nie masz nic w ekwipunku'.
        self printList: argsDict
    ]

    printSkills [
        | argsDict |
        argsDict := Dictionary new.
        argsDict at: 'array' put: skills.
        argsDict at: 'description' put: 'Umiejętności:'.
        argsDict at: 'error' put: 'Nie masz żadnych umiejętności :('.
        self printList: argsDict
    ]

    printNpcs [
        | argsDict |
        argsDict := Dictionary new.
        argsDict at: 'array' put: (npcsAtLocations at: location).
        argsDict at: 'description' put: 'Dostępne postacie:'.
        argsDict at: 'error' put: 'Nie ma tu żadnych postaci'.
        self printList: argsDict
    ]

    printTasks [ 
        | argsDict |
        argsDict := Dictionary new.
        argsDict at: 'array' put: tasks.
        argsDict at: 'description' put: 'Zadania:'.
        argsDict at: 'error' put: 'Brak aktywnych zadań'.
        self printList: argsDict.

        argsDict at: 'array' put: finishedTasks.
        argsDict at: 'description' put: 'Zadania:'.
        argsDict at: 'error' put: 'Nie zakończyłeś jeszcze żadnego zadania'.
        self printList: argsDict
    ]

    printList: argsDict [
        | array description error |
        description := (argsDict at: 'description').
        array := (argsDict at: 'array').
        ((array size) > 0) ifTrue: [
            Transcript show: description; cr.
        ].
        ((array size) = 0) ifTrue: [
            (argsDict includesKey: 'error') ifTrue: [
                error := (argsDict at: 'error').
                Transcript show: error; cr.
            ]
        ].
        array do: [ :string | Transcript show: ('- ', string); cr ]
    ]


    printString: string [
        Transcript show: string; cr 
    ]

    printStringNoCr: string [
        Transcript show: string
    ]

    printLines: anArray [
        anArray do: [ :string | Transcript show: string; cr ]
    ]

    printLinesNoCr: anArray [
        anArray do: [ :string | Transcript show: string ]
    ]

    printIntroduction [
       self printLines: introductionText.
    ]

    printInstructions [
        self printLines: instructionsText.
    ]

    readCommand [
        Transcript show: '> '.
        ^ FileStream stdin nextLine
    ]

    printLocationDescription [
        | items npcs containers printListArgs | 
        items := itemsAtLocations at: location.
        npcs := npcsAtLocations at: location.
        containers := containersAtLocations at: location.

        self printLines: (locationDesc at: location).
        printListArgs := Dictionary new.

        "print items"
        printListArgs at: 'array' put: items.
        printListArgs at: 'description' put: 'Możesz podnieść:'.
        self printList: printListArgs.

        "print npcs"
        printListArgs at: 'array' put: npcs.
        printListArgs at: 'description' put: 'Dostępne postacie:'.
        self printList: printListArgs.

        "print containers"
        printListArgs at: 'array' put: containers.
        printListArgs at: 'description' put: 'Kontenery:'.
        self printList: printListArgs.
    ]

    go: side [ 
        | paths |
        paths := locationPaths at: location.
        paths do: [ :dest |
            (dest at: 1) = side ifTrue: [
                location := (dest at: 2).
                self printLocationDescription.
                ^nil
            ]
        ].
        self printLines: #('Nie możesz tędy iść').
        ^nil
    ]

    "Run the game."
    run [
        | cmd isUnknown firstCmd cmdSize|

        self printIntroduction.
        self printLocationDescription.
        self printInstructions.


        "Game loop."
        [isGameOver] whileFalse: [
            isUnknown := true.
            cmd := self readCommand substrings: ' '.
            cmdSize := cmd size.

            (cmdSize > 0) ifTrue: [
                firstCmd := cmd at: 1.

                (cmdSize = 2) ifTrue: [
                    firstCmd = 'podnieś' ifTrue: [
                        self pickup: (cmd at: 2).
                        isUnknown := false
                    ].

                    firstCmd = 'upuść' ifTrue: [
                        self drop: (cmd at: 2).
                        isUnknown := false
                    ].

                    firstCmd = 'rozmawiaj' ifTrue: [
                        self talk: (cmd at: 2).
                        isUnknown := false
                    ].
     
                    firstCmd = 'atakuj' ifTrue: [
                        self attack: (cmd at: 2).
                        isUnknown := false
                    ].
     
                ].

                firstCmd = 'pomoc' ifTrue: [
                    self printInstructions.
                    isUnknown := false
                ].

                firstCmd = 'ekwipunek' ifTrue: [
                    self printInventory.
                    isUnknown := false
                ].

                firstCmd = 'zadania' ifTrue: [
                    self printTasks.
                    isUnknown := false
                ].

                firstCmd = 'gdzie' ifTrue: [
                    self printLocationDescription.
                    isUnknown := false
                ].

                firstCmd = 'umiejętności' ifTrue: [
                    self printSkills.
                    isUnknown := false
                ].

                firstCmd = 'postacie' ifTrue: [
                    self printNpcs.
                    isUnknown := false
                ].

                firstCmd = 'koniec' ifTrue: [
                    isGameOver := true.
                    isUnknown := false
                ].
                    
                (firstCmd = 'n') | (firstCmd = 's') | (firstCmd = 'e') | (firstCmd = 'w') ifTrue: [
                    self go: firstCmd.
                    isUnknown := false
                ].
            ].

            isUnknown ifTrue: [
                self printLines: #('Nieznana komenda' '')
            ]
        ]
    ]
]

Game new run.
