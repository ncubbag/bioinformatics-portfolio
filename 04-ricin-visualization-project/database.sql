# Database creation and insertion took place in Structured Query Language (SQL) (with SQLite in SQLite Studio) and was transferred into Python. The last SQL version of the database can be seen below:
DROP TABLE Entity CASCADE CONSTRAINTS; 
DROP TABLE Relationship_Actions CASCADE CONSTRAINTS; 
DROP TABLE 1:1_Relationships CASCADE CONSTRAINTS; 
DROP TABLE 1:2_Relationships CASCADE CONSTRAINTS; 
DROP TABLE 1:3_Relationships CASCADE CONSTRAINTS; 
DROP TABLE 1:Unknown_Many_Relationships CASCADE CONSTRAINTS; 
  
CREATE TABLE Entity ( 
Entity_ID VARCHAR (25)  
Physical_Origin VARCHAR (25), 
Size VARCHAR (20), 
Color VARCHAR (15), 
Purpose VARCHAR (75), 
Start_Time VARCHAR (75), 
End_Time VARCHAR (75), 
Comes_From VARCHAR (75)  
); 
    
CREATE TABLE Relationship_Actions ( 
    Relationship_Group_ID                      VARCHAR (75) PRIMARY KEY 
                                                            NOT NULL, 
); 
    
CREATE TABLE Sub_Relationship_Actions ( 
    Sub_Relationship_ID   VARCHAR (50) PRIMARY KEY 
                                       NOT NULL, 
    Relationship_Group_ID VARCHAR (75) REFERENCES Relationship_Actions (Relationship_Group_ID)  
); 
  
CREATE TABLE [1:1_Relationships] ( 
    Entity_ID_1             VARCHAR (25)  PRIMARY KEY 
                                          REFERENCES Entity (Entity_ID)  
                                          NOT NULL, 
    Start_Time_Of_Existence VARCHAR (100), 
    End_Time_Of_Existence   VARCHAR (100), 
    Location                VARCHAR (25), 
Relationship VARCHAR(25) Foreign Key References Relationship_Actions(Relationship_Group_ID), 
Sub_Relationship VARCHAR(25) Foreign Key References 
Sub_Relationships_Actions(Sub_Relationship_ID), 
    Entity_ID_2             VARCHAR (25)  REFERENCES Entity (Entity_ID)  
); 
  
CREATE TABLE [1:2_Relationships] ( 
    Entity_ID_1             VARCHAR (25)  PRIMARY KEY 
                                          REFERENCES Entity (Entity_ID)  
                                          NOT NULL, 
    Start_Time_Of_Existence VARCHAR (100), 
    End_Time_Of_Existence   VARCHAR (100), 
    Location                VARCHAR (25), 
    Entity_ID_2             VARCHAR (25)  REFERENCES Entity (Entity_ID)  
                                          NOT NULL, 
    Entity_ID_3             VARCHAR (25)  NOT NULL 
                                          REFERENCES Entity (Entity_ID)  
); 
  
CREATE TABLE [1:3_Relationships] ( 
    Entity_ID_1             VARCHAR (25)  PRIMARY KEY 
                                          REFERENCES Entity (Entity_ID)  
                                          NOT NULL, 
    Start_Time_Of_Existence VARCHAR (100), 
    End_Time_Of_Existence   VARCHAR (100), 
    Location                VARCHAR (25), 
    Entity_ID_2             VARCHAR (25)  NOT NULL 
                                          REFERENCES Entity (Entity_ID), 
    Entity_ID_3             VARCHAR (25)  REFERENCES Entity (Entity_ID)  
                                          NOT NULL, 
    Entity_ID_4             VARCHAR (25)  REFERENCES Entity (Entity_ID)  
                                          NOT NULL 
); 
  
CREATE TABLE [1:Unknown_Many_Relationships] ( 
    Entity_ID                          VARCHAR (25)  PRIMARY KEY 
                                                     REFERENCES Entity (Entity_ID)  
                                                     NOT NULL, 
    Start_Time_Of_Existence            VARCHAR (100), 
    End_Time_Of_Existence              VARCHAR (100), 
    Location                           VARCHAR (25), 
    Entity_ID_Other                    VARCHAR (25)  REFERENCES Entity (Entity_ID), 
    Entities_Speculated_To_Be_Involved VARCHAR (50)  
); 

-- Insert Statements for Relationship_Actions  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Bind');  

INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Digest');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)   
VALUES('Activate');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Inactivate');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Degrade');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Cleave');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Modify');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Traffic');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('fold');  
  
INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('Phagocytize');  

INSERT INTO Relationship_Actions(Relationship_Group_ID)  
VALUES('unknown');  
  
-- Insert Statements for Sub_Relationship_Actions  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Bind','Bind');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID) 
VALUES('Bond','Bind'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Recruit','Bind');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Scaffold','Bind'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)   
VALUES('Degrade','Digest');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)   
VALUES('Digest','Digest');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)    
VALUES('Phagocytize','Digest');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Upregulate','Activate'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
  VALUES('Activate','Activate'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Downregulate','Inactivate');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Repress','Inactivate');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Inactivate','Inactivate');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Block','Inactivate'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Degrade','Degrade’); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Digest','Degrade'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Phagocytize','Degrade'); 
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Cleave','Cleave');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Dissociate','Cleave');  

INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Splice','Modify');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Modify','Modify');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Transcribe','Modify');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Replicate','Modify');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Traffic','Traffic');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Transport','Traffic')  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Endocytose','Traffic');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Exocytose','Traffic');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID) 
VALUES('Channeling','Traffic');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Fold','Fold');  
  
INSERT INTO Sub_Relationship_Actions(Sub_Relationship_ID, Relationship_Group_ID)  
VALUES('Unfold','Fold');  
  
-- Insert Statements for Entity  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Ricin', 'Castor beans', '64.00 kDa', 'Grey', 'Prevents cells from making other important proteins', '00:01:00', 'Outside the body');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time)  
VALUES('Cytoplasm', 'Cell', '100.00 nm', 'White', 'Contains all cellular organelles', '00:00:00');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)   
VALUES('Glycoprotein', 'Golgi apparatus', '29,000.00 Molecular Weight', 'Red', 'Recognizes and binds to receptors', '00:01:50', 'Golgi apparatus');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Ricin Vesicle', 'Ricin', '340.00 nm', 'Yellow', 'Delivers ricin', '00:03:00', 'Outside the body');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Early endosome', 'Cytoplasm', '80.00 nm', 'Green', 'Binds with ricin and traffics to lysosome and Golgi apparatus', '00:04:50', 'Cytoplasm');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Lysosome', 'Cytosol', '00.80 nm', 'Purple', 'Aids in degradation of ricin', '00:20:00', 'Cytoplasm');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Golgi apparatus', 'Cytoplasm', '30.00 nm', 'Blue', 'Traffics and alters proteins', '00:04:00', 'Cytoplasm');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('ER-Golgi Intermediate Complex (ERGIC)', 'Cytoplasm', '50.00 nm', 'Pink', 'Modify and transport proteins', '01:00:00', 'Cytoplasm');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Endoplasmic Reticulum (ER)', 'Cytoplasm', '50.00 nm', 'Turquoise', 'Modify and transport proteins', '00:45:00', 'Cytoplasm');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Rab6', 'Golgi apparatus', '85,500 bases', 'Brown', 'Aids in trafficking of trans-golgi proteins', '00:05:00', 'Golgi apparatus');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Coat Protein Complex 1 (COP1)', 'Golgi-ER Complex', '50.00 nm', 'White', 'Surrounds vesicles returning ER-proteins to ER', '01:01:00', 'Golgi apparatus');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Arf1', 'Golgi apparatus', '26,097 Da', 'Silver', 'Modulates vesicle budding and uncoating', '01:20:00', 'Golgi apparatus');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('KKXX motif', 'ER', '50.00 nm', 'Black', 'Provides ricin with amino acid sequence', '00:55:00', 'ER');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Ref1', 'ERGIC', '36.5 kDa', 'Orange', 'Aids vesicle to transport the COPI vesicle to the ERGIC', '01:35:00', 'ER');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Thioredocxin reductase (TrxR)', 'ER', '58 kDa', 'Violet', 'Modifies ricin protein bonds', '01:45:00', 'ER');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Protein disulfide isomerase (PID)', 'ER', '107 kDa', 'Light yellow', 'Modifies ricin protein bonds', '01:45:50', 'ER');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Ricin Chain A (RTA)', 'ER', '30 kDa', 'Light red', 'Refolds, binds and de-purinates the ribosome', '01:42:00', 'ER');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, End_Time, Comes_From)  
VALUES('Ricin Chain B (RTB)', 'ER', '30 kDa', 'Light green', 'Serves as targeting mechanism of ricin protein', '01:42:50', '01:44:00', 'ER');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Heat Shock Protein (Hsp70)', 'Cytosol', '70,898 kDa', 'Maroon', 'Aids with refolding of RTA', '02:05:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('26S protease regulatory subunit S10B (RTP4)', 'Cytosol', '2.5 MDa', 'Light orange', 'Aids in transport of RTA', '02:00:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, End_Time, Comes_From)  
VALUES('26S protease regulatory subunit 6A (RTP5)', 'Cytosol', '2.5 MDa', 'Light pink', 'Aids in transport of RTA', '02:00:50', '2:02:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Co-chaperone HOP', 'Cytosol', '100 kDa', 'Teal', 'Aids Hsp70 in transfer and degradation of RTA', '02:10:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Co-chaperone HIP', 'Cytosol', '100 kDa', 'Light brown', 'Aids Hsp70 in transfer and degradation of RTA', '02:10:50', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('CHIP E3 Ligase', 'Cytosol', '50 kDa', 'Light purple', 'Ubiquitinates Hsp70 and its products', '02:11:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('Co-chaperone BAG-1', 'Cytosol', '100 kDa', 'Light blue', 'Aids Hsp70 in release of RTA', '02:13:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('P1 Subunit', 'Cytosol', '11,514 Da', 'Auburn', 'Aids transfer of ricin to the Sarcin-Ricin Loop (SRL) on the 28S rRNA strand', '02:18:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, Comes_From)  
VALUES('P2 Subunit', 'Cytosol', '8,804 Da', 'Indigo', 'Aids transfer of ricin to the Sarcin-Ricin Loop (SRL) on the 28S rRNA strand', '02:18:50', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Color, Purpose, Start_Time, Comes_From)  
VALUES('Sarcin-Ricin Loop (SRL)', 'Cytosol', 'Beige', 'Prevents further protein synthesis after depurination of adenine A4234', '02:21:00', 'Cytosol');  
  
INSERT INTO Entity(Entity_ID, Physical_Origin, Size, Color, Purpose, Start_Time, End_Time, Comes_From)  
VALUES('Adenine A4324', 'Cytosol', '20 kDa', 'Fuchsia', 'Aids SRL by inhibiting ribosome', ((time)'02:4:00'), '02:10:00', 'Cytosol'); 
  
# Insert Statements for 1:1_Relationships 

INSERT INTO 1:1_Relationships (Entity_ID_1, Start_Time_Of_Existence, End_Time_Of_Existence, Location, Relationship, Sub_Relationship, Entity_2_ID) 
VALUES
(Ricin 1, -0:20, -0:10, Null, Bind, Bind, Glycoprotein), 
(Glycoprotein, -0:10, 0:00, Null Bind, Bind, Plasma Membrane), 
(Ricin Vesicle 1, 0:05, 0:15, Null, Traffic, Transport, Ricin Vesicle 3), 
(Ricin Vesicle 2, 0:05, 0:15, Null, Traffic, Exocytose, Plasma Membrane), 
(Ricin Vesicle 3, 0:15, 0:20, Null, Bind, Bind, Endosome)
