CREATE TABLE Hotel( 
    hotelNo NUMERIC(5,0), 
    hotelName Varchar(30), 
    city Varchar(30), 
    PRIMARY KEY (hotelNo) 
);

CREATE TABLE Room( 
    roomNo NUMERIC(3,0), 
    hotelNo NUMERIC(5,0), 
    roomType Varchar(10), 
    price Numeric(4,2), 
    PRIMARY KEY (roomNo,hotelNo), 
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo) 
);

CREATE SEQUENCE guestConsecutive
START WITH 1
INCREMENT BY 1;

CREATE TABLE Guest( 
    guestNo NUMERIC(3,0), 
    guestName VARCHAR(40), 
    guestAddress VARCHAR(40), 
    PRIMARY KEY (guestNo) 
);

CREATE TABLE Booking( 
    hotelNo NUMERIC(5,0), 
    guestNo NUMERIC(3,0), 
    dateFrom DATE, 
    dateTo DATE, 
    roomNo NUMERIC(3,0), 
    PRIMARY KEY (hotelNo, guestNo, dateFrom), 
    FOREIGN KEY (guestNo) REFERENCES Guest(guestNo), 
    FOREIGN KEY (roomNo,hotelNo) REFERENCES Room(roomNo, hotelNo) 
);



