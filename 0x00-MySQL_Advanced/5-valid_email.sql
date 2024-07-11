--trigger that resets the attribute valid_email only when the email has been changed
CREATE TRIGGER reset_valid_email
AFTER UPDATE OF email ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END;
