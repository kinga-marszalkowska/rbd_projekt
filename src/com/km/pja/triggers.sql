CREATE TRIGGER cancel_orders_with_archived_games
    AFTER UPDATE ON storage
    FOR EACH ROW
EXECUTE FUNCTION cancel_orders();

CREATE TRIGGER subtract_quantity_order
    AFTER INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION subtract_quantity();

CREATE TRIGGER are_enough_copies_in_storage
    BEFORE INSERT ON order_game
    FOR EACH ROW
EXECUTE FUNCTION copies_in_storage_check();