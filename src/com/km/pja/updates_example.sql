-- archive game with id = 1
UPDATE public.storage SET archived = true WHERE game_id = 1;
-- restock game with id = 1 (add 10 new copies)
UPDATE public.storage SET quantity = (SELECT quantity FROM public.storage WHERE game_id = 1) + 10 WHERE game.id = 1;

-- change order status
UPDATE public.order SET status = 'shipped' WHERE id = 1;

-- change password
UPDATE public.user SET password = '18QbPaFctsaAuG1qsx2g9P46y9K4KDfepr' WHERE id = 1;
-- change user address
UPDATE public.user SET country = 'Poland', city = 'Główczyce', "adressLine1" = '340 Almo Point', "postalCode" = '76-221' WHERE id = 1;