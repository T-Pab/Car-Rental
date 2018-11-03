DROP DATABASE if exists CAR_RENTAL;
CREATE DATABASE if not exists CAR_RENTAL;
USE CAR_RENTAL;

/* CREATE TABLES */

CREATE TABLE IF NOT EXISTS STORE(
Store_ID INT unsigned AUTO_INCREMENT,
Street  VARCHAR(20) NOT NULL,
Street_Number INT unsigned NOT NULL,
Postal_Code INT unsigned NOT NULL,
City VARCHAR(20) NOT NULL,
PRIMARY KEY (Store_ID)
);

CREATE TABLE IF NOT EXISTS PHONE_NUMBER(
Store_ID INT unsigned,
Phone BIGINT unsigned,
PRIMARY KEY (Store_ID,Phone),
FOREIGN KEY (Store_ID) references STORE(Store_ID) ON DELETE CASCADE,
UNIQUE (Phone)
);

CREATE TABLE IF NOT EXISTS EMAIL_ADDRESS(
Store_ID INT unsigned,
Email VARCHAR(100),
PRIMARY KEY (Store_ID,Email),
FOREIGN KEY (Store_ID) references STORE(Store_ID) ON DELETE CASCADE,
UNIQUE (Email)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE(
IRS_Number BIGINT unsigned,
SSN BIGINT NOT NULL,
Driver_License BIGINT unsigned,
First_Name  VARCHAR(20) NOT NULL,
Last_Name  VARCHAR(20) NOT NULL,
Street  VARCHAR(20) NOT NULL,
Street_Number INT unsigned NOT NULL,
Postal_Code INT unsigned,
City VARCHAR(20) NOT NULL,
PRIMARY KEY (IRS_Number),
UNIQUE (SSN),
UNIQUE (Driver_License)
);

CREATE TABLE IF NOT EXISTS WORKS(
IRS_Number BIGINT unsigned,
Store_ID INT unsigned,
Start_Date date,
Finish_Date date NOT NULL,
Job  varchar(20) NOT NULL,
primary key (IRS_Number,Store_ID,Start_Date),
foreign key (IRS_Number) references EMPLOYEE(IRS_Number) ON DELETE CASCADE,
foreign key (Store_ID) references STORE (Store_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CUSTOMER(
Customer_ID INT unsigned AUTO_INCREMENT,
IRS_Number  BIGINT unsigned NOT NULL,
SSN  BIGINT unsigned NOT NULL,
Last_Name  VARCHAR(20) NOT NULL,
First_Name  VARCHAR(20) NOT NULL,
Driver_License BIGINT unsigned NOT NULL,
First_Registration DATE NOT NULL,
City VARCHAR(20) NOT NULL,
Postal_Code INT unsigned,
Street  VARCHAR(20) NOT NULL,
Street_Number INT unsigned NOT NULL,
PRIMARY KEY (Customer_ID),
UNIQUE (IRS_Number),
UNIQUE (SSN),
UNIQUE (Driver_License)
);

CREATE TABLE IF NOT EXISTS VEHICLE(
License_Plate VARCHAR(20),
Model VARCHAR(20) NOT NULL,
CType VARCHAR(20) NOT NULL,
Make VARCHAR(20) NOT NULL,
CYear INT unsigned NOT NULL,
Kilometers INT unsigned NOT NULL,
Cylinder_Capacity INT unsigned NOT NULL,
Horse_Power INT unsigned NOT NULL,
Damages VARCHAR(20) NOT NULL,
Malfunctions VARCHAR(20) NOT NULL,
Next_Service DATE NOT NULL,
Insurance_Exp_Date DATE NOT NULL,
Last_Service DATE,
Store_ID INT unsigned NOT NULL,
PRIMARY KEY (License_Plate),
FOREIGN KEY (Store_ID) references STORE(Store_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS FUEL_TYPE(
License_Plate VARCHAR(20),
Fuel VARCHAR(20) NOT NULL,
PRIMARY KEY (License_Plate),
FOREIGN KEY (License_Plate) references VEHICLE(License_Plate) ON DELETE CASCADE
);

Create table if not exists RESERVES(
Start_Date DATE,
License_Plate VARCHAR(20),
Start_Location INT unsigned,
Finish_Location INT unsigned,
Finish_Date DATE NOT NULL,
Paid BOOLEAN NOT NULL,
Customer_ID INT unsigned,
PRIMARY KEY (Start_Date,License_Plate),
FOREIGN KEY (License_Plate) references VEHICLE(License_Plate) ON DELETE CASCADE,
FOREIGN KEY (Customer_ID) references CUSTOMER(Customer_ID) ON DELETE RESTRICT,
FOREIGN KEY (Start_Location) references STORE (Store_ID) ON DELETE SET NULL,
FOREIGN KEY (Finish_Location) references STORE (Store_ID) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS RENTS(
Start_Date DATE,
License_Plate VARCHAR(20),
Start_Location INT unsigned,
Finish_Location INT unsigned,
Finish_Date DATE,
Return_State INT unsigned,
Customer_ID  INT unsigned,
IRS_Number BIGINT unsigned,
PRIMARY KEY (Start_Date,License_Plate),
FOREIGN KEY (Start_Date) REFERENCES RESERVES (Start_Date) ON DELETE CASCADE,
FOREIGN KEY (License_Plate) REFERENCES RESERVES (License_Plate) ON DELETE CASCADE,
FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (Customer_ID) ON DELETE RESTRICT,
FOREIGN KEY (IRS_Number) REFERENCES EMPLOYEE (IRS_Number) ON DELETE SET NULL,
FOREIGN KEY (Start_Location) REFERENCES STORE (Store_ID) ON DELETE SET NULL,
FOREIGN KEY (Finish_Location) REFERENCES STORE (Store_ID) ON DELETE SET NULL
);

Create table if not exists PAYMENT_TRANSACTION(
Start_Date DATE,
License_Plate VARCHAR(20),
Payment_Amount INT unsigned NOT NULL,
Payment_Method VARCHAR(20) NOT NULL,
PRIMARY KEY (Start_Date,License_Plate),
FOREIGN KEY (Start_Date) REFERENCES RENTS (Start_Date) ON DELETE CASCADE,
FOREIGN KEY (License_Plate) REFERENCES RENTS (License_Plate) ON DELETE CASCADE
);


/* CREATE INDEXES */

CREATE INDEX VEHICLETYPE_INDEX ON VEHICLE(CType);
CREATE INDEX CUSTOMERFIRSTNAME_INDEX ON CUSTOMER(First_Name);
CREATE INDEX CUSTOMERLASTNAME_INDEX ON CUSTOMER(Last_Name);
CREATE INDEX EMPLOYEEFIRSTNAME_INDEX ON EMPLOYEE(First_Name);
CREATE INDEX EMPLOYEELASTNAME_INDEX ON EMPLOYEE(Last_Name);
/*CREATE INDEX VEHICLEMake_INDEX ON VEHICLE(Make);
/*CREATE INDEX WORKSJOB_INDEX ON WORKS(Job);
/*CREATE INDEX VEHICLEMake_INDEX ON VEHICLE(CYear);
/*CREATE INDEX RENTSSTARTDATE_INDEX ON RENTS(Start_Date);
/*CREATE INDEX RENTSFINISHDATE_INDEX ON RENTS(Finish_Date);
/*CREATE INDEX RESERVESTARTDATE_INDEX ON RESERVES(Start_Date);
/*CREATE INDEX RESERVESFINISHDATE_INDEX ON RESERVES(Finish_Date);



/* CREATE VIEWS */

CREATE VIEW Vehicles_With_Damages as
select * from VEHICLE where Damages!="none"  ;

CREATE VIEW Vehicles_With_Malfunctions as
select * from VEHICLE where Malfunctions!="none"  ;


CREATE VIEW Vehicles_Stores as
select  * from VEHICLE natural join STORE ORDER BY Store_ID;

CREATE VIEW VEHICLES_FUEL_TYPES as
SELECT *
FROM VEHICLE natural join FUEL_TYPE
order by Store_ID;

CREATE VIEW STORES_PHONES as
select * from STORE natural join PHONE_NUMBER;

CREATE VIEW STORES_EMAIL as
select * from STORE natural join EMAIL_ADDRESS;


/*  CREATE TRIGGERS */
DELIMITER $$

CREATE TRIGGER Insert_Store before insert ON STORE
for each row
BEGIN
    IF (NEW.Street = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street must not be empty';
    ELSEIF (NEW.Street_Number = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must not be empty';
    ELSEIF (NEW.Postal_Code = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must not be empty';
    ELSEIF (NEW.City = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'City must not be empty';
    END IF;
    IF (NEW.Street_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must be positive integer';
    ELSEIF (NEW.Postal_Code<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Update_Store before update ON STORE
for each row
BEGIN
    IF (NEW.Street = "") THEN
        SET NEW.Street = OLD.Street;
    END IF;
    IF (NEW.Street_Number = "") THEN
        SET NEW.Street_Number = OLD.Street_Number;
    END IF;
    IF (NEW.Postal_Code = "") THEN
        SET NEW.Postal_Code = OLD.Postal_Code;
    END IF;
    IF (NEW.City = "") THEN
        SET NEW.City = OLD.City;
    END IF;
    IF (NEW.Street_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must be positive integer';
    ELSEIF (NEW.Postal_Code<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Insert_Phone_Number before insert ON PHONE_NUMBER
for each row
BEGIN
    IF (NEW.Phone = "" ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone must not be empty';
    END IF;
    IF (NEW.Phone < 1000000000) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone must be positive integer with at least 10 digits';
    END IF;
END; $$

CREATE TRIGGER Update_Phone_Number before update ON PHONE_NUMBER
for each row
BEGIN
    IF (NEW.Phone = "" ) THEN
        SET NEW.Phone = OLD.Phone;
    END IF;
    IF (NEW.Phone < 1000000000) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone must be positive integer with at least 10 digits';
    END IF;
END; $$

CREATE TRIGGER Insert_Email_Address before insert ON EMAIL_ADDRESS
for each row
BEGIN
    IF (NEW.Email = "" ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email must not be empty';
    END IF;
    IF NOT (NEW.Email like '%@%.%') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email must be similar to: text@company.domain_ending';
    END IF;
END; $$

CREATE TRIGGER Update_Email_Address before update ON EMAIL_ADDRESS
for each row
BEGIN
    IF (NEW.Email = "" ) THEN
        SET NEW.Email = OLD.Email;
    END IF;
    IF NOT (NEW.Email like '%@%.%') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email must be similar to: text@company.domain_ending';
    END IF;
END; $$

CREATE TRIGGER Insert_Employee before insert ON EMPLOYEE
for each row
BEGIN
    IF (NEW.IRS_Number = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'IRS_Number must not be empty';
    ELSEIF (NEW.SSN = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SSN must not be empty';
    ELSEIF (NEW.First_Name = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'First Name must not be empty';
    ELSEIF (NEW.Last_Name = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Last Name must not be empty';
    ELSEIF (NEW.Street = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street must not be empty';
    ELSEIF (NEW.Street_Number = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must not be empty';
    ELSEIF (NEW.City = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'City must not be empty';
    END IF;
    IF (NEW.Driver_License = "") THEN
        SET NEW.Driver_License = NULL;
    END IF;
    IF (NEW.Postal_Code = "") THEN
        SET NEW.Postal_Code = NULL;
    END IF;
    IF (NEW.IRS_Number <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'IRS Number must be positive integer';
    ELSEIF (NEW.SSN <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SSN must be positive integer';
    ELSEIF (NEW.Driver_License <=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver License must be positive integer';
    ELSEIF (NEW.Street_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must be positive integer';
    ELSEIF (NEW.Postal_Code<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Update_Employee before update ON EMPLOYEE
for each row
BEGIN
    IF (NEW.IRS_Number = "") THEN
        SET NEW.IRS_Number = OLD.IRS_Number;
    END IF;
    IF (NEW.SSN = "") THEN
        SET NEW.SSN = OLD.SSN;
    END IF;
    IF (NEW.Driver_License = "") THEN
        SET NEW.Driver_License = OLD.Driver_License;
    END IF;
    IF (NEW.First_Name = "") THEN
        SET NEW.First_Name = OLD.First_Name;
    END IF;
    IF (NEW.Last_Name = "") THEN
        SET NEW.Last_Name = OLD.Last_Name;
    END IF;
    IF (NEW.Street = "") THEN
        SET NEW.Street = OLD.Street;
    END IF;
    IF (NEW.Street_Number = "") THEN
        SET NEW.Street_Number = OLD.Street_Number;
    END IF;
    IF (NEW.Postal_Code = "") THEN
        SET NEW.Postal_Code = OLD.Postal_Code;
    END IF;
    IF (NEW.City = "") THEN
        SET NEW.City = OLD.City;
    END IF;
    IF (NEW.IRS_Number <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'IRS Number must be positive integer';
    ELSEIF (NEW.SSN <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SSN must be positive integer';
    ELSEIF (NEW.Driver_License <=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver License must be positive integer';
    ELSEIF (NEW.Street_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must be positive integer';
    ELSEIF (NEW.Postal_Code<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Insert_Works before insert ON WORKS
for each row
BEGIN
    IF (NEW.Start_Date = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must not be empty';
    ELSEIF (NEW.Finish_Date = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must not be empty';
    ELSEIF (NEW.Job = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Job must not be empty';
    END IF;
    IF (NEW.Start_Date <= '1900-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must be greater than 1900-01-01';
    ELSEIF (NEW.Finish_Date <= '1900-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than 1900-01-01';
    ELSEIF (NEW.Finish_Date < NEW.Start_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than Start Date';
    END IF;
END; $$

CREATE TRIGGER Update_Works before update ON WORKS
for each row
BEGIN
    IF (NEW.Start_Date = "") THEN
        SET NEW.Start_Date = OLD.Start_date;
    END IF;
    IF (NEW.Finish_Date = "") THEN
        SET NEW.Finish_Date = OLD.Finish_Date;
    END IF;
    IF (NEW.Job = "") THEN
        SET NEW.Job = OLD.Job;
    END IF;
    IF (NEW.Start_Date <= CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must be greater than 1900-01-01';
    ELSEIF (NEW.Finish_Date <= '1900-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than 1900-01-01';
    ELSEIF (NEW.Finish_Date < NEW.Start_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than Start Date';
    END IF;
END; $$

CREATE TRIGGER Insert_Customer before insert ON CUSTOMER
for each row
BEGIN
    IF (NEW.IRS_Number = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'IRS_Number must not be empty';
    ELSEIF (NEW.SSN = "" ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SSN must not be empty';
    ELSEIF (NEW.Last_Name = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Last_Name must not be empty';
    ELSEIF (NEW.First_Name = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'First_Name must not be empty';
    ELSEIF (NEW.Driver_License = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver_License must not be empty';
    ELSEIF (NEW.City = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'City must not be empty';
    ELSEIF (NEW.Street = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street must not be empty';
    ELSEIF (NEW.Street_Number = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street_Number must not be empty';
    END IF;
    IF (NEW.Postal_Code = "") THEN
        SET NEW.Postal_Code = NULL;
    END IF;
    IF (NEW.First_Registration = "") THEN
        SET NEW.First_Registration = CURDATE();
    END IF;
    IF (NEW.IRS_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'IRS_Number must be positive integer';
    ELSEIF (NEW.SSN <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SSN must be positive integer';
    ELSEIF (NEW.First_Registration < '1990-01-01' OR NEW.First_Registration > CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'First_Registration must be greater than 1990-01-01';
    ELSEIF (NEW.Driver_License <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver LIcense must be positive integer';
    ELSEIF (NEW.Postal_Code<0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must be positive integer';
    ELSEIF (NEW.Street_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Update_Customer before update ON CUSTOMER
for each row
BEGIN
    IF (NEW.IRS_Number = "") THEN
        SET NEW.IRS_Number = OLD.IRS_Number;
    END IF;
    IF (NEW.SSN = "") THEN
        SET NEW.SSN = OLD.SSN;
    END IF;
    IF (NEW.Last_Name = "") THEN
        SET NEW.Last_Name = OLD.Last_Name;
    END IF;
    IF (NEW.First_Name = "") THEN
        SET NEW.First_Name = OLD.First_Name;
    END IF;
    IF (NEW.Driver_License = "") THEN
        SET NEW.Driver_License = OLD.Driver_License;
    END IF;
    IF (NEW.First_Registration = "") THEN
        SET NEW.First_Registration = OLD.First_Registration;
    END IF;
    IF (NEW.City = "") THEN
        SET NEW.City = OLD.City;
    END IF;
    IF (NEW.Street = "") THEN
        SET NEW.Street = OLD.Street;
    END IF;
    IF (NEW.Street_Number = "") THEN
        SET NEW.Street_Number = OLD.Street_Number;
    END IF;
    IF (NEW.Postal_Code = "") THEN
        SET NEW.Postal_Code = OLD.Postal_Code;
    END IF;
    IF (NEW.IRS_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'IRS_Number must be positive integer';
    ELSEIF (NEW.SSN <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'SSN must be positive integer';
    ELSEIF (NEW.First_Registration < '1990-01-01' OR NEW.First_Registration > CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'First_Registration must be greater than 1990-01-01';
    ELSEIF (NEW.Driver_License <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Driver LIcense must be positive integer';
    ELSEIF (NEW.Postal_Code<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Postal Code must be positive integer';
    ELSEIF (NEW.Street_Number<=0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Street Number must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Insert_Vehicle before insert ON VEHICLE
for each row
BEGIN
    IF (NEW.License_Plate = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'License Plate must not be empty';
    ELSEIF (NEW.Model = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Model must not be empty';
    ELSEIF (NEW.CType = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CType must not be empty';
    ELSEIF (NEW.Make = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Make must not be empty';
    END IF;
    IF (NEW.CYear < 1960 OR NEW.CYear > YEAR(CURDATE())) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CYear must be greater than 1960 and less than current date';
    ELSEIF (NEW.Kilometers < 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kilometers must be positive integer';
    ELSEIF (NEW.Cylinder_Capacity <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cylinder Capacity must be positive integer';
    ELSEIF (NEW.Horse_Power <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Horse Power must be positive integer';
    ELSEIF (NEW.Next_Service < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Next Service must must be higher than current date';
    ELSEIF (NEW.Insurance_Exp_Date <= '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insurance Exp Date must be higher than 1990-01-01';
    ELSEIF (NEW.Last_Service != "" AND NEW.Last_Service <= '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Last Service must must be higher than 1990-01-01';
    ELSEIF (NEW.Next_Service < NEW.Last_Service) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Next Service must must greater than Last Service';
    END IF;
    IF (NEW.Damages = "" OR NEW.Damages = NULL) THEN
        SET NEW.Damages = "none";
    END IF;
    IF (NEW.Malfunctions = "" OR NEW.Malfunctions = NULL) THEN
        SET NEW.Malfunctions = "none";
    END IF;
    IF (NEW.Store_ID = "") THEN
        SET NEW.Store_ID = (select Store_ID from (select Store_ID,count(*) from Vehicles_Stores group by Store_ID order by  count(*) limit 1 ) as x);
    END IF;
END; $$

CREATE TRIGGER Update_Vehicle before update ON VEHICLE
for each row
BEGIN
    IF (NEW.License_Plate = "") THEN
        SET NEW.License_Plate = OLD.License_Plate;
    END IF;
    IF (NEW.Model = "") THEN
        SET NEW.Model = OLD.Model;
    END IF;
    IF (NEW.CType = "") THEN
        SET NEW.CType = OLD.CType;
    END IF;
    IF (NEW.Make = "") THEN
        SET NEW.Make = OLD.Make;
    END IF;
    IF (NEW.CYear = "") THEN
        SET NEW.CYear = OLD.CYear;
    END IF;
    IF (NEW.Damages = "") THEN
        SET NEW.Damages = OLD.Damages;
    END IF;
    IF (NEW.Malfunctions = "") THEN
        SET NEW.Malfunctions = OLD.Malfunctions;
    END IF;
    IF (NEW.Next_Service = "") THEN
        SET NEW.Next_Service = OLD.Next_Service;
    END IF;
    IF (NEW.Insurance_Exp_Date = "") THEN
        SET NEW.Insurance_Exp_Date = OLD.Insurance_Exp_Date;
    END IF;
    IF (NEW.Last_Service = "") THEN
        SET NEW.Last_Service = OLD.Last_Service;
    END IF;
    IF (NEW.Kilometers = "") THEN
        SET NEW.Kilometers = OLD.Kilometers;
    END IF;
    IF (NEW.Store_ID = "") THEN
        SET NEW.Store_ID = OLD.Store_ID;
    END IF;
    IF (NEW.CYear < 1960 OR NEW.CYear > YEAR(CURDATE())) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CYear must be greater than 1960 and less than current date';
    ELSEIF (NEW.Kilometers < 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Kilometers must be positive integer';
    ELSEIF (NEW.Cylinder_Capacity <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cylinder Capacity must be positive integer';
    ELSEIF (NEW.Horse_Power <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Horse Power must be positive integer';
    ELSEIF (NEW.Next_Service < CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Next Service must must be higher than current date';
    ELSEIF (NEW.Insurance_Exp_Date <= '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Horse Power must must be higher than 1990-01-01';
    ELSEIF (NEW.Last_Service <= '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Last Service must must be higher than 1990-01-01';
    ELSEIF (NEW.Next_Service < NEW.Last_Service) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Next Service must must greater than Last Service';
    END IF;
    IF (NEW.Kilometers < OLD.Kilometers) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'New Kilometers must be greater or equal to the old kilometers';
    END IF;
END; $$

CREATE TRIGGER Insert_Fuel_Type before insert ON FUEL_TYPE
for each row
BEGIN
    IF (NEW.Fuel = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fuel must not be empty';
    END IF;
END; $$

CREATE TRIGGER Update_Fuel_Type before update ON FUEL_TYPE
for each row
BEGIN
    IF (NEW.Fuel = "") THEN
        SET NEW.Fuel = OLD.Fuel;
    END IF;
END; $$

CREATE TRIGGER Insert_Reserves before insert ON RESERVES
for each row
BEGIN
    IF (NEW.Start_Date = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must not be empty';
    ELSEIF (NEW.Finish_Date = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must not be empty';
    END IF;
    IF (NEW.Start_date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must be greater than 1990-01-01';
    ELSEIF (NEW.Finish_Date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than 1990-01-01';
    ELSEIF (NEW.Finish_Date < NEW.Start_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than Start Date';
    END IF;
    IF (NEW.Paid = TRUE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Reserves must be inserted unpaid at first';
    END IF;
    IF EXISTS (SELECT License_Plate
               FROM RESERVES
               WHERE NEW.License_Plate = License_Plate AND ((Start_Date <= NEW.Start_Date AND NEW.Start_Date <= Finish_Date) OR (Start_Date <= NEW.Finish_Date AND NEW.Finish_Date <= Finish_Date) OR (NEW.Start_Date <= Start_Date AND NEW.Finish_Date >= Finish_Date))) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vehicle is not available for those Dates';
    END IF;
END; $$

CREATE TRIGGER Update_Reserves before update ON RESERVES
for each row
BEGIN
    IF (NEW.Start_Date = "") THEN
        SET NEW.Start_Date = OLD.Start_Date;
    END IF;
    IF (NEW.License_Plate = "") THEN
        SET NEW.License_Plate = OLD.License_Plate;
    END IF;
    IF (NEW.Start_Location = "") THEN
        SET NEW.Start_Location = OLD.Start_Location;
    END IF;
    IF (NEW.Finish_Location = "") THEN
        SET NEW.Finish_Location = OLD.Finish_Location;
    END IF;
    IF (NEW.Finish_Date = "") THEN
        SET NEW.Finish_Date = OLD.Finish_Date;
    END IF;
    IF (NEW.Paid = "") THEN
        SET NEW.Paid = OLD.Paid;
    END IF;
    IF (NEW.Customer_ID = "") THEN
        SET NEW.Customer_ID = OLD.Customer_ID;
    END IF;
    IF (NEW.Start_date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must be greater than 1990-01-01';
    ELSEIF (NEW.Finish_Date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than 1990-01-01';
    ELSEIF (NEW.Finish_Date < NEW.Start_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than Start Date';
    END IF;
    IF (OLD.Paid=True) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You cannot update and already paid reservation';
    END IF;
    IF (NEW.Finish_Date <> OLD.Finish_Date) THEN
        IF EXISTS (SELECT License_Plate
                   FROM RESERVES
                   WHERE NEW.License_Plate = License_Plate AND ((Start_Date <= NEW.Start_Date AND NEW.Start_Date <= Finish_Date) OR (Start_Date <= NEW.Finish_Date AND NEW.Finish_Date <= Finish_Date) OR (NEW.Start_Date <= Start_Date AND NEW.Finish_Date >= Finish_Date))) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vehicle is not available for those Dates';
        END IF;
    END IF;
END; $$

CREATE TRIGGER Insert_Rents before insert ON RENTS
for each row
BEGIN
    IF (NEW.Return_State = "") THEN
        SET NEW.Return_State = NULL;
    END IF;
    IF (NEW.Start_date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must be greater than 1990-01-01';
    ELSEIF (NEW.Finish_Date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than 1990-01-01';
    ELSEIF (NEW.Return_State <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Return State must be positive integer';
    ELSEIF (NEW.Finish_Date < NEW.Start_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than Start Date';
    END IF;
    IF NOT EXISTS (SELECT License_Plate,Start_Date,Finish_Date
                    FROM RESERVES
                    WHERE RESERVES.License_Plate=NEW.License_Plate and RESERVES.Start_Date=NEW.Start_Date and RESERVES.Finish_Date=NEW.Finish_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be the same with the respective reservetion';
    ELSEIF NOT EXISTS (SELECT License_Plate,Start_Date,Start_Location
                    FROM RESERVES
                    WHERE RESERVES.License_Plate=NEW.License_Plate and RESERVES.Start_Date=NEW.Start_Date and RESERVES.Start_Location=NEW.Start_Location) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Location must be the same with the respective reservetion';
    ELSEIF NOT EXISTS (SELECT License_Plate,Start_Date,Finish_Location
                    FROM RESERVES
                    WHERE RESERVES.License_Plate=NEW.License_Plate and RESERVES.Start_Date=NEW.Start_Date and RESERVES.Finish_Location=NEW.Finish_Location) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Location must be the same with the respective reservetion';
    ELSEIF NOT EXISTS (SELECT License_Plate,Start_Date,Customer_ID
                    FROM RESERVES
                    WHERE RESERVES.License_Plate=NEW.License_Plate and RESERVES.Start_Date=NEW.Start_Date and RESERVES.Customer_ID=NEW.Customer_ID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer ID must be the same with the respective reservetion';
    END IF;
END; $$

CREATE TRIGGER Update_Rents before update ON RENTS
for each row
BEGIN
    IF (NEW.Return_State = "") THEN
        SET NEW.Return_State = OLD.Return_State;
    END IF;
    IF (NEW.Start_date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start Date must be greater than 1990-01-01';
    ELSEIF (NEW.Finish_Date < '1990-01-01') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than 1990-01-01';
    ELSEIF (NEW.Return_State < 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Return State must be positive integer';
    ELSEIF (NEW.Finish_Date < NEW.Start_Date) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Finish Date must be greater than Start Date';
    END IF;
END; $$

CREATE TRIGGER Insert_Payment_Transaction before insert ON PAYMENT_TRANSACTION
for each row
BEGIN
    IF (NEW.Payment_Amount = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment Amount must not be empty';
    END IF;
    IF (NEW.Payment_Method = "") THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment Method must not be empty';
    END IF;
    IF (NEW.Payment_Amount <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount must be positive integer';
    END IF;
END; $$

CREATE TRIGGER Update_Payment_transaction before update ON PAYMENT_TRANSACTION
for each row
BEGIN
    IF (NEW.Payment_Amount = "") THEN
        SET NEW.Start_Date = OLD.Start_Date;
    END IF;
    IF (NEW.Payment_Method = "") THEN
        SET NEW.License_Plate = OLD.License_Plate;
    END IF;
    IF (NEW.Payment_Amount <= 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment amount must be positive integer';
    END IF;
END; $$


CREATE TRIGGER Insert_After_Payment_Transaction after insert ON PAYMENT_TRANSACTION
for each row
BEGIN
    UPDATE RESERVES
    SET Paid = TRUE
    WHERE RESERVES.License_Plate = NEW.License_Plate and RESERVES.Start_Date = NEW.Start_Date;
END; $$

DELIMITER ;
