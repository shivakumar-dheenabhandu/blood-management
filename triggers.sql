DELIMITER $$

-- Trigger: Update Inventory After Donation
CREATE TRIGGER AfterDonationInsert
AFTER INSERT ON Donations
FOR EACH ROW
BEGIN
    UPDATE BloodInventory
    SET UnitsAvailable = UnitsAvailable + 1
    WHERE BloodGroup = NEW.BloodGroup;
END$$

-- Trigger: Update Inventory After Request Approval
CREATE TRIGGER AfterRequestApproval
AFTER UPDATE ON Requests
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Approved' THEN
        UPDATE BloodInventory
        SET UnitsAvailable = UnitsAvailable - NEW.UnitsRequested
        WHERE BloodGroup = NEW.BloodGroup;
    END IF;
END$$

DELIMITER ;
