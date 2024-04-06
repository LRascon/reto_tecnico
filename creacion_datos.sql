USE vuelos_mexico

-- Creación de tablas
CREATE TABLE aerolineas (
    ID_AEROLINEA INT PRIMARY KEY,
    NOMBRE_AEROLINEA VARCHAR(100)
);

CREATE TABLE aeropuertos (
    ID_AEROPUERTO INT PRIMARY KEY,
    NOMBRE_AEROPUERTO VARCHAR(100)
);

CREATE TABLE movimientos (
    ID_MOVIMIENTO INT PRIMARY KEY,
    DESCRIPCION VARCHAR(100)
);

CREATE TABLE vuelos (
    ID_AEROLINEA INT,
    ID_AEROPUERTO INT,
    ID_MOVIMIENTO INT,
    DIA DATE,
    FOREIGN KEY (ID_AEROLINEA) REFERENCES aerolineas(ID_AEROLINEA),
    FOREIGN KEY (ID_AEROPUERTO) REFERENCES aeropuertos(ID_AEROPUERTO),
    FOREIGN KEY (ID_MOVIMIENTO) REFERENCES movimientos(ID_MOVIMIENTO)
);

-- Inserción de datos
INSERT INTO aerolineas (ID_AEROLINEA, NOMBRE_AEROLINEA) VALUES
(1, 'Volaris'),
(2, 'Aeromar'),
(3, 'Interjet'),
(4, 'Aeromexico');

INSERT INTO aeropuertos (ID_AEROPUERTO, NOMBRE_AEROPUERTO) VALUES
(1, 'Benito Juarez'),
(2, 'Guanajuato'),
(3, 'La Paz'),
(4, 'Oaxaca');

INSERT INTO movimientos (ID_MOVIMIENTO, DESCRIPCION) VALUES
(1, 'Salida'),
(2, 'Llegada');

INSERT INTO vuelos (ID_AEROLINEA, ID_AEROPUERTO, ID_MOVIMIENTO, DIA) VALUES
(1, 1, 1, '2021-05-02'),
(2, 1, 1, '2021-05-02'),
(3, 2, 2, '2021-05-02'),
(4, 3, 2, '2021-05-02'),
(1, 3, 2, '2021-05-02'),
(2, 1, 1, '2021-05-02'),
(2, 3, 1, '2021-05-04'),
(3, 4, 1, '2021-05-04'),
(3, 4, 1, '2021-05-04');
