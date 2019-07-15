# ConcesionarioVehiculosAS1

Web application developed on Java EE for the management of a car sale. Made with academical purposes.

# SQL Scripts

  CREATE DATABASE concesionariodb;
  
  use concesionariodb;
  
  CREATE TABLE Usuario(
      Id int NOT NULL AUTO_INCREMENT,
      Nombre VARCHAR(50) NOT NULL,
      Usuario VARCHAR(20) NOT NULL,
      Contrasena VARCHAR(20) NOT NULL,
      PRIMARY KEY(Id)
  );
  
  CREATE TABLE Cliente(
      Cedula VARCHAR(20) NOT NULL,
      Nombre VARCHAR(50) NOT NULL,
      Telefono VARCHAR(10) NOT NULL,
      Correo VARCHAR(50) NOT NULL,
      Direccion VARCHAR(50) NOT NULL,
      PRIMARY KEY(Cedula)
  );
  
  CREATE TABLE Vehiculo(
      Placa VARCHAR(10) NOT NULL,
      Linea VARCHAR(50) NOT NULL,
      Modelo VARCHAR(50) NOT NULL,
      Precio int NOT NULL,
      Foto BLOB,
      PRIMARY KEY(Placa)
  );
  
  CREATE TABLE Venta (
      Id int NOT NULL AUTO_INCREMENT,
      Placa VARCHAR(10) NOT NULL,
      Cedula VARCHAR(20) NOT NULL,
      FOREIGN KEY (Cedula) REFERENCES Cliente(Cedula),
      FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa),
      PRIMARY KEY(Id)
  );
  
  #Verificar las tablas creadas
  SHOW TABLES;
  
  INSERT INTO Usuario (Id, Nombre, Usuario, Contrasena) VALUES 
  (NULL, 'John Doe','John_Doe', 'passJD'),
  (NULL, 'Paco Jones','Paco_Jones', 'contraPJ');
  
  INSERT INTO Cliente (Cedula, Nombre, Telefono, Correo, Direccion) VALUES 
  ('1034947562', 'Andres Herrera','3204353564', 'Andres.Herrera@correo.com', 'CRA 2'),
  ('946385093', 'Javier Soto','3125632464', 'Javier.Soto@correo.com', 'CLL 12'),
  ('754312334', 'Rosa Morales','3084535439', 'Rosa.Morales@correo.com', 'AVE 7'),
  ('1175848932', 'Sara Castañeda','3105790933', 'Sara.Castañeda@correo.com', 'DIAG 35');
  
  INSERT INTO Vehiculo (Placa, Linea, Modelo, Precio, Foto) VALUES 
  ('ABC123', 'cv200', '2020', 45000000, NULL),
  ('GUK854', 'cv200', '2019', 37000000, NULL),
  ('FER736', 'cv200', '2020', 71000000, NULL),
  ('1254 ABG' , 'hg150', '2018', 22000000, NULL),
  ('5874 HUJ' , 'hg150', '2019', 28000000, NULL);
  
  INSERT INTO Venta (Id, Placa, Cedula) VALUES 
  (NULL, 'ABC123', '1034947562'),
  (NULL, '5874 HUJ', '1175848932'),
  (NULL, 'FER736', '1175848932'),
  (NULL, '1254 ABG', '946385093');
  
