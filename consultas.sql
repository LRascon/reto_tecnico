USE vuelos_mexico

-- Consulta 1: Aeropuerto con mayor movimiento
SELECT a.NOMBRE_AEROPUERTO, COUNT(*) AS MOVIMIENTOS
FROM vuelos v
JOIN aeropuertos a ON v.ID_AEROPUERTO = a.ID_AEROPUERTO
GROUP BY a.NOMBRE_AEROPUERTO
ORDER BY MOVIMIENTOS DESC
LIMIT 1;

-- Consulta 2: Aerolínea con mayor número de vuelos
SELECT al.NOMBRE_AEROLINEA, COUNT(*) AS NUMERO_VUELOS
FROM vuelos v
JOIN aerolineas al ON v.ID_AEROLINEA = al.ID_AEROLINEA
GROUP BY al.NOMBRE_AEROLINEA
ORDER BY NUMERO_VUELOS DESC
LIMIT 1;

-- Consulta 3: Día con mayor número de vuelos
SELECT DIA, COUNT(*) AS NUMERO_VUELOS
FROM vuelos
GROUP BY DIA
ORDER BY NUMERO_VUELOS DESC
LIMIT 1;

-- Consulta 4: Aerolíneas con más de 2 vuelos por día
SELECT al.NOMBRE_AEROLINEA, COUNT(*) AS NUMERO_VUELOS
FROM vuelos v
JOIN aerolineas al ON v.ID_AEROLINEA = al.ID_AEROLINEA
GROUP BY al.NOMBRE_AEROLINEA, v.DIA
HAVING COUNT(*) > 2;
