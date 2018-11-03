USE CAR_RENTAL;

INSERT INTO CUSTOMER(IRS_Number,SSN,Last_Name,First_Name,Driver_License,First_Registration,City,Postal_Code,Street,Street_Number)
VALUES
('4200','1312420500','Papadopoulos','Pitsos','3984','2012-12-12','Athens','14572','Fidiou','32'),
('4201','1313320500','Lukakis','Iasonas','3973','2010-10-11','Athens','15235','Parnithos','32'),
('0420','1316850500','Loukopoulos','Kitsos','3982','2009-10-11','Patra','15532','Patroklou','22'),
('0042','1982347560','Kokopoulos','Georgios','3420','2004-10-01','Thessaloniki','12354','Papanikoli','4'),
('1295','1523467896','Konopoulos','Georgios','1620','2006-09-01','Thessaloniki','15233','Papanikoli','15'),
('2395','1523462136','Kostopoulos','Nikolaos','3520','2008-09-10','Thessaloniki','15235','Miaouli','15'),
('7795','1152342316','Theodorakis','Grigorios','3220','2004-11-05','Patra','15225','Menelaou','42'),
('3795','2123478968','Pappoutsi','Maria','1230','2010-11-01','Thessaloniki','13267','Trikalon','112'),
('9090','1896567896','Kanelopoulos','Kleovoulos','3120','2016-09-01','Thessaloniki','15222','Mikinon','22'),
('3240','3181237896','Dimitriou','Kleomenis','4121','2016-10-12','Patra','15299','Minotayrou','42'),
('3241','3181117896','Dimitropoulou','Kiveli','4424','2016-12-17','Patra','15344','Marathonos','4'),
('3344','3321117896','Solomou','Eyterpi','1324','2015-12-17','Rhodes','12355','Opliston','8'),
('9544','3320666896','Papadopoulou','Aleksandra','5687','2016-11-20','Rhodes','12355','Neofitrou','84'),
('9534','3326666896','Poroploiarxos','Nikitas','5447','2014-08-20','Rhodes','12455','Neokastrou','68'),
('3789','3312317896','Lalas','Solonas','8975','2014-09-15','Irakleio','12355','Mitropoleos','32'),
('3765','3522317896','Liagkas','Sokratis','8685','2013-09-09','Irakleio','12355','Miaouli','25'),
('3742','3521312896','Liakopoulos','Anastasios','8905','2014-10-30','Irakleio','12456','Koromila','35'),
('3889','3912317896','John','MacPitterson','4975','2017-03-15','London','68597','Linester','32'),
('3365','5522317896','Liagkas','Sokratis','0685','2016-09-09','London','68598','Morison','15'),
('3762','0521312896','Liakopoulos','Anastasios','0905','2015-11-30','London','68599','Boomson','55');



INSERT INTO STORE(Street,Street_Number,Postal_Code,City)
VALUES
('Marathonos','43','15234','Athens'),
('Tsimiski','87','23568','Thessaloniki'),
('Mixalakopoulou','22','13334','Patra'),
('Ilioupoleos','4','16239','Rhodes'),
('Minotaurou','37','18934','Irakleio');


INSERT INTO EMPLOYEE(IRS_Number,SSN,Driver_License,First_Name,Last_Name,Street,Street_Number,Postal_Code,City)
VALUES
('1000','10000','100000','Menios','Tsimourtos','Adamwn','12','14671','Thessaloniki'),
('1994','1902837465','4312','Kostas','Mitroglou','Korai','55','13255','Athens'),
('1998','1123474656','4994','Apostolis','Kailas','Aiados','44','15235','Athens'),
('1990','1234567890','4445','Apostolis','Lapadopoulos','Amaliados','14','15635','Athens'),
('2988','1999999999','4444','Neoklis','Papadopoulos','Anithou','14','15435','Athens'),
('9012','0900900991','4446','Kostantinos','Kastoras','Kolokotroni','44','16635','Thessaloniki'),
('1111','1112223334','2313','Kostantina','Koromila','Miaouli','3','16123','Thessaloniki'),
('6666','1695590699','2111','Klelia','Panagiotopoulou','Karageorga','13','14455','Thessaloniki'),
('5566','1231234466','1212','Valantis','Sferopoulos','Katsadoni','10','12355','Thessaloniki'),
('4495','0918723699','1912','Kostantinos','Arnaoutoglou','Pindou','4','13955','Patra'),
('1240','1412347465','8956','Eyterpi','Manolidou','Patroklou','5','14335','Patra'),
('1820','1432197465','4456','Labros','Alabanos','Giassemion','15','13535','Patra'),
('1984','1178937465','5612','Thomas','Zampras','Karageorgi','33','15255','Rhodes'),
('7494','1432123457','4996','Agamemnonas','Apostolou','Giannopoulou','85','15235','Rhodes'),
('7895','1569687352','3896','Menelaos','Nikolaidis','Irodotou','15','15065','Rhodes'),
('8494','0343289654','2696','Elena','Giakomopoulou','Antheon','35','15836','Irakleio'),
('8554','1896512365','2296','Alexandros','Tsipras','Riggilis','85','15654','Irakleio'),
('9999','1001234457','4986','Adreas','Dalianis','Kiprion Agoniston','26','15236','Irakleio'),
('9998','1031234457','4988','Adreas','Paspatis','Trikalon','26','15236','Irakleio'),
('9997','1896544365','2292','Alexandros','Panousis','Ploutarxou','85','15654','Rhodes'),
('5556','1231234966','1292','Vasileios','Sferokos','Karageorga','10','12355','Athens'),
('5666','1231234467','1222','Vasileios','Tiramisos','Kekropos','13','12355','Athens'),
('1821','3432197065','7457','Zaxos','Alakanos','Antheon','15','11765','Patra'),
('1985','5178037465','8613','Thomas','Zaxariadis','Nikitara','21','15255','Rhodes'),
('7777','3432197865','7456','Labros','Alabanos','Giassemion','15','13535','Patra'),
('7778','5178038465','8612','Thomas','Zampras','Karageorgi','33','15255','Rhodes');

/*
IRS_NUMBER must exists in EMPLOYEE, Store_ID must exist in STORE (it's an autoincreement number, so something like '1','2',etc...)
*/
INSERT INTO WORKS(IRS_Number,Store_ID,Start_Date,Finish_Date,Job)
VALUES
('1000','1','2012-11-15','2013-10-17','Secretary'),
('1000','1','2013-10-18','2013-12-17','Secretary'),
('1000','1','2013-12-18','2014-01-17','Secretary'),
('1000','2','2014-01-18','2019-10-17','Manager'),
('1998','1','2011-10-18','2015-12-25','Manager'),
('1990','1','2010-12-26','2016-02-22','Security'),
('2988','1','2013-02-23','2018-06-30','Maintenance'),
('9012','2','2011-12-20','2012-04-11','Manager'),
('1111','2','2009-12-20','2010-02-04','Secretary'),
('1111','3','2010-02-05','2011-02-04','Secretary'),
('1111','2','2011-02-05','2012-02-04','Secretary'),
('1111','1','2012-02-05','2013-02-04','Secretary'),
('1111','2','2013-02-05','2014-02-04','Secretary'),
('6666','2','2011-12-20','2018-06-30','Maintenance'),
('5566','2','2012-12-20','2018-06-30','Secretary'),
('4495','3','2014-11-05','2019-12-25','Manager'),
('1240','3','2016-11-05','2018-06-30','Security'),
('1820','3','2011-11-05','2013-12-17','Maintenance'),
('1984','4','2017-12-01','2018-01-07','Manager'),
('7494','4','2011-12-01','2014-01-17','Secretery'),
('7895','4','2014-12-01','2015-12-25','Security'),
('8494','5','2017-11-20','2018-01-07','Manager'),
('8554','5','2007-11-20','2013-12-17','Security'),
('9999','5','2007-01-20','2013-12-17','Secretary'),
('1994','2','2008-01-20','2013-12-17','Secretary'),
('9998','5','2018-01-01','2020-01-20','Manager'),
('9997','4','2017-01-01','2020-05-20','Manager'),
('5556','1','2016-01-01','2019-06-01','Security'),
('5666','1','2016-02-24','2018-06-24','Manager'),
('7778','4','2017-02-23','2019-03-23','Secretary'),
('1985','2','2014-03-20','2016-03-20','Maintenance'),
('7777','1','2014-03-20','2015-02-20','Security'),
('7778','3','2013-07-10','2014-03-20','Security');


/*
Store_ID must exist in STORE (it's an autoincreement number, so something like '1','2',etc...)
*/
INSERT INTO VEHICLE(License_Plate,CType,Make,Model,Cylinder_Capacity,Horse_Power,CYear,Kilometers,Last_Service,Next_Service,Insurance_Exp_Date,Damages,Malfunctions,Store_ID)
VALUES
('NOE 1620','Car','Audi','R4','1500','190','2006','90000','2017-11-26','2018-04-23','2020-11-01','none','none',1),
('IZO 4200','Car','BMW','Z4','1600','120','2014','100000','2017-11-26','2018-04-13','2020-12-30','none','none',1),
('IZE 4201','ATV','Honda','Sportrax90','1000','80','2008','80000','2017-10-26','2018-08-23','2020-12-30','none','none',1),
('IOY 2290','Car','Mazda','CX5','1800','180','2004','90000','2017-12-26','2018-08-23','2020-10-20','none','none',2),
('IOY 1890','MiniVan','Volkswagen','Tansporter','1800','200','2004','160000','2017-12-08','2018-08-23','2020-10-20','none','none',2),
('IZE 4203','ATV','Honda','Fourtrax420','900','80','2010','180000','2017-11-26','2018-09-23','2020-12-30','none','none',2),
('IOY 5589','Motorcycle','KTM','390cc','800','50','2013','100000','2017-12-05','2018-09-20','2020-10-01','none','none',3),
('IZY 2348','Motorcycle','Yamaha','Xtz 125','800','50','2011','30000','2017-12-05','2018-09-20','2020-10-01','none','none',3),
('IZE 4202','ATV','Honda','Fourtrax420','900','80','2010','180000','2017-12-15','2018-11-23','2021-01-30','none','none',3),
('IZO 2420','Car','Audi','R8','1700','180','2010','60000','2017-10-26','2018-12-25','2021-12-30','none','none',4),
('IZK 4500','Car','Lamborghini','Huracan','1800','250','2015','25000','2017-10-23','2018-11-03','2020-10-01','none','none',4),
('IZE 1620','Car','Audi','Rs7','1900','230','2015','90000','2017-10-20','2018-10-13','2021-12-01','Broken Chair','none',2),
('IZO 7720','Car','Audi','Rs3','1400','190','2003','300000','2017-11-16','2018-09-23','2021-10-01','Broken window','none',3),
('IZO 4420','Car','Audi','Q7','1800','210','2012','192000','2017-09-26','2018-09-23','2020-11-01','none','Wheel turning',4),
('IZY 4422','Car','Audi','Q7','1800','210','2012','192000','2017-10-20','2018-09-27','2020-12-01','none','Left Light',5),
('NOE 1420','Truck','Volkswagen','Crafter','1900','190','2016','190000','2017-12-20','2018-09-23','2020-02-01','none','none',5),
('INO 1420','Truck','Honda','RidgeLine','1800','160','2018','19000','2018-01-02','2018-09-23','2025-01-01','none','none',2),
('IZO 4423','Car','Citroen','Xaara','1500','120','2014','152000','2017-10-14','2018-02-27','2022-12-01','none','none',3),
('IOX 1891','MiniVan','Volkswagen','Tansporter','1800','200','2017','120000','2017-10-18','2018-05-23','2019-12-29','none','none',2),
('IZY 4233','ATV','Honda','Fourtrax420XT','1000','100','2015','18000','2018-01-06','2018-05-26','2021-12-10','none','none',1),
('IPY 5584','Motorcycle','KTM','790DUKE','100','80','2015','10000','2017-10-05','2018-03-25','2021-12-09','none','none',1),
('IKY 2348','Motorcycle','Yamaha','Xtz 125','800','50','2011','30000','2017-12-05','2018-09-20','2020-10-01','none','none',4),
('INY 5253','Minivan','Honda','Odysey','1500','130','2018','17000','2018-01-06','2018-09-26','2023-02-20','none','none',3),
('ONY 5253','Minivan','Honda','Odysey','1600','130','2016','14000','2017-11-06','2018-05-26','2017-12-20','none','none',3);



INSERT INTO FUEL_TYPE(License_Plate, Fuel)
VALUES
('NOE 1620','Petrol'),
('IZO 4200','Diesel'),
('IZE 4201','Petrol'),
('IOY 2290','Petrol'),
('IOY 1890','Petrol'),
('IZE 4203','Diesel'),
('IOY 5589','Petrol'),
('IZY 2348','Diesel'),
('IZE 4202','Petrol'),
('IZO 2420','Diesel'),
('IZK 4500','Diesel'),
('IZE 1620','Petrol'),
('IZO 7720','Petrol'),
('IZO 4420','Diesel'),
('IZY 4422','Petrol'),
('NOE 1420','Petrol'),
('IKY 2348','Petrol'),
('INO 1420','Diesel'),
('INY 5253','Petrol'),
('IOX 1891','Petrol'),
('IPY 5584','Hybrid'),
('IZY 4233','Petrol'),
('IZO 4423','Diesel');

/*
Store_ID must exist in STORE (it's an autoincreement number, so something like '1','2',etc...)
*/
INSERT INTO PHONE_NUMBER(Store_ID,Phone)
VALUES
('1','2105722910'),
('1','2105722810'),
('2','2310601695'),
('2','2316601695'),
('2','2310601895'),
('3','2610276481'),
('3','2610273481'),
('4','2241060169'),
('4','2241860169'),
('5','2810245430'),
('5','2810245234');

/*
Store_ID must exist in STORE (it's an autoincreement number, so something like '1','2',etc...)
*/
INSERT INTO EMAIL_ADDRESS(Store_ID,Email)
VALUES
('1','marathonos43@carrental.com'),
('1','marathonos43support@carrental.com'),
('2','tsimiski87@carrental.com'),
('2','tsimiski87support@carrental.com'),
('3','mixalakopoulou22@carrental.com'),
('3','mixalakopoulou22support@carrental.com'),
('4','ilioupoleos4@carrental.com'),
('4','ilioupoleos4support@carrental.com'),
('5','minotaurou37@carrental.com'),
('5','minotaurou37support@carrental.com'),
('1','marathonos43@hotmail.com'),
('2','tsimiski87@hotmail.com'),
('3','mixalakopoulou22support@hotmail.com');



INSERT INTO RESERVES(License_Plate, Start_Date, Start_Location, Finish_Location, Finish_Date, Paid, Customer_ID)
VALUES
('NOE 1620','2017-04-12','4','1','2017-04-20',FALSE,'1'),
('NOE 1620','2017-10-10','1','2','2017-10-15',FALSE,'2'),
('NOE 1620','2017-12-27','2','3','2018-01-05',FALSE,'1'),
('NOE 1620','2018-06-20','1','2','2018-07-30',FALSE,'7'),
('IZO 4200','2017-06-20','2','2','2017-06-30',FALSE,'7'),
('IZE 4201','2017-07-20','2','2','2017-07-30',FALSE,'7'),
('IZE 4201','2016-04-20','2','2','2016-04-30',FALSE,'4'),
('IOY 1890','2016-04-20','3','1','2016-04-30',FALSE,'4'),
('IZE 4203','2018-09-12','4','4','2018-09-30',FALSE,'5'),
('IZE 4202','2018-07-09','3','3','2018-07-22',FALSE,'10'),
('IZE 4202','2018-06-10','3','3','2018-06-22',FALSE,'10'),
('NOE 1420','2018-10-05','5','2','2018-10-25',FALSE,'16'),
('IZO 4420','2018-08-03','3','5','2018-09-01',FALSE,'12'),
('IZY 2348','2018-09-13','2','5','2018-09-25',FALSE,'3'),
('IZE 4202','2018-03-13','2','2','2018-03-23',FALSE,'4'),
('INY 5253','2018-04-10','5','5','2018-04-25',FALSE,'15'),
('INY 5253','2018-06-01','4','4','2018-06-12',FALSE,'14'),
('IZO 4200','2017-05-20','2','1','2017-05-30',FALSE,'1'),
('IZE 4202','2017-06-10','3','3','2017-06-22',FALSE,'10'),
('IZE 4202','2017-07-10','3','3','2017-07-22',FALSE,'10'),
('INY 5253','2017-06-01','4','4','2017-06-12',FALSE,'14'),
('IOY 5589','2017-05-03','3','3','2017-05-10',FALSE,'10'),
('IOY 5589','2018-01-02','3','3','2018-01-30',FALSE,'11'),
('IZY 4422','2018-01-02','3','3','2018-01-30',FALSE,'11');


INSERT INTO RENTS(Start_date, License_Plate, Start_Location, Finish_Location, Finish_Date , Return_State,  Customer_ID, IRS_Number)
VALUES
('2016-04-20','IOY 1890','3','1','2016-04-30','7','4','5666'),
('2016-04-20','IZE 4201','2','2','2016-04-30','7','4','1000'),
('2017-04-12','NOE 1620','4','1','2017-04-20','8','1','5666'),
('2017-05-03','IOY 5589','3','3','2017-05-10','9','10','4495'),
('2017-05-20','IZO 4200','2','1','2017-05-30','8','1','5666'),
('2017-06-01','INY 5253','4','4','2017-06-12','7','14','9997'),
('2017-07-20','IZE 4201','2','2','2017-07-30','9','7','1000'),
('2017-06-20','IZO 4200','2','2','2017-06-30','8', '7','1000'),
('2017-07-10','IZE 4202','3','3','2017-07-22','8','10','4495'),
('2017-10-10','NOE 1620','1','2','2017-10-15','7','2','1000'),
('2017-12-27','NOE 1620','2','3','2018-01-05','9','1','5666'),
('2018-03-13','IZE 4202','2','2','2018-03-23','8', '4','5666'),
('2018-04-10','INY 5253','5','5','2018-04-25','7','15','9998'),
('2018-01-02','IOY 5589','3','3','2018-01-30',NULL,'11','4495'),
('2018-01-02','IZY 4422','3','3','2018-01-30',NULL,'11','4495');

INSERT INTO PAYMENT_TRANSACTION(Start_Date, License_Plate, Payment_Amount, Payment_Method)
VALUES
('2016-04-20','IOY 1890','60','Card'),
('2016-04-20','IZE 4201','90','Card'),
('2017-04-12','NOE 1620','140','Card'),
('2017-05-03','IOY 5589','180','Cash'),
('2017-05-20','IZO 4200','130','Cash'),
('2017-06-01','INY 5253','180','Cash'),
('2017-07-20','IZE 4201','120','Card'),
('2017-06-20','IZO 4200','90','Card'),
('2017-07-10','IZE 4202','130','Cash'),
('2017-10-10','NOE 1620','70','Card'),
('2017-12-27','NOE 1620','120','Card'),
('2018-03-13','IZE 4202','130','Cash'),
('2018-04-10','INY 5253','90','Card'),
('2018-01-02','IOY 5589','80','Cash'),
('2018-01-02','IZY 4422','40','Card');
