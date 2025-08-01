-- Create Donors Table
CREATE TABLE Donors (
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    BloodGroup VARCHAR(5),
    Contact VARCHAR(15),
    LastDonationDate DATE
);

-- Create Recipients Table
CREATE TABLE Recipients (
    RecipientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    BloodGroup VARCHAR(5),
    Contact VARCHAR(15),
    BloodRequired INT
);

-- Create Blood Inventory Table
CREATE TABLE BloodInventory (
    BloodGroup VARCHAR(5) PRIMARY KEY,
    UnitsAvailable INT DEFAULT 0
);

-- Create Donations Table
CREATE TABLE Donations (
    DonationID INT AUTO_INCREMENT PRIMARY KEY,
    DonorID INT,
    BloodGroup VARCHAR(5),
    DonationDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);

-- Create Requests Table
CREATE TABLE Requests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RecipientID INT,
    BloodGroup VARCHAR(5),
    UnitsRequested INT,
    RequestDate DATE,
    Status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);
