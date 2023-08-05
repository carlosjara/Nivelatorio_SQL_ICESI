

-- Crear tabla Hotel
CREATE TABLE Hotel (
    hotelNo INT PRIMARY KEY,
    hotelName VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Crear tabla Room
CREATE TABLE Room (
    roomNo INT PRIMARY KEY CHECK (roomNo BETWEEN 1 AND 120),
    hotelNo INT,
    roomType VARCHAR(50) NOT NULL CHECK (roomType IN ('Single', 'Double', 'Family')),
    price DECIMAL(10, 2) NOT NULL CHECK (price BETWEEN 10 AND 100),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
);

-- Crear tabla Guest
CREATE TABLE Guest (
    guestNo INT PRIMARY KEY,
    guestName VARCHAR(100) NOT NULL,
    guestAddress VARCHAR(200) NOT NULL
);

-- Crear tabla Booking
CREATE TABLE Booking (
    hotelNo INT,
    guestNo INT,
    dateFrom DATE NOT NULL,
    dateTo DATE NOT NULL,
    roomNo INT,
    PRIMARY KEY (hotelNo, guestNo, dateFrom, roomNo),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES Guest(guestNo),
    FOREIGN KEY (roomNo) REFERENCES Room(roomNo),
    CHECK (dateFrom < dateTo)
);

-- Inserts para Hotel
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (1, 'Grand Hotel Bogotá', 'Bogotá');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (2, 'Cartagena Beach Resort', 'Cartagena');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (3, 'Medellín Plaza Hotel', 'Medellín');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (4, 'Cali City Center Inn', 'Cali');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (5, 'Santa Marta Sea View', 'Santa Marta');

-- Inserts para Room
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (11, 1, 'Single', 90.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (12, 1, 'Double', 100.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (21, 2, 'Single', 95.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (22, 2, 'Double', 80.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (31, 3, 'Single', 70.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (32, 3, 'Family', 100.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (41, 4, 'Single', 60.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (51, 5, 'Double', 85.00);


-- Inserts para Guest
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (101, 'John Doe', '123 Main St, City X');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (102, 'Jane Smith', '456 Park Ave, City Y');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (201, 'Mike Johnson', '789 Elm St, City Z');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (301, 'Alice Brown', '567 Oak St, City X');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (401, 'Robert Lee', '987 Pine St, City Y');


-- Inserts para Booking
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (1, 101, TO_DATE('2023-08-10','YYYY-MM-DD'), TO_DATE( '2023-08-15','YYYY-MM-DD'), 11);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (1, 102, TO_DATE( '2023-08-12','YYYY-MM-DD'), TO_DATE( '2023-08-18','YYYY-MM-DD'), 12);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (2, 201, TO_DATE( '2023-08-11','YYYY-MM-DD'), TO_DATE( '2023-08-14','YYYY-MM-DD'), 21);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (3, 301, TO_DATE( '2023-08-13','YYYY-MM-DD'), TO_DATE( '2023-08-17','YYYY-MM-DD'), 31);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (4, 101, TO_DATE( '2023-08-15','YYYY-MM-DD'), TO_DATE( '2023-08-20','YYYY-MM-DD'), 41);
