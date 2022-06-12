"
The quest of Bananine

Jakub Budrewicz
Marcel Jarosz
Przemysław Rozwałka

2022
"

Object subclass: Game [
    | isGameOver 
      location 
      locationPaths 
      locationDesc 
      inventory 
      itemsAtLocations 
      npcsAtLocations
      containersAtLocations
      containers 
      tasks
      finishedTasks
      skills 
      npcDialogs |

    "tasks"
    taskTalkUebe := 'porozmawiaj z Uebe'.
    taskKillBadGuys := 'zabij kłusowników'.
    taskAttackUebe := 'zaatakuj Uebe zaklęciem Potassium'.
    taskFindWallet := 'odzyskaj portfel Uebe z jaskini Kobry'.
    taskTrial := 'przejdź próbę w jaskini próby'.


    "items"
    itemKlucz := 'klucz'.
    itemZepsutyKarabin := 'zepsuty_karabin'.
    itemPortfel := 'portfel'.
    itemKluczDoFortu := 'klucz_do_fortu'.
    itemBanan := 'banan'.
    itemZgnilyBanan := 'zgniły_banan'.
    itemExcaliber := 'Excaliber'.

    "skills"
    skillTiuFiu := 'Tiu Fiu'.
    skillPotassiumSpell := 'Zaklęcie Potassium'.


    introductionText := #(
     'Jest rok 1950.'
     'Jesteś znanym poszukiwaczem przygód Robertem Gałązką.'
     'Niestety, podczas tej wyprawy w głąb Afryki,'
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

    gnomTrialFinished := #(
    '<Gnom uderza cię w głowę i tracisz przytomność>'
    '<Po jakimś czasie budzisz się w klasztorze Tiu-Fiu>'
    ).

    gnomSeenGun := #(
    '<W ostatnim momencie przypominasz sobie o karabinie od Bobo>'
    '<Jednym ruchem wyciągasz karabin i przystawiasz go do głowy gnoma>'
    'Zaraz zaraz, skąd to masz?'
    'To legendarny złoty karabin mojego dziadka!'
    'Oddawaj to, i wynoś się'
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

    boboBananaQuestion := #(
    'BANANA!!! DAJ BANANA!'
    '<tak/nie>'
    ).

    boboRevealGun := #(
    'DOBRE! BANANA!'
    '<ucieszony Bobo wskazuje na broń ukrytą w trawie>'
    ).

    boboSad := #(
    'Bobo chce banan :('
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

    readCommand [
        Transcript show: '> '.
        ^ FileStream stdin nextLine
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
        self end.
    ]

    win [
        self printLines: #('Zwycięstwo!!!' '').
        self end.
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
        self printString: ('    * dodano nowe zadanie: ', task, ' *').
        self printString: ''.
        tasks add: task
    ]

    finishTask: task [
        tasks remove: task.
        finishedTasks add: task.
        self printString: ''.
        self printString: ('    * zadanie zakończone: ', task, ' *').
        self printString: ''
    ]

    removeFromInventory: item [
        inventory remove: item.
        self printString: ''.
        self printString: ('    * przedmiot ', item, ' został usunięty z ekwipunku.', ' *').
        self printString: ''
    ]

    addToInventory: item [
        inventory add: item.
        self printString: ''.
        self printString: ('    * przedmiot ', item, ' został dodany do ekwipunku.', ' *').
        self printString: ''
    ]
    
    newItem: item [
        | newLocationItems |
        newLocationItems := itemsAtLocations at: location.
        newLocationItems add: item.
        itemsAtLocations at: location put: newLocationItems.
        self printString: ''.
        self printString: ('    * możesz podnieść nowy przedmiot: ', item, ' *   ').
        self printString: ''
    ]

    addSkill: skill [
        skills add: skill.
        self printString: ''.
        self printString: ('    * nowa umiejętność: ', skill, ' *   ').
        self printString: ''

    ]

    kill: npc [
        | newNpcs |
        newNpcs := npcsAtLocations at: location.
        newNpcs remove: npc.
        npcsAtLocations at: location put: newNpcs
    ]


    talk: npc [
        | npcsHere cmd |
        npcsHere := npcsAtLocations at: location.
        (npcsHere includes: npc) ifTrue: [

            "interactive talks"

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
                        self addSkill: skillPotassiumSpell.
                        ^nil
                    ].
                    (self activeTask: taskAttackUebe) ifTrue: [
                        self printLines: uebeAttackUebe.
                        ^nil
                    ].
                    (self activeTask: taskFindWallet) ifTrue: [
                        (inventory includes: itemPortfel) ifTrue: [ 
                            self removeFromInventory: itemPortfel.
                            self addToInventory: itemKlucz.
                            self addSkill: skillTiuFiu.
                            self finishTask: taskFindWallet.
                            self addTask: taskKillBadGuys.
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
                    (inventory includes: itemZepsutyKarabin) ifTrue: [
                        self printLines: gnomSeenGun.
                        inventory remove: itemZepsutyKarabin.
                        location := 'klasztor'.
                        self printLines: gnomTrialFinished.
                        self printLocationDescription.
                        self finishTask: taskTrial.

                        ^nil
                    ].
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
                (self finishedTask: taskKillBadGuys) ifTrue: [
                    self printLines: kokoEndingPhrase.
                    ^nil
                ].
                self printLines: kokoUebeQuestion.

                ^nil
            ]. 

            (npc = 'Bobo') ifTrue: [ 
                (inventory includes: itemBanan) ifTrue: [
                    self printLines: boboBananaQuestion.
                    cmd := self readCommand.
                    (cmd = 'tak') ifTrue: [
                        self printLines: boboRevealGun.
                        inventory remove: itemBanan.
                        self newItem: itemZepsutyKarabin.
                        ^nil
                    ].
                    self printLines: boboSad.
                    ^nil
                ].
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
                (inventory includes: itemExcaliber) ifTrue: [
                    self printLines: andrzejKill.
                    self kill: 'Andrzej'.
                    self newItem: itemKluczDoFortu.
                    ^nil
                ].
                self printLines: andrzejAttackDefault.
                self die.
                ^nil
            ]. 

            (npc = 'Pająk') ifTrue: [ 
                (skills includes: skillPotassiumSpell) ifTrue: [
                    self printLines: pajakKill.
                    self kill: 'Pająk'.
                    self newItem: itemPortfel.
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
        | tmpSet emptySet |
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

        tmpSet := Set new.
        tmpSet add: 'banan'.
        itemsAtLocations at: 'dżungla' put: tmpSet.
        itemsAtLocations at: 'polanka' put: Set new.
        itemsAtLocations at: 'klasztor' put: Set new.
        itemsAtLocations at: 'jaskinia_próby' put: Set new.
        itemsAtLocations at: 'rozwidlenie' put: Set new.
        itemsAtLocations at: 'kamieniołom' put: Set new.
        itemsAtLocations at: 'jaskinia_kobry' put: Set new.
        itemsAtLocations at: 'dziedziniec' put: Set new.
        itemsAtLocations at: 'fort' put: Set new.

        npcsAtLocations := Dictionary new.
        npcsAtLocations at: 'dżungla' put: Set new.
        tmpSet := Set new.
        tmpSet add: 'Koko'.
        tmpSet add: 'Bobo'.
        npcsAtLocations at: 'polanka' put: tmpSet.
        tmpSet := Set new.
        tmpSet add: 'Uebe'.
        npcsAtLocations at: 'klasztor' put: tmpSet.
        tmpSet := Set new.
        tmpSet add: 'Gnom'.
        npcsAtLocations at: 'jaskinia_próby' put: tmpSet.
        npcsAtLocations at: 'rozwidlenie' put: Set new.
        npcsAtLocations at: 'kamieniołom' put: Set new.
        tmpSet := Set new.
        tmpSet add: 'Pająk'.
        npcsAtLocations at: 'jaskinia_kobry' put: tmpSet.
        tmpSet := Set new.
        tmpSet add: 'Andrzej'.
        npcsAtLocations at: 'dziedziniec' put: tmpSet.
        npcsAtLocations at: 'fort' put: Set new.

        containersAtLocations := Dictionary new.
        containersAtLocations at: 'dżungla' put:#('beczka').
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

        containers := Dictionary new.
        tmpSet := Set new.
        tmpSet add: itemZgnilyBanan.
        containers at: 'beczka' put: tmpSet.
        tmpSet := Set new.
        tmpSet add: itemExcaliber.
        containers at: 'skrzynia' put: tmpSet.
    ]

    "Print strings from array in separate lines."

    printInventory [
        self printArray: inventory description: 'Ekwipunek:' empty: 'Nie masz nic w ekwipunku'.
        self printString: ''
    ]

    printSkills [
        self printArray: skills description: 'Umiejętności:' empty: 'Nie masz żadnych umiejętności :('.
        self printString: ''
    ]

    printNpcs [
        self printArray: (npcsAtLocations at: location) description: 'Dostępne postacie:' empty: 'Nie ma tu żadnych postaci'.
        self printString: ''
    ]


    printTasks [ 
        self printArray: tasks description: 'Zadania:' empty: 'Brak aktywnych zadań'.
        self printArray: finishedTasks description: 'Ukończone zadania:' empty: 'Nie zakończyłeś jeszcze żadnego zadania'.
        self printString: ''
    ]

    open: container [
        ((self findAndOpenContainer: container) = nil) ifTrue: [
            ^nil.
        ].

        self printArray: (containers at: container) description: ('Zawartość ', container, ':') empty: 'Ten kontener jest pusty'.
        self printString: ''.
        ^nil.
    ]

    findAndOpenContainer: container [
        | containersHere |
        containersHere := (containersAtLocations at: location).
        (containersHere includes: container) ifFalse: [
            self printLines: #('Nie ma tu takiego kontenera' '').
            ^nil.
        ].
        (container = 'skrzynia') ifTrue: [
            (inventory includes: itemKlucz) ifFalse: [
                self printLines: #('Nie masz niczego co może otworzyć ten kontener' '').
                ^nil.
            ]
        ].
        ^container.
    ]

    takeOutItem: item from: container [
        | newItems |

        ((self findAndOpenContainer: container) = nil) ifTrue: [
            ^nil.
        ].

        newItems:= (containers at: container).
        (newItems includes: item) ifFalse: [
            self printString: ('W ', container, ' nie ma przedmiotu ', item).
            self printString: ''.
            ^nil
        ].
        newItems remove: item.
        containers at: container put: newItems.
        self addToInventory: item.
        ^nil.
    ]

    putItem: item into: container [ 
        | newItems |

        ((self findAndOpenContainer: container) = nil) ifTrue: [
            ^nil.
        ].

        newItems:= (containers at: container).
        (inventory includes: item) ifFalse: [
            self printString: ('Nie posiadasz przedmiotu ', item).
            self printString: ''.
            ^nil
        ].
        self removeFromInventory: item.
        newItems add: item.
        containers at: container put: newItems.
        ^nil.
    ]

    printArray: arr description: desc empty: err [
        ((arr size) > 0) ifTrue: [
            Transcript show: desc; cr.
        ].
        ((arr size) = 0) ifTrue: [
            (err = nil) ifFalse: [
                Transcript show: err; cr.
            ]
        ].
        arr do: [ :string | Transcript show: ('- ', string); cr ]
    ]

    printArray: arr description: desc [
        self printArray: arr description: desc empty: nil.
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

    printLocationDescription [
        | items npcs containers | 
        items := itemsAtLocations at: location.
        npcs := npcsAtLocations at: location.
        containers := containersAtLocations at: location.

        self printLines: (locationDesc at: location).
        self printString: ''.

        "print items"
        self printArray: items description: 'Możesz podnieść'.

        "print npcs"
        self printArray: npcs description: 'Dostępne postacie:'.

        "print containers"
        self printArray: containers description: 'Kontenery:'.

        self printString: ''.
    ]

    go: side [ 
        | paths destLoc |
        paths := locationPaths at: location.
        paths do: [ :dest |
            (dest at: 1) = side ifTrue: [
                destLoc := dest at: 2.
                (destLoc = 'fort') ifTrue: [
                    (inventory includes: itemKluczDoFortu) ifFalse: [
                        self printLines: #('Potrzebujesz klucza, aby tu wejść' '').
                        ^nil
                    ]
                ].
                location := destLoc.
                (location = 'fort') ifTrue: [
                    (tasks includes: taskKillBadGuys) ifTrue: [
                        self printLines: killBadGuysText.
                        self finishTask: taskKillBadGuys.
                    ]
                ].
                self printLocationDescription.
                ^nil
            ]
        ].
        self printLines: #('Nie możesz tędy iść').
        ^nil
    ]

    isGameOver [
        ^isGameOver.
    ]

    end [
        isGameOver := true.
    ]
]

Object subclass: GameRunner [
    runGame: game [
        | cmd isUnknown firstCmd cmdSize |

        game printIntroduction.
        game printLocationDescription.
        game printInstructions.


        "Game loop."
        [game isGameOver] whileFalse: [
            isUnknown := true.
            cmd := game readCommand substrings: ' '.
            cmdSize := cmd size.

            (cmdSize > 0) ifTrue: [
                firstCmd := cmd at: 1.

                (cmdSize = 2) ifTrue: [
                    firstCmd = 'podnieś' ifTrue: [
                        game pickup: (cmd at: 2).
                        isUnknown := false
                    ].

                    firstCmd = 'upuść' ifTrue: [
                        game drop: (cmd at: 2).
                        isUnknown := false
                    ].

                    firstCmd = 'otwórz' ifTrue: [
                        game open: (cmd at: 2).
                        isUnknown := false
                    ].

                    firstCmd = 'rozmawiaj' ifTrue: [
                        game talk: (cmd at: 2).
                        isUnknown := false
                    ].
     
                    firstCmd = 'atakuj' ifTrue: [
                        game attack: (cmd at: 2).
                        isUnknown := false
                    ].
     
                ].

                (cmdSize = 4) ifTrue: [
                    | argsDict container item |
                    argsDict := Dictionary new.
                    item := (cmd at: 2) asString.
                    container := (cmd at: 4) asString.

                    firstCmd = 'wyjmij' ifTrue: [
                        game takeOutItem: item from: container.
                        isUnknown := false
                    ].

                    firstCmd = 'umieść' ifTrue: [
                        game putItem: item into: container.
                        isUnknown := false
                    ].
                ].

                firstCmd = 'pomoc' ifTrue: [
                    game printInstructions.
                    isUnknown := false
                ].

                firstCmd = 'ekwipunek' ifTrue: [
                    game printInventory.
                    isUnknown := false
                ].

                firstCmd = 'zadania' ifTrue: [
                    game printTasks.
                    isUnknown := false
                ].

                firstCmd = 'gdzie' ifTrue: [
                    game printLocationDescription.
                    isUnknown := false
                ].

                firstCmd = 'umiejętności' ifTrue: [
                    game printSkills.
                    isUnknown := false
                ].

                firstCmd = 'postacie' ifTrue: [
                    game printNpcs.
                    isUnknown := false
                ].

                firstCmd = 'koniec' ifTrue: [
                    game end.
                    isUnknown := false
                ].
                    
                (firstCmd = 'n') | (firstCmd = 's') | (firstCmd = 'e') | (firstCmd = 'w') ifTrue: [
                    game go: firstCmd.
                    isUnknown := false
                ].
            ].

            isUnknown ifTrue: [
                game printLines: #('Nieznana komenda' '')
            ]
        ]
    ]
]

game := Game new.
GameRunner new runGame: game.
