    
    CREATE TABLE PaymentConcept (
    IdPayment INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL,
    Status CHAR(1) CHECK (Status IN ('A', 'I')) NOT NULL
    );

    CREATE TABLE Supplier (
    IdSupplier INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    PersonType CHAR(1) CHECK (PersonType IN ('F', 'J')) NOT NULL,
    Identification VARCHAR(11) NOT NULL,
    Balance INT NOT NULL,
    Status CHAR(1) CHECK (Status IN ('A', 'I')) NOT NULL
    );

    CREATE TABLE Documents (
    NoDocument INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    NoInvoice VARCHAR(10) NOT NULL,
    DocumentDate DATETIME NOT NULL,
    Amount DECIMAL (13,2) NOT NULL,
    RegistrationDate DATETIME NOT NULL,
    IdSupplier INT NOT NULL,
    Status CHAR(1) CHECK (Status IN ('Pendiente', 'Pagado')) NOT NULL,
    CONSTRAINT fk_DocSupplier FOREIGN KEY (IdSupplier) REFERENCES Supplier (IdSupplier)
    );

    CREATE TABLE AccountingEntries (
    IdAccounting INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    Description VARCHAR(100) NOT NULL,
    IdInventoryType VARCHAR(10) NOT NULL,
    AccountingAccount INT NOT NULL,
    MovementType CHAR(1) CHECK (MovementType IN ('DB', 'CR')) NOT NULL,
    AccountingDate DATETIME NOT NULL,
    AccountingAmount DECIMAL (13,2) NOT NULL,
    Status CHAR(1) CHECK (Status IN ('A', 'I')) NOT NULL
    );