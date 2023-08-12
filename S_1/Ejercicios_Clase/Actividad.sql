/*
***************************************************************************************
***************************************************************************************
Información del Script:
Nombre del archivo: Actividad.sql
Autor: Carlos Enrique Jaramillo Aros
Fecha de creación: 4 de agosto de 2023
***************************************************************************************
*/
/*
***************************************************************************************
***************************************************************************************
Descripción del Script:
Este script SQL crea las tablas necesarias para un sistema de reservas de hotel,
incluyendo las tablas para hoteles, habitaciones, huéspedes y reservas.
Luego, inserta datos de muestra en estas tablas con fines de demostración.
***************************************************************************************
*/

-- Tabla: Hotel
-- Descripción: Almacena información sobre los hoteles.
-- Columnas:
-- - hotelNo: Número único que identifica cada hotel.
-- - hotelName: Nombre del hotel.
-- - city: Ciudad donde se encuentra el hotel.
CREATE TABLE Hotel (
    hotelNo INT PRIMARY KEY,
    hotelName VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- Tabla: Room
-- Descripción: Almacena información sobre las habitaciones del hotel.
-- Columnas:
-- - roomNo: Número único que identifica cada habitación (Debe estar entre 1 y 120).
-- - hotelNo: Número del hotel al que pertenece la habitación (foránea a la tabla Hotel).
-- - roomType: Tipo de habitación (opciones: Single, Double, Family).
-- - price: Precio de la habitación (debe estar entre 10 y 100).
CREATE TABLE Room (
    roomNo INT PRIMARY KEY CHECK (roomNo BETWEEN 1 AND 120),
    --roomNo INT PRIMARY KEY CHECK (roomNo >= 1 AND roomNo <= 120),
    hotelNo INT,
    roomType VARCHAR(50) NOT NULL CHECK (roomType IN ('Single', 'Double', 'Family')),
    price NUMERIC(5, 2) NOT NULL CHECK (price BETWEEN 10 AND 100), --1234506789,22
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
);

-- Tabla: Guest
-- Descripción: Almacena información sobre los huéspedes del hotel.
-- Columnas:
-- - guestNo: Número único que identifica cada huésped.
-- - guestName: Nombre del huésped.
-- - guestAddress: Dirección del huésped.
CREATE TABLE Guest (
    guestNo INT PRIMARY KEY,
    guestName VARCHAR(100) NOT NULL,
    guestAddress VARCHAR(200) NOT NULL
);

-- Tabla: Booking
-- Descripción: Almacena información sobre las reservas de hotel.
-- Columnas:
-- - hotelNo: Número del hotel donde se realizó la reserva (foránea a la tabla Hotel).
-- - guestNo: Número del huésped que realizó la reserva (foránea a la tabla Guest).
-- - dateFrom: Fecha de inicio de la reserva.
-- - dateTo: Fecha de finalización de la reserva.
-- - roomNo: Número de la habitación reservada (foránea a la tabla Room).
-- Restricciones:
-- - La fecha de inicio (dateFrom) debe ser anterior a la fecha de finalización (dateTo).
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
-- Insertar datos de muestra de hoteles.
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (1, 'Grand Hotel Bogotá', 'Bogotá');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (2, 'Cartagena Beach Resort', 'Cartagena');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (3, 'Medellín Plaza Hotel', 'Medellín');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (4, 'Cali City Center Inn', 'Cali');
INSERT INTO Hotel (hotelNo, hotelName, city) VALUES (5, 'Santa Marta Sea View', 'Santa Marta');

-- Inserts para Room
-- Insertar datos de muestra de habitaciones.
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (1, 1, 'Single', 90.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (2, 1, 'Double', 100.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (3, 2, 'Single', 95.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (4, 2, 'Double', 80.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (5, 3, 'Single', 70.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (6, 3, 'Family', 100.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (7, 4, 'Single', 60.00);
INSERT INTO Room (roomNo, hotelNo, roomType, price) VALUES (8, 5, 'Double', 85.00);

-- Inserts para Guest
-- Insertar datos de muestra de huéspedes.
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (101, 'John Doe', '123 Main St, City X');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (102, 'Jane Smith', '456 Park Ave, City Y');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (201, 'Mike Johnson', '789 Elm St, City Z');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (301, 'Alice Brown', '567 Oak St, City X');
INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES (401, 'Robert Lee', '987 Pine St, City Y');

-- Inserts para Booking
-- Insertar datos de muestra de reservas.
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (1, 101, TO_DATE('2023-08-10','YYYY-MM-DD'), TO_DATE( '2023-08-15','YYYY-MM-DD'), 1);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (1, 102, TO_DATE('2023-08-12','YYYY-MM-DD'), TO_DATE( '2023-08-18','YYYY-MM-DD'), 2);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (2, 201, TO_DATE('2023-08-11','YYYY-MM-DD'), TO_DATE( '2023-08-14','YYYY-MM-DD'), 3);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (3, 301, TO_DATE('2023-08-13','YYYY-MM-DD'), TO_DATE( '2023-08-17','YYYY-MM-DD'), 4);
INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES (4, 101, TO_DATE('2023-08-15','YYYY-MM-DD'), TO_DATE( '2023-08-20','YYYY-MM-DD'), 5);
