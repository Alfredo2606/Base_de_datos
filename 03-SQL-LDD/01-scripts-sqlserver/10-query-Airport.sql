CREATE DATABASE Airport;
USE Airport;

CREATE TABLE AIRPORT (
    AirportCode INT PRIMARY KEY,
    CityAirport VARCHAR(50) NOT NULL,
    StateAirport VARCHAR(50) NOT NULL,
    NameAirport VARCHAR(50) NOT NULL
);

CREATE TABLE AIRPLANE_TYP (
    Type_name_AIRPLANE_TYP INT PRIMARY KEY,
    Company VARCHAR(50) NOT NULL,
    Max__seat VARCHAR(50) NOT NULL
);

CREATE TABLE CAN_LAND (
    NumCan_land INT PRIMARY KEY,
    AirportCode INT NOT NULL,
    Type_name_AIRPLANE_TYP INT NOT NULL,
    CONSTRAINT fk_can_land_airport FOREIGN KEY (AirportCode) 
        REFERENCES AIRPORT(AirportCode),
    CONSTRAINT fk_can_land_airplane_typ FOREIGN KEY (Type_name_AIRPLANE_TYP) 
        REFERENCES AIRPLANE_TYP(Type_name_AIRPLANE_TYP)
);

CREATE TABLE AIRPLANE (
    AirplaneId INT PRIMARY KEY,
    Total_no_of_seat VARCHAR(50) NOT NULL,
    Type_name_AIRPLANE_TYP INT NOT NULL,
    FOREIGN KEY (Type_name_AIRPLANE_TYP) 
        REFERENCES AIRPLANE_TYP(Type_name_AIRPLANE_TYP)
);

CREATE TABLE FLIGHT (
    NumerFlingt INT PRIMARY KEY,
    Airline VARCHAR(50) NOT NULL,
    WeekDays DATE NOT NULL
);

CREATE TABLE FLIGHT_LEG (
    Leg_no INT PRIMARY KEY,
    AirportCode INT NOT NULL,
    NumerFlingt INT NOT NULL,
    Departure_airport VARCHAR(50) NOT NULL,
    Arrival_airport VARCHAR(50) NOT NULL,
    FOREIGN KEY (AirportCode) REFERENCES AIRPORT(AirportCode),
    FOREIGN KEY (NumerFlingt) REFERENCES FLIGHT(NumerFlingt)
);

CREATE TABLE FARE (
    Core INT PRIMARY KEY,
    Amount VARCHAR(50) NOT NULL,
    Restrictions VARCHAR(100) NOT NULL,
    NumerFlingt INT NOT NULL,
    FOREIGN KEY (NumerFlingt) REFERENCES FLIGHT(NumerFlingt)
);

CREATE TABLE LEG_INSTANCE (
    Date_Leg_Instase DATE PRIMARY KEY,
    No_fo_avail_seats VARCHAR(50) NOT NULL,
    Dep_time TIME NOT NULL,
    Arr_time TIME NOT NULL,
    Leg_no INT NOT NULL,
    AirportCode INT NOT NULL,
    AirplaneId INT NOT NULL,
    NumerFlingt INT NOT NULL,
    Departure_airport VARCHAR(50) NOT NULL,
    Arrival_airport VARCHAR(50) NOT NULL,
    Departs_airport INT,
    Arrives_airport INT,
    FOREIGN KEY (Leg_no) REFERENCES FLIGHT_LEG(Leg_no),
    FOREIGN KEY (AirportCode) REFERENCES AIRPORT(AirportCode),
    FOREIGN KEY (AirplaneId) REFERENCES AIRPLANE(AirplaneId),
    FOREIGN KEY (NumerFlingt) REFERENCES FLIGHT(NumerFlingt)
);

CREATE TABLE SEAT (
    Seat_no INT PRIMARY KEY,
    Date_Leg_Instase DATE NOT NULL,
    Leg_no INT NOT NULL,
    AirportCode INT NOT NULL,
    AirplaneId INT NOT NULL,
    NumerFlingt INT NOT NULL,
    Departs_airport INT,
    Arrives_airport INT,
    Departure_airport VARCHAR(50) NOT NULL,
    Arrival_airport VARCHAR(50) NOT NULL,
    FOREIGN KEY (Date_Leg_Instase) REFERENCES LEG_INSTANCE(Date_Leg_Instase)
);
