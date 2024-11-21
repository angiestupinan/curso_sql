CREATE TABLE DatosAfiliado (
    IdAfiliado INT PRIMARY KEY,
    TipoDocumento VARCHAR(50),
    Identificacion VARCHAR(50),
    Nombres VARCHAR(100)
);

CREATE TABLE Instancias (
    IdAfiliado INT,
    TipoOInstancia VARCHAR(100),
    PRIMARY KEY (IdAfiliado, TipoOInstancia),
    FOREIGN KEY (IdAfiliado) REFERENCES DatosAfiliado(IdAfiliado)
);

CREATE TABLE Regionales (
    IdAfiliado INT,
    Regional VARCHAR(100),
    Zonal VARCHAR(100),
    PRIMARY KEY (IdAfiliado, Regional),
    FOREIGN KEY (IdAfiliado) REFERENCES DatosAfiliado(IdAfiliado)
);

CREATE TABLE CausalesReapertura (
    IdAfiliado INT,
    CausalReapertura VARCHAR(255),
    FechaCierreInicial DATE,
    FechaReapertura DATE,
    PRIMARY KEY (IdAfiliado, CausalReapertura),
    FOREIGN KEY (IdAfiliado) REFERENCES DatosAfiliado(IdAfiliado)
);

CREATE TABLE Areas (
    IdAfiliado INT,
    ObjetoAccion VARCHAR(255),
    PRIMARY KEY (IdAfiliado, ObjetoAccion),
    FOREIGN KEY (IdAfiliado) REFERENCES DatosAfiliado(IdAfiliado)
);

CREATE TABLE AreasCausales (
    IdAfiliado INT,
    AreaResponsable VARCHAR(255),
    PRIMARY KEY (IdAfiliado, AreaResponsable),
    FOREIGN KEY (IdAfiliado) REFERENCES DatosAfiliado(IdAfiliado)
);

-- Insertar datos en DatosAfiliado
INSERT INTO DatosAfiliado (IdAfiliado, TipoDocumento, Identificacion, Nombres)
VALUES
(92094547, 'CC', '1111666826', 'SANTIAGO ANACONA MORENO'),
(96429414, 'CC', '1000379605', 'JUAN DAVID MARTINEZ BENEDETTI'),
(25515227, 'CC', '1000326366', 'GEREMY NICOLAS GOMEZ GONZALEZ'),
(94574123, 'CC', '1000293160', 'KEVIN ANDRES ZULUAGA CORREA'),
(89211382, 'CC', '1000693769', 'STIVEN ALEXANDER MORA MORA'),
(25504699, 'CC', '1000734337', 'EVER YAMITH SUAREZ ALFONSO'),
(88871564, 'CC', '1113066954', 'JORGE ESTEBAN LUJAN GUZMAN'),
(89956861, 'CC', '1111759460', 'SARAY FERNANDA ESPINOZA SERNA'),
(45137992, 'CC', '1000506017', 'JORGE LUIS DIAZ CASTAÑEDA'),
(95736259, 'CC', '1000692631', 'JHON MARION BUSTAMANTE PINZON'),
(47306276, 'CC', '1000760596', 'RAMON FERNANDO CALDERON ORTEGA'),
(79216454, 'CC', '1108561667', 'HAYLEN VALERIA DELGADO VELASQUEZ'),
(27241391, 'CC', '1001597259', 'HANDEL JULIO MENA'),
(79801195, 'CC', '1002250367', 'YULIETH PAJARO MANCILLA'),
(45284324, 'CC', '1001189001', 'LUIS MAURICIO BLANCO FONSECA'),
(115344094, 'CC', '1001028124', 'YEISON ENRIQUE GARCIA MUNZON'),
(95260958, 'CC', '1002135672', 'ROLANDO DANIEL HERNANDEZ ROMERO'),
(41270284, 'CC', '1002395492', 'CRISTIAN CAMILO LAGOS MARTINEZ'),
(47270631, 'CC', '1001967548', 'YULIANA JULIO PEREZ'),
(94394155, 'CC', '1002158673', 'DANIELA ANDREA SIERRA PALMA');

-- Insertar datos en Instancias
INSERT INTO Instancias (IdAfiliado, TipoOInstancia)
VALUES
(92094547, 'Admisión'),
(96429414, 'Fallo de primera instancia'),
(25515227, 'Fallo de segunda instancia'),
(94574123, 'Requerimiento'),
(89211382, 'Desacato'),
(25504699, 'Sanción'),
(88871564, 'Admisión'),
(89956861, 'Fallo de primera instancia'),
(45137992, 'Fallo de segunda instancia'),
(95736259, 'Requerimiento'),
(47306276, 'Desacato'),
(79216454, 'Sanción'),
(27241391, 'Admisión'),
(79801195, 'Fallo de primera instancia'),
(45284324, 'Fallo de segunda instancia'),
(115344094, 'Requerimiento'),
(95260958, 'Desacato'),
(41270284, 'Sanción'),
(47270631, 'Admisión'),
(94394155, 'Fallo de primera instancia');

-- Insertar datos en Regionales
INSERT INTO Regionales (IdAfiliado, Regional, Zonal)
VALUES
(92094547, 'SUROCCIDENTE', 'ZONAL VALLE DEL CAUCA'),
(96429414, 'BOGOTA', 'ZONAL BOGOTA'),
(25515227, 'BOGOTA', 'ZONAL BOGOTA'),
(94574123, 'BOGOTA', 'ZONAL BOGOTA'),
(89211382, 'BOGOTA', 'ZONAL BOGOTA'),
(25504699, 'BOGOTA', 'ZONAL CUNDINAMARCA'),
(88871564, 'SUROCCIDENTE', 'ZONAL VALLE DEL CAUCA'),
(89956861, 'BOGOTA', 'ZONAL BOGOTA'),
(45137992, 'ZONA ESPECIAL', 'ZONAL CASANARE'),
(95736259, 'BOGOTA', 'ZONAL BOGOTA'),
(47306276, 'NOROCCIDENTE', 'ZONAL ANTIOQUIA'),
(79216454, 'SUROCCIDENTE', 'ZONAL VALLE DEL CAUCA'),
(27241391, 'NOROCCIDENTE', 'SUBREGIÓN URABA'),
(79801195, 'NORTE', 'ZONAL BOLIVAR'),
(45284324, 'BOGOTA', 'ZONAL BOGOTA'),
(115344094, 'NOROCCIDENTE', 'ZONAL ANTIOQUIA'),
(95260958, 'NORTE', 'ZONAL ATLANTICO'),
(41270284, 'BOGOTA', 'ZONAL BOGOTA'),
(47270631, 'NORTE', 'ZONAL BOLIVAR'),
(94394155, 'NORTE', 'ZONAL ATLANTICO');

-- Crear tabla intermedia para la relación muchos a muchos entre DatosAfiliado y Areas
CREATE TABLE AfiliadoAreas (
    IdAfiliado INT,
    ObjetoAccion VARCHAR(255),
    FechaAsignacion DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (IdAfiliado, ObjetoAccion),
    FOREIGN KEY (IdAfiliado) REFERENCES DatosAfiliado(IdAfiliado),
    FOREIGN KEY (ObjetoAccion) REFERENCES Areas(ObjetoAccion)
);

-- Insertar datos de ejemplo en la tabla intermedia
INSERT INTO AfiliadoAreas (IdAfiliado, ObjetoAccion)
VALUES
(92094547, 'Afiliaciones'),
(92094547, 'Recaudo'),
(96429414, 'Aseguramiento'),
(96429414, 'Prestaciones económicas'),
(25515227, 'Prestaciones económicas'),
(25515227, 'Cartera'),
(94574123, 'Cartera'),
(94574123, 'Afiliaciones'),
(89211382, 'Recaudo'),
(89211382, 'Aseguramiento');

SELECT A.Nombres, AA.ObjetoAccion
FROM DatosAfiliado A
JOIN AfiliadoAreas AA ON A.IdAfiliado = AA.IdAfiliado
WHERE A.IdAfiliado = 92094547;

SELECT A.Nombres, AA.ObjetoAccion
FROM DatosAfiliado A
JOIN AfiliadoAreas AA ON A.IdAfiliado = AA.IdAfiliado
WHERE AA.ObjetoAccion = 'Afiliaciones';

-- Crear una tabla para almacenar los resultados de UNION
CREATE TABLE AfiliadosUnion (
    IdAfiliado INT,
    Descripcion VARCHAR(255)
);

-- Insertar datos combinados de Instancias y Regionales
INSERT INTO AfiliadosUnion (IdAfiliado, Descripcion)
SELECT IdAfiliado, TipoOInstancia AS Descripcion
FROM Instancias
UNION
SELECT IdAfiliado, Regional AS Descripcion
FROM Regionales;

-- Crear una tabla para almacenar los resultados de INTERSECT
CREATE TABLE AfiliadosIntersect (
    IdAfiliado INT
);

-- Insertar datos comunes entre Instancias y Regionales
INSERT INTO AfiliadosIntersect (IdAfiliado)
SELECT IdAfiliado
FROM Instancias
INTERSECT
SELECT IdAfiliado
FROM Regionales;


DELIMITER //

CREATE PROCEDURE ConsultarAfiliadoInfo(
    IN p_IdAfiliado INT
)
BEGIN
    -- Consultar áreas asociadas al afiliado
    SELECT A.IdAfiliado, AF.ObjetoAccion AS Area, C.CausalReapertura AS Causal, C.FechaReapertura
    FROM DatosAfiliado A
    LEFT JOIN AfiliadoAreas AF ON A.IdAfiliado = AF.IdAfiliado
    LEFT JOIN CausalesReapertura C ON A.IdAfiliado = C.IdAfiliado
    WHERE A.IdAfiliado = p_IdAfiliado;

    -- Mostrar mensaje si no se encuentra información
    IF ROW_COUNT() = 0 THEN
        SELECT CONCAT('No se encontró información para el IdAfiliado: ', p_IdAfiliado) AS Mensaje;
    END IF;
END //

DELIMITER ;
