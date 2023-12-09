-- TRIGGER FUNCTION
CREATE OR REPLACE FUNCTION  fn_update_message_received() 
RETURNS trigger
LANGUAGE plpgsql AS
$$
    BEGIN
        INSERT INTO Received_Messages(messageID, uID)
        VALUES (NEW.messageID, NEW.uID)

        RETURN NULL;
    END;
$$;


CREATE TRIGGER tr_update_message_received
AFTER INSERT ON Sent_Messages
FOR EACH ROW
EXECUTE FUNCTION fn_update_message_received()