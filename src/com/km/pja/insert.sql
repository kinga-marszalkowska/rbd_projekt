--todo format daty w release date

INSERT INTO publisher (id, name) VALUES (DEFAULT, 'rebel');
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'Days of Wonder');
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'mattel');
INSERT INTO publisher (id, name) VALUES (DEFAULT, 'What the frog');

INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Denis', 'Blanchot');
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Guillaume', 'Gille-Naves');
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Igor', 'Polouchine');
INSERT INTO author (id, name, surname) VALUES (DEFAULT, 'Krzysztof', 'Głośnicki');

INSERT INTO illustrator (id, name, surname) VALUES (DEFAULT, 'Katarzyna', 'Malinowska');

INSERT INTO category (id, name) VALUES (DEFAULT, 'zręczność');
INSERT INTO category (id, name) VALUES (DEFAULT, 'karty');
INSERT INTO category (id, name) VALUES (DEFAULT, 'edukacyjna');
INSERT INTO category (id, name) VALUES (DEFAULT, 'odnajdowanie wzorców');
INSERT INTO category (id, name) VALUES (DEFAULT, 'sport');
INSERT INTO category (id, name) VALUES (DEFAULT, 'fantasy');
INSERT INTO category (id, name) VALUES (DEFAULT, 'podróże');

-- insert Dobble (relate to correct categories and authors)
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Dobble', 1, 'Gra, która rozkręci każdą imprezę!', 'Spójrz na pierwszą kartę, którą trzymasz w ręku oraz na tę, która leży na środku stołu. Znajdź na nich wspólny symbol, nazwij go i szybko pozbądź się swojego kartonika. Teraz następny! Tylko nie zwątp, każda karta łączy się z inną zawsze tylko jednym symbolem! Dobble to rozrywka absolutnie dla każdego - gra nadaje się zarówno do zabawy z dziećmi, jak i na imprezy dorosłych. 55 kolorowych kart zamkniętych jest w solidnej, metalowej puszce, dzięki czemu łatwo zabrać Dobble ze sobą i grać absolutnie wszędzie: w poczekalni u lekarza, w pociągu, na wycieczce… ',
        'pl', 2, 8, 5, 10, 6, 0.22, 'November 23, 2020');

INSERT INTO author_game ("author_id", "game_id") VALUES (1,1);
INSERT INTO author_game ("author_id", "game_id") VALUES (2,1);
INSERT INTO author_game ("author_id", "game_id") VALUES (3,1);

INSERT INTO category_game ("category_id", "game_id") VALUES (1,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (3,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (4,1);
INSERT INTO category_game ("category_id", "game_id") VALUES (5,1);

-- insert Elekt
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Elekt', 4, 'Cesarz jest wyczerpany...', 'Elekt to taktyczna gra karciana dla 2-4 osób utrzymana w stylistyce dark fantasy. Gracze wcielają się w pretendentów do tronu mrocznego Dominatu Ebionitów. Aby zostać nowym władcą, będziecie przejmować władzę i spiskować. Będziecie przywoływać upiory i sługi ciemności, aby zasilać ich moce żarem. Najprzebieglejszy z Was zasiądzie na szczycie Wieży Dzwonów.',
        'pl', 2, 4, 60, 90, 16, 0.5, 'November 23, 2020');

INSERT INTO author_game ("author_id", "game_id") VALUES (4, 2);
INSERT INTO illustrator_game ("illustrator_id", "game_id") VALUES (1, 2);
INSERT INTO category_game ("category_id", "game_id") VALUES (6,2);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,2);

-- insert wsiasc do pociagu
INSERT INTO game (id, "title", "publisher_id", "shortDescription", "longDescription",
"language", "playersMin", "playersMax", "timeMin", "timeMax", "ageMin", "weight", "releaseDate")
VALUES (DEFAULT, 'Wsiąść do Pociągu: Europa', 2, 'Bezkonkurencyjna gra familijna z mapą Europy', 'Od urwistych wzgórz Edynburga po słoneczne nabrzeża Stambułu, z dusznych alej Pampeluny do wietrznego Berlina - Wsiąść do pociągu: Europa zabierze cię w wielką podróż przez wielkie miasta Starego Kontynentu u progu zeszłego stulecia.Czy odważysz się przebyć mroczne tunele Szwajcarii? ',
        'pl', 2, 5, 60, 90, 8, 1.415, 'August 2019');

INSERT INTO category_game ("category_id", "game_id") VALUES (7,3);
INSERT INTO category_game ("category_id", "game_id") VALUES (2,3);
