-- publishers --
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'rebel'); --1
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'Days of Wonder'); --2
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'mattel'); --3
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'What the frog'); --4
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'Black Monk'); --5
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'Awaken Realms'); --6
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'FryxGames'); --7

-- authors --
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Denis', 'Blanchot'); --1
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Guillaume', 'Gille-Naves'); --2
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Igor', 'Polouchine'); --3
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Krzysztof', 'Głośnicki'); --4
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Adam', 'Kwapiński'); --5
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Alan', 'R. Moon'); --6
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Matthew', 'Inman'); --7
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Vlaada', 'Chvátil'); --8
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Ramy', 'Badie'); --9
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Jacob', 'Fryxelius'); --10
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Steve Jackson Games', null); --11
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Marc', 'André'); --12

-- illustrators --
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Katarzyna', 'Malinowska'); --1
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Piotr', 'Foksowicz'); --2
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Ewa', 'Labak'); --3
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Patryk', 'Jędraszek'); --4
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Paweł', 'Samborski'); --5
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Piotr', 'Gacek'); --6
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Andrzej', 'Półtoranos'); --7
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Matthew', 'Inman'); --8
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Tomáš', 'Kučerovský'); --9
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Ramy', 'Badie'); --10
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Isaac', 'Fryxelius'); --11
INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Pascal', 'Quidault'); --12

-- categories --
INSERT INTO category (id, name) VALUES (DEFAULT, 'zręcznościowa'); --1
INSERT INTO category (id, name) VALUES (DEFAULT, 'karciana'); --2
INSERT INTO category (id, name) VALUES (DEFAULT, 'edukacyjna'); --3
INSERT INTO category (id, name) VALUES (DEFAULT, 'odnajdowanie wzorców'); --4
INSERT INTO category (id, name) VALUES (DEFAULT, 'sport'); --5
INSERT INTO category (id, name) VALUES (DEFAULT, 'fantasy'); --6
INSERT INTO category (id, name) VALUES (DEFAULT, 'science fiction'); --7
INSERT INTO category (id, name) VALUES (DEFAULT, 'podróże'); --8
INSERT INTO category (id, name) VALUES (DEFAULT, 'familijna'); --9
INSERT INTO category (id, name) VALUES (DEFAULT, 'strategiczna'); --10
INSERT INTO category (id, name) VALUES (DEFAULT, 'imprezowa'); --11
INSERT INTO category (id, name) VALUES (DEFAULT, 'towarzyska'); --12
INSERT INTO category (id, name) VALUES (DEFAULT, 'przygodowa'); --13
INSERT INTO category (id, name) VALUES (DEFAULT, 'horror'); --14
INSERT INTO category (id, name) VALUES (DEFAULT, 'ekonomiczna'); --15


----- games -----

-- insert Dobble (relate to correct categories and authors) --1
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Dobble', 1, 'Gra, która rozkręci każdą imprezę!', 'Spójrz na pierwszą kartę, którą trzymasz w ręku oraz na tę, która leży na środku stołu. Znajdź na nich wspólny symbol, nazwij go i szybko pozbądź się swojego kartonika. Teraz następny! Tylko nie zwątp, każda karta łączy się z inną zawsze tylko jednym symbolem! Dobble to rozrywka absolutnie dla każdego - gra nadaje się zarówno do zabawy z dziećmi, jak i na imprezy dorosłych. 55 kolorowych kart zamkniętych jest w solidnej, metalowej puszce, dzięki czemu łatwo zabrać Dobble ze sobą i grać absolutnie wszędzie: w poczekalni u lekarza, w pociągu, na wycieczce… ',
        'pl', 2, 8, 5, 10, 6, 0.22, '01/01/2011');

INSERT INTO author_game ("author_id", "game_id") VALUES (1,1);
INSERT INTO author_game ("author_id", "game_id") VALUES (2,1);
INSERT INTO author_game ("author_id", "game_id") VALUES (3,1);

INSERT INTO category_game ("category_id", "game_id") VALUES (1,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (3,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (4,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (5,1);

-- insert Elekt --2
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Elekt', 4, 'Cesarz jest wyczerpany...', 'Elekt to taktyczna gra karciana dla 2-4 osób utrzymana w stylistyce dark fantasy. Gracze wcielają się w pretendentów do tronu mrocznego Dominatu Ebionitów. Aby zostać nowym władcą, będziecie przejmować władzę i spiskować. Będziecie przywoływać upiory i sługi ciemności, aby zasilać ich moce żarem. Najprzebieglejszy z Was zasiądzie na szczycie Wieży Dzwonów.',
        'pl', 2, 4, 60, 90, 16, 0.5, '23/11/2020');

INSERT INTO author_game ("author_id", "game_id") VALUES (4, 2);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (1, 2);
INSERT INTO category_game ("category_id", "game_id") VALUES (6,2);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,2);

-- insert wsiasc do pociagu --3
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Wsiąść do Pociągu: Europa', 2, 'Bezkonkurencyjna gra familijna z mapą Europy', 'Od urwistych wzgórz Edynburga po słoneczne nabrzeża Stambułu, z dusznych alej Pampeluny do wietrznego Berlina - Wsiąść do pociągu: Europa zabierze cię w wielką podróż przez wielkie miasta Starego Kontynentu u progu zeszłego stulecia.Czy odważysz się przebyć mroczne tunele Szwajcarii?',
        'pl', 2, 5, 60, 90, 8, 1.415, '01/08/2019');

INSERT INTO author_game ("author_id", "game_id") VALUES (6, 3);
INSERT INTO category_game ("category_id", "game_id") VALUES (8,3);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,3);

-- insert nemesis --4
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Nemesis', 1, 'Survival sci-fi game', 'Nemesis is a 1-5 player survival sci-fi game where players are woken up from hibernation as a crew of a space ship. The emergency procedure states that there is a critical system failure and the space ship can`t continue its cruise.',
        'en', 1, 5, 90, 180, 12, 3.9, 24/06/2019);

INSERT INTO author_game ("author_id", "game_id") VALUES (5, 4);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (2, 4);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (3, 4);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (4, 4);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (5, 4);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (6, 4);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (7, 4);

INSERT INTO category_game ("category_id", "game_id") VALUES (7,4);
INSERT INTO category_game ("category_id", "game_id") VALUES (10,4);
INSERT INTO category_game ("category_id", "game_id") VALUES (14,4);

-- insert eksplodujace kotki --5
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Eksplodujące Kotki', 1, 'Dla kochających koty i wybuchy', 'Eksplodujące Kotki to napędzana kociakami odmiana rosyjskiej ruletki. Gracze ciągną co turę po karcie, aż do momentu dobrania eksplodującego kota - wtedy nieszczęśnik wybucha i ginie, a gra się kończy.',
        'pl', 2, 5, 15, null, 12, 0.21, 16/11/2017);

INSERT INTO author_game ("author_id", "game_id") VALUES (7, 5);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (8, 5);

INSERT INTO category_game ("category_id", "game_id") VALUES (1,5);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,5);
INSERT INTO category_game ("category_id", "game_id") VALUES (9,5);
INSERT INTO category_game ("category_id", "game_id") VALUES (11,5);
INSERT INTO category_game ("category_id", "game_id") VALUES (12,5);

-- insert tajniacy --6
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Tajniacy', 1, 'Przednia, zespołowa zabawa dedukcyjna!', 'Dwie drużyny, którym przewodzi dwóch Szefów Wywiadu, próbują jak najszybciej nawiązać kontakt ze wszystkimi swoimi agentami.',
        'pl', 2, 8, 10, null, 14, 0.56, 03/03/2016);

INSERT INTO author_game ("author_id", "game_id") VALUES (8, 6);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (9, 6);

INSERT INTO category_game ("category_id", "game_id") VALUES (2,6);
INSERT INTO category_game ("category_id", "game_id") VALUES (4,6);
INSERT INTO category_game ("category_id", "game_id") VALUES (9,6);

-- insert to ja go tne --7
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'To ja go tnę!', 1, 'Przed polowaniem na potwora należy zebrać drużynę...', 'Zbierzcie drużynę bohaterów i wyruszcie na epicką przygodę przepełnioną prawdziwą jatką! Niech zdrada, groźne potwory i humor znany z Odjechanych jednorożców zagoszczą na Waszym stole!',
        'pl', 2, 6, 30, 60, 10, 0.45, 28/04/2021);

INSERT INTO author_game ("author_id", "game_id") VALUES (9, 7);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (10, 7);

INSERT INTO category_game ("category_id", "game_id") VALUES (2,7);
INSERT INTO category_game ("category_id", "game_id") VALUES (6,7);
INSERT INTO category_game ("category_id", "game_id") VALUES (8,7);
INSERT INTO category_game ("category_id", "game_id") VALUES (13,7);

-- insert Terraformacja Marsa --8
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Terraforming Mars', 7, 'Zmień Marsa w planetę zdatną do życia!', 'Ludzkość rozpoczęła ekspansję w Układzie Słonecznym. Na Marsie założono już kilka niewielkich kolonii. Ich mieszkańcy są odgrodzeni od naturalnego środowiska straszliwie zimnej, suchej i niemal pozbawionej atmosfery planety.',
        'en', 1, 5, 90, 120, 12, 1.642, 28/09/2016);

INSERT INTO author_game ("author_id", "game_id") VALUES (10, 8);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (11, 8);

INSERT INTO category_game ("category_id", "game_id") VALUES (7,8);
INSERT INTO category_game ("category_id", "game_id") VALUES (10,8);
INSERT INTO category_game ("category_id", "game_id") VALUES (15,8);

-- insert Munchkin --9
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Munchkin', 5, 'Świetna gra kpiąca z RPG', 'Munchkin to niekolekcjonerska gra karciana, która oddaje urok typowej gry fabularnej bez tego całego durnego odgrywania postaci. Musisz tylko zabijać potwory i zbierać magiczne przedmioty!',
        'pl', 3, 5, 60, 90, 12, 0.3, 02/03/2016);

INSERT INTO author_game ("author_id", "game_id") VALUES (11, 9);

INSERT INTO category_game ("category_id", "game_id") VALUES (2,9);
INSERT INTO category_game ("category_id", "game_id") VALUES (6,9);
INSERT INTO category_game ("category_id", "game_id") VALUES (12,9);

-- insert Splendor --10
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Splendor', 1, 'Kolekcjonowanie nigdy nie było tak uzależniające!', 'Gracze wcielają się w renesansowych kupców, którzy próbują nabyć kopalnie klejnotów, środki transportu, sklepy - wszystko to w celu zdobycia jak największego prestiżu.',
        'pl', 2, 4, 30, null, 10, 1.02, 21/03/2016);

INSERT INTO author_game ("author_id", "game_id") VALUES (12, 10);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (12, 10);

INSERT INTO category_game ("category_id", "game_id") VALUES (2,10);
INSERT INTO category_game ("category_id", "game_id") VALUES (6,10);
INSERT INTO category_game ("category_id", "game_id") VALUES (9,10);
INSERT INTO category_game ("category_id", "game_id") VALUES (10,10);
INSERT INTO category_game ("category_id", "game_id") VALUES (15,10);

-- insert awards --

INSERT INTO awards ("id", "name", "year", "game_id") VALUES (DEFAULT, "Board Game Quest Game of the Year Award", 2016, 8)
INSERT INTO awards ("id", "name", "year", "game_id") VALUES (DEFAULT, "Game of the Year Award", 2018, 1)
INSERT INTO awards ("id", "name", "year", "game_id") VALUES (DEFAULT, "Diana Jones Award", 2005, 3)
INSERT INTO awards ("id", "name", "year", "game_id") VALUES (DEFAULT, "Spiel des Jahres", 2016, 6)
INSERT INTO awards ("id", "name", "year", "game_id") VALUES (DEFAULT, "Deutscher Spiele Preis", 2016, 6)



