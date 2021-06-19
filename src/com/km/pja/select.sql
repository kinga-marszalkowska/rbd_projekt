-- get 1st user's order history
SELECT order_game.id, order_game.game_id, order_game.quantity, order.user_id, order.date, order.status
FROM order_game JOIN order ON order_game.order_id = order.id WHERE order.user_id = 1;
