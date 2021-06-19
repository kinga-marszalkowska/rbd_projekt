-- publishers --
INSERT INTO public.publisher (id, name) VALUES (1, 'rebel'); --1
INSERT INTO public.publisher (id, name) VALUES (2, 'Days of Wonder'); --2
INSERT INTO public.publisher (id, name) VALUES (3, 'mattel'); --3
INSERT INTO public.publisher (id, name) VALUES (4, 'What the frog'); --4
INSERT INTO public.publisher (id, name) VALUES (5, 'Black Monk'); --5
INSERT INTO public.publisher (id, name) VALUES (6, 'Awaken Realms'); --6
INSERT INTO public.publisher (id, name) VALUES (7, 'FryxGames'); --7

-- authors --
INSERT INTO public.author (id, name, surname) VALUES (1, 'Denis', 'Blanchot'); --1
INSERT INTO public.author (id, name, surname) VALUES (2, 'Guillaume', 'Gille-Naves'); --2
INSERT INTO public.author (id, name, surname) VALUES (3, 'Igor', 'Polouchine'); --3
INSERT INTO public.author (id, name, surname) VALUES (4, 'Krzysztof', 'Głośnicki'); --4
INSERT INTO public.author (id, name, surname) VALUES (5, 'Adam', 'Kwapiński'); --5
INSERT INTO public.author (id, name, surname) VALUES (6, 'Alan', 'R. Moon'); --6
INSERT INTO public.author (id, name, surname) VALUES (7, 'Matthew', 'Inman'); --7
INSERT INTO public.author (id, name, surname) VALUES (8, 'Vlaada', 'Chvátil'); --8
INSERT INTO public.author (id, name, surname) VALUES (9, 'Ramy', 'Badie'); --9
INSERT INTO public.author (id, name, surname) VALUES (10, 'Jacob', 'Fryxelius'); --10
INSERT INTO public.author (id, name, surname) VALUES (11, 'Steve Jackson Games', null); --11
INSERT INTO public.author (id, name, surname) VALUES (12, 'Marc', 'André'); --12

-- illustrators --
INSERT INTO public.illustrator (id, name, surname) VALUES (1, 'Katarzyna', 'Malinowska'); --1
INSERT INTO public.illustrator (id, name, surname) VALUES (2, 'Piotr', 'Foksowicz'); --2
INSERT INTO public.illustrator (id, name, surname) VALUES (3, 'Ewa', 'Labak'); --3
INSERT INTO public.illustrator (id, name, surname) VALUES (4, 'Patryk', 'Jędraszek'); --4
INSERT INTO public.illustrator (id, name, surname) VALUES (5, 'Paweł', 'Samborski'); --5
INSERT INTO public.illustrator (id, name, surname) VALUES (6, 'Piotr', 'Gacek'); --6
INSERT INTO public.illustrator (id, name, surname) VALUES (7, 'Andrzej', 'Półtoranos'); --7
INSERT INTO public.illustrator (id, name, surname) VALUES (8, 'Matthew', 'Inman'); --8
INSERT INTO public.illustrator (id, name, surname) VALUES (9, 'Tomáš', 'Kučerovský'); --9
INSERT INTO public.illustrator (id, name, surname) VALUES (10, 'Ramy', 'Badie'); --10
INSERT INTO public.illustrator (id, name, surname) VALUES (11, 'Isaac', 'Fryxelius'); --11
INSERT INTO public.illustrator (id, name, surname) VALUES (12, 'Pascal', 'Quidault'); --12

-- categories --
INSERT INTO public.category (id, name) VALUES (1, 'zręcznościowa'); --1
INSERT INTO public.category (id, name) VALUES (2, 'karciana'); --2
INSERT INTO public.category (id, name) VALUES (3, 'edukacyjna'); --3
INSERT INTO public.category (id, name) VALUES (4, 'odnajdowanie wzorców'); --4
INSERT INTO public.category (id, name) VALUES (5, 'sport'); --5
INSERT INTO public.category (id, name) VALUES (6, 'fantasy'); --6
INSERT INTO public.category (id, name) VALUES (7, 'science fiction'); --7
INSERT INTO public.category (id, name) VALUES (8, 'podróże'); --8
INSERT INTO public.category (id, name) VALUES (9, 'familijna'); --9
INSERT INTO public.category (id, name) VALUES (10, 'strategiczna'); --10
INSERT INTO public.category (id, name) VALUES (11, 'imprezowa'); --11
INSERT INTO public.category (id, name) VALUES (12, 'towarzyska'); --12
INSERT INTO public.category (id, name) VALUES (13, 'przygodowa'); --13
INSERT INTO public.category (id, name) VALUES (14, 'horror'); --14
INSERT INTO public.category (id, name) VALUES (15, 'ekonomiczna'); --15


----- games -----

-- insert Dobble (relate to correct categories and authors) --1
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (1, 'Dobble', 1, 'Gra, która rozkręci każdą imprezę!', 'Spójrz na pierwszą kartę, którą trzymasz w ręku oraz na tę, która leży na środku stołu. Znajdź na nich wspólny symbol, nazwij go i szybko pozbądź się swojego kartonika. Teraz następny! Tylko nie zwątp, każda karta łączy się z inną zawsze tylko jednym symbolem! Dobble to rozrywka absolutnie dla każdego - gra nadaje się zarówno do zabawy z dziećmi, jak i na imprezy dorosłych. 55 kolorowych kart zamkniętych jest w solidnej, metalowej puszce, dzięki czemu łatwo zabrać Dobble ze sobą i grać absolutnie wszędzie: w poczekalni u lekarza, w pociągu, na wycieczce… ',
        'pl', 2, 8, 5, 10, 6, 0.22, '01/01/2011');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (1,1);
INSERT INTO public.author_game ("author_id", "game_id") VALUES (2,1);
INSERT INTO public.author_game ("author_id", "game_id") VALUES (3,1);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (1,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (3,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (4,1);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (5,1);

-- insert Elekt --2
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (2, 'Elekt', 4, 'Cesarz jest wyczerpany...', 'Elekt to taktyczna gra karciana dla 2-4 osób utrzymana w stylistyce dark fantasy. Gracze wcielają się w pretendentów do tronu mrocznego Dominatu Ebionitów. Aby zostać nowym władcą, będziecie przejmować władzę i spiskować. Będziecie przywoływać upiory i sługi ciemności, aby zasilać ich moce żarem. Najprzebieglejszy z Was zasiądzie na szczycie Wieży Dzwonów.',
        'pl', 2, 4, 60, 90, 16, 0.5, '23/11/2020');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (4, 2);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (1, 2);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,2);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,2);

-- insert wsiasc do pociagu --3
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (3, 'Wsiąść do Pociągu: Europa', 2, 'Bezkonkurencyjna gra familijna z mapą Europy', 'Od urwistych wzgórz Edynburga po słoneczne nabrzeża Stambułu, z dusznych alej Pampeluny do wietrznego Berlina - Wsiąść do pociągu: Europa zabierze cię w wielką podróż przez wielkie miasta Starego Kontynentu u progu zeszłego stulecia.Czy odważysz się przebyć mroczne tunele Szwajcarii?',
        'pl', 2, 5, 60, 90, 8, 1.415, '01/08/2019');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (6, 3);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (8,3);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,3);

-- insert nemesis --4
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (4, 'Nemesis', 1, 'Survival sci-fi game', 'Nemesis is a 1-5 player survival sci-fi game where players are woken up from hibernation as a crew of a space ship. The emergency procedure states that there is a critical system failure and the space ship can`t continue its cruise.',
        'en', 1, 5, 90, 180, 12, 3.9, '24/06/2019');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (5, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (2, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (3, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (4, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (5, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (6, 4);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (7, 4);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (7,4);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (10,4);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (14,4);

-- insert eksplodujace kotki --5
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (5, 'Eksplodujące Kotki', 1, 'Dla kochających koty i wybuchy', 'Eksplodujące Kotki to napędzana kociakami odmiana rosyjskiej ruletki. Gracze ciągną co turę po karcie, aż do momentu dobrania eksplodującego kota - wtedy nieszczęśnik wybucha i ginie, a gra się kończy.',
        'pl', 2, 5, 15, null, 12, 0.21, '16/11/2017');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (7, 5);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (8, 5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (1,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (9,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (11,5);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (12,5);

-- insert tajniacy --6
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (6, 'Tajniacy', 1, 'Przednia, zespołowa zabawa dedukcyjna!', 'Dwie drużyny, którym przewodzi dwóch Szefów Wywiadu, próbują jak najszybciej nawiązać kontakt ze wszystkimi swoimi agentami.',
        'pl', 2, 8, 10, null, 14, 0.56, '03/03/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (8, 6);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (9, 6);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,6);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (4,6);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (9,6);

-- insert to ja go tne --7
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (7, 'To ja go tnę!', 1, 'Przed polowaniem na potwora należy zebrać drużynę...', 'Zbierzcie drużynę bohaterów i wyruszcie na epicką przygodę przepełnioną prawdziwą jatką! Niech zdrada, groźne potwory i humor znany z Odjechanych jednorożców zagoszczą na Waszym stole!',
        'pl', 2, 6, 30, 60, 10, 0.45, '28/04/2021');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (9, 7);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (10, 7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (8,7);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (13,7);

-- insert Terraformacja Marsa --8
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (8, 'Terraforming Mars', 7, 'Zmień Marsa w planetę zdatną do życia!', 'Ludzkość rozpoczęła ekspansję w Układzie Słonecznym. Na Marsie założono już kilka niewielkich kolonii. Ich mieszkańcy są odgrodzeni od naturalnego środowiska straszliwie zimnej, suchej i niemal pozbawionej atmosfery planety.',
        'en', 1, 5, 90, 120, 12, 1.642, '28/09/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (10, 8);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (11, 8);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (7,8);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (10,8);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (15,8);

-- insert Munchkin --9
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (9, 'Munchkin', 5, 'Świetna gra kpiąca z RPG', 'Munchkin to niekolekcjonerska gra karciana, która oddaje urok typowej gry fabularnej bez tego całego durnego odgrywania postaci. Musisz tylko zabijać potwory i zbierać magiczne przedmioty!',
        'pl', 3, 5, 60, 90, 12, 0.3, '02/03/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (11, 9);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,9);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,9);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (12,9);

-- insert Splendor --10
INSERT INTO public.game (id, "title", "publisher_id", "shortDescription", "longDescription",
                  "language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (10, 'Splendor', 1, 'Kolekcjonowanie nigdy nie było tak uzależniające!', 'Gracze wcielają się w renesansowych kupców, którzy próbują nabyć kopalnie klejnotów, środki transportu, sklepy - wszystko to w celu zdobycia jak największego prestiżu.',
        'pl', 2, 4, 30, null, 10, 1.02, '21/03/2016');

INSERT INTO public.author_game ("author_id", "game_id") VALUES (12, 10);
INSERT INTO public.illustrator_game ("illustrator_id", "game_id") VALUES (12, 10);

INSERT INTO public.category_game ("category_id", "game_id") VALUES (2,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (6,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (9,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (10,10);
INSERT INTO public.category_game ("category_id", "game_id") VALUES (15,10);

-- insert awards --

INSERT INTO public.awards ("id", "name", "year", "game_id") VALUES (1, 'Board Game Quest Game of the Year Award', 2016, 8);
INSERT INTO public.awards ("id", "name", "year", "game_id") VALUES (2, 'Game of the Year Award', 2018, 1);
INSERT INTO public.awards ("id", "name", "year", "game_id") VALUES (3, 'Diana Jones Award', 2005, 3);
INSERT INTO public.awards ("id", "name", "year", "game_id") VALUES (4, 'Spiel des Jahres', 2016, 6);
INSERT INTO public.awards ("id", "name", "year", "game_id") VALUES (5, 'Deutscher Spiele Preis', 2016, 6);
