-- Database and Table Creation Script for AgendaWeb
CREATE DATABASE AgendaWeb;

GO USE AgendaWeb;

GO
CREATE TABLE USUARIO (
    ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID (),
    NOME NVARCHAR (150) NOT NULL,
    EMAIL NVARCHAR (150) NOT NULL UNIQUE,
    SENHA NVARCHAR (255) NOT NULL, -- Increased length for potential hashing
    DATAINCLUSAO DATETIME NOT NULL DEFAULT GETDATE (),
    DATAALTERACAO DATETIME NULL
);

GO
CREATE TABLE EVENTO (
    ID UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID (),
    NOME NVARCHAR (150) NOT NULL,
    DATA DATE NOT NULL,
    HORA TIME NOT NULL,
    DESCRICAO NVARCHAR (500) NOT NULL,
    PRIORIDADE INTEGER NOT NULL,
    DATAINCLUSAO DATETIME NOT NULL DEFAULT GETDATE (),
    DATAALTERACAO DATETIME NULL,
    ATIVO BIT NOT NULL DEFAULT 1,
    IDUSUARIO UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT FK_Evento_Usuario FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO (ID)
);

GO CREATE INDEX IX_Evento_Usuario_Data ON EVENTO (IDUSUARIO, DATA);
