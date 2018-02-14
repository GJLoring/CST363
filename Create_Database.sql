/******************************************************************************/
/*										                                      */
/*	Hopper:													            	  */
/*		Jose								                                  */
/*		Grace								                                  */
/*		Gabe								                                  */
/*										                                      */
/*	Auto Repair Shop-Database Create Tables									  */
/*										                                      */
/*										                                      */
/******************************************************************************/

-- ********************************************
-- CREATE THE HOPPERAUTO DATABASE
-- *******************************************

-- create the database
DROP DATABASE IF EXISTS hopperauto;
CREATE DATABASE hopperauto;

-- select the database
USE hopperauto;


CREATE TABLE CAR_OWNER(
	OwnerID					      Int				NOT NULL auto_increment,
	OwnerLastName			      Char(25)		    NOT NULL,
	OwnerFirstName				  Char(25)	  	    NOT NULL,
	OwnerPhone				      Char(12)		    NULL,
	OwnerEmail				      VarChar(100)	    NULL,
	CONSTRAINT				      OWNER_PK		    PRIMARY KEY(OwnerID)
	);

CREATE TABLE CAR(
	CarID					        Int				  NOT NULL auto_increment,
	ManufacturerName				VarChar(100)	  NOT NULL,
	ModelName				        VarChar(100)	  NOT NULL,
	LicensePlate				    VarChar(100)	  NOT NULL,	
	Year				            Numeric(5,1)	  NULL,
	CONSTRAINT				        CarID		      PRIMARY KEY(CarID)
	);
	
CREATE TABLE APPOINTMENT(
	AppointmentID				  Int			    NOT NULL auto_increment,
	OwnerID					      Int				NOT NULL,
	CarID					      Int				NOT NULL,
	AppointmentDate		          Date           	NULL,
	CONSTRAINT				      AppointmentID		PRIMARY KEY(AppointmentID)
	);


CREATE TABLE Service(
	ServiceID					    Int			    auto_increment  NOT NULL,
	AppointmentID					Int			    NOT NULL,
	ServiceName					    Char (50)		NOT NULL,
	ServiceCost					    Int             NOT NULL,
	CONSTRAINT				        ServiceID		PRIMARY KEY(ServiceID)
	);
  



/*****   CAR_OWNER DATA   *****************************************************/
INSERT INTO CAR_OWNER VALUES( null,'Last', 'First', '555-123-4567', 'Last.First@CSUMB.EDU');
INSERT INTO CAR_OWNER VALUES( null,'Last', 'Grace', '555-123-4567', 'Last.Grace@CSUMB.EDU');
INSERT INTO CAR_OWNER VALUES( null,'Last', 'Jose', '555-123-4567', 'Last.Jose@CSUMB.EDU');
INSERT INTO CAR_OWNER VALUES( null,'Last', 'Gabe', '555-123-4567', 'Last.Gabe@CSUMB.EDU');



/*****   CAR DATA   ***********************************************************/
INSERT INTO CAR VALUES(	null, "BMW",    "i7",     "B122018", 2018);
INSERT INTO CAR VALUES(	null, "Chevy",  "Camero", "C122008", 2008);
INSERT INTO CAR VALUES(	null, "Ford",   "F150",   "F121998", 1998);
INSERT INTO CAR VALUES(	null, "GMC",    "Yukon",  "GA11988", 1988);
INSERT INTO CAR VALUES(	null, "Mazda",  "Miata",  "M121978", 1978);
INSERT INTO CAR VALUES(	null, "Toyota", "Tacoma", "T121968", 1968);


/*****  APPOINTMENT DATA   *************************************************************/
INSERT INTO APPOINTMENT VALUES(	null, 1, 1, "2018-02-01");
INSERT INTO APPOINTMENT VALUES(	null, 2, 2, "2018-02-02");
INSERT INTO APPOINTMENT VALUES(	null, 2, 3, "2018-02-03");
INSERT INTO APPOINTMENT VALUES(	null, 3, 4, "2018-02-04");
INSERT INTO APPOINTMENT VALUES(	null, 3, 5, "2018-02-05");    
INSERT INTO APPOINTMENT VALUES(	null, 4, 6, "2018-02-06"); 

/*****  SERVICE DATA   *************************************************************/
INSERT INTO Service VALUES(	null, 1, "Oil Change", 1);

INSERT INTO Service VALUES(	null, 2, "Oil Change", 1);
INSERT INTO Service VALUES(	null, 2, "Battery Replace", 2);

INSERT INTO Service VALUES(	null, 3, "Oil Change", 1);
INSERT INTO Service VALUES(	null, 3, "Battery Replace", 2);
INSERT INTO Service VALUES(	null, 3, "Spark Plug Gap Checked", 3);

INSERT INTO Service VALUES(	null, 4, "Oil Change", 1);
INSERT INTO Service VALUES(	null, 4, "Battery Replace", 2);
INSERT INTO Service VALUES(	null, 4, "Spark Plug Gap Checked", 3);
INSERT INTO Service VALUES(	null, 4, "Air Filter Replace", 4);

INSERT INTO Service VALUES(	null, 5, "Oil Change", 1);
INSERT INTO Service VALUES(	null, 5, "Battery Replace", 2);
INSERT INTO Service VALUES(	null, 5, "Spark Plug Gap Checked", 3);
INSERT INTO Service VALUES(	null, 5, "Air Filter Replace", 4);
INSERT INTO Service VALUES(	null, 5, "Timing Adjustment", 5);

INSERT INTO Service VALUES(	null, 6, "Oil Change", 1);
INSERT INTO Service VALUES(	null, 6, "Battery Replace", 2);
INSERT INTO Service VALUES(	null, 6, "Spark Plug Gap Checked", 3);
INSERT INTO Service VALUES(	null, 6, "Air Filter Replace", 4);
INSERT INTO Service VALUES(	null, 6, "Timing Adjustment", 5);
INSERT INTO Service VALUES(	null, 6, "Valve Cover Seal Replace", 6);

/****************************************************************************************/