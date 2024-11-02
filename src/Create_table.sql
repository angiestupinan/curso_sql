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
