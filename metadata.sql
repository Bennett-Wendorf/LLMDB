CREATE TABLE [Album]
(
    [AlbumId] INTEGER  NOT NULL, -- Unique ID for each album
    [Title] NVARCHAR(160)  NOT NULL, -- Title for the album
    [ArtistId] INTEGER  NOT NULL, -- ID of album writer/composer
);

CREATE TABLE [Artist]
(
    [ArtistId] INTEGER  NOT NULL, -- Unique ID for each artist
    [Name] NVARCHAR(120), -- Name of the artist
);

CREATE TABLE [Customer]
(
    [CustomerId] INTEGER  NOT NULL, -- Unique ID of each customer
    [FirstName] NVARCHAR(40)  NOT NULL, -- First name of the customer
    [LastName] NVARCHAR(20)  NOT NULL, -- Last name of the customer
    [Company] NVARCHAR(80), -- Company the customer works for
    [Address] NVARCHAR(70), -- Address of the customer
    [City] NVARCHAR(40), -- City of the customer (as related to address)
    [State] NVARCHAR(40), -- State of the customer
    [Country] NVARCHAR(40), -- Country of the customer
    [PostalCode] NVARCHAR(10), -- Postal code of the customer
    [Phone] NVARCHAR(24), -- Phone number of the customer
    [Fax] NVARCHAR(24), -- Fax number of the customer
    [Email] NVARCHAR(60)  NOT NULL, -- Email address of the customer
    [SupportRepId] INTEGER, -- Customer/company's primary support rep
);

CREATE TABLE [Employee]
(
    [EmployeeId] INTEGER  NOT NULL, -- Unique ID of each employee
    [LastName] NVARCHAR(20)  NOT NULL, -- Last name of each employee
    [FirstName] NVARCHAR(20)  NOT NULL, -- First name of each employee
    [Title] NVARCHAR(30), -- Job title of each employee
    [ReportsTo] INTEGER, -- Employee ID of the employee's manager/boss
    [BirthDate] DATETIME, -- Birth date of the employee
    [HireDate] DATETIME, -- The date the employee was hired
    [Address] NVARCHAR(70), -- Address of the employee
    [City] NVARCHAR(40), -- City of the employee
    [State] NVARCHAR(40), -- State of the employee
    [Country] NVARCHAR(40), -- Country of the employee
    [PostalCode] NVARCHAR(10), -- Postal code of the employee
    [Phone] NVARCHAR(24), -- Phone number of the employee
    [Fax] NVARCHAR(24), -- Fax number of the employee
    [Email] NVARCHAR(60), -- Email address of the employee
);

CREATE TABLE [Genre]
(
    [GenreId] INTEGER  NOT NULL, -- Unique ID of the genre
    [Name] NVARCHAR(120), -- Name of the genre
);

CREATE TABLE [Invoice]
(
    [InvoiceId] INTEGER  NOT NULL, -- Unique ID of the invoice
    [CustomerId] INTEGER  NOT NULL, -- The ID of the customer that the invoice was billed to
    [InvoiceDate] DATETIME  NOT NULL, -- The date the invoice was sent to the customer
    [BillingAddress] NVARCHAR(70), -- The listed billing address
    [BillingCity] NVARCHAR(40), -- The listed billing city
    [BillingState] NVARCHAR(40), -- The listed billing state
    [BillingCountry] NVARCHAR(40), -- The listed billing country
    [BillingPostalCode] NVARCHAR(10), -- The listed postal code
    [Total] NUMERIC(10,2)  NOT NULL, -- The total cost of the invoice
);

CREATE TABLE [InvoiceLine]
(
    [InvoiceLineId] INTEGER  NOT NULL, -- Unique ID of the invoice line
    [InvoiceId] INTEGER  NOT NULL, -- The ID of the invoice this line is a part of
    [TrackId] INTEGER  NOT NULL, -- The ID of the track this invoice line references
    [UnitPrice] NUMERIC(10,2)  NOT NULL, -- The price per item of the listed track
    [Quantity] INTEGER  NOT NULL, -- The number of tracks purchased (of this particular track)
);

CREATE TABLE [MediaType]
(
    [MediaTypeId] INTEGER  NOT NULL, -- Unique ID of the media type
    [Name] NVARCHAR(120), -- Name of the media type
);

CREATE TABLE [Playlist]
(
    [PlaylistId] INTEGER  NOT NULL, -- Unique ID of the playlist
    [Name] NVARCHAR(120), -- Name of the playlist
);

CREATE TABLE [PlaylistTrack] -- This is a join table between playlist and track
(
    [PlaylistId] INTEGER  NOT NULL, -- ID of the playlist this entry relates to
    [TrackId] INTEGER  NOT NULL, -- ID of the track this entry relates to
);

CREATE TABLE [Track]
(
    [TrackId] INTEGER  NOT NULL, -- Unique ID of the track
    [Name] NVARCHAR(200)  NOT NULL, -- Name of the track
    [AlbumId] INTEGER, -- ID of the album this track is on
    [MediaTypeId] INTEGER  NOT NULL, -- ID of the media type this track is
    [GenreId] INTEGER, -- ID of the genre this track is
    [Composer] NVARCHAR(220), -- Name of the composer
    [Milliseconds] INTEGER  NOT NULL, -- Length of the track in milliseconds
    [Bytes] INTEGER, -- The total amount of storage this track takes up, in bytes
    [UnitPrice] NUMERIC(10,2)  NOT NULL, -- The unit price of this track
);

-- Album.ArtistId can be joined with Artist.ArtistId
-- Customer.SupportRepId can be joined with Employee.EmployeeId
-- Employee.ReportsTo can be joined with Employee.EmployeeId
-- Invoice.CustomerId can be joined with Customer.CustomerId
-- InvoiceLine.InvoiceId can be joined with Invoice.InvoiceId
-- InvoiceLine.TrackId can be joined with Track.TrackId
-- PlaylistTrack.PlaylistId can be joined with Playlist.PlaylistId
-- PlaylistTrack.TrackId can be joined with Track.TrackId
-- Track.AlbumId can be joined with Album.AlbumId
-- Track.MediaTypeId can be joined with MediaType.MediaTypeId
-- Track.GenreId can be joined with Genre.GenreId
