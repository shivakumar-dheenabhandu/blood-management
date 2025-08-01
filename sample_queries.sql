-- Insert Initial Inventory
INSERT INTO BloodInventory (BloodGroup, UnitsAvailable) VALUES
('O+', 5), ('A+', 5), ('B+', 3), ('AB+', 6), ('O-', 2), ('A-', 1);

-- Donor Registration
INSERT INTO Donors (Name, Age, BloodGroup, Contact, LastDonationDate)
VALUES ('Rahul Sharma', 28, 'O+', '9876543210', '2025-03-01');

-- Recipient Registration
INSERT INTO Recipients (Name, Age, BloodGroup, Contact, BloodRequired)
VALUES ('Aditi Verma', 35, 'O+', '9898989898', 2);

-- Blood Donation
INSERT INTO Donations (DonorID, BloodGroup, DonationDate)
VALUES (1, 'O+', '2025-03-20');

-- Check Inventory
SELECT * FROM BloodInventory;

-- Donation Report
SELECT Donors.Name, Donations.BloodGroup, Donations.DonationDate
FROM Donations
JOIN Donors ON Donations.DonorID = Donors.DonorID;
