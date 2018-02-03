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

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

USE hopperauto;

/*****   CAR_OWNER DATA   *****************************************************/

SET AUTOCOMMIT=0;
INSERT INTO CAR_OWNER VALUES( null,'Last', 'First', '555-123-4567', 'Last.First@CSUMB.EDU');
INSERT INTO CAR_OWNER VALUES( null,'Last', 'Grace', '555-123-4567', 'Last.Grace@CSUMB.EDU');
INSERT INTO CAR_OWNER VALUES( null,'Last', 'Jose', '555-123-4567', 'Last.Jose@CSUMB.EDU');
INSERT INTO CAR_OWNER VALUES( null,'Last', 'Gabe', '555-123-4567', 'Last.Gabe@CSUMB.EDU');
COMMIT;

/*****   CAR DATA   ***********************************************************/
SET AUTOCOMMIT=0;
INSERT INTO CAR VALUES(	null, "BMW",    "i7",     "B122018", 2018);
INSERT INTO CAR VALUES(	null, "Chevy",  "Camero", "C122008", 2008);
INSERT INTO CAR VALUES(	null, "Ford",   "F150",   "F121998", 1998);
INSERT INTO CAR VALUES(	null, "GMC",    "Yukon",  "GA11988", 1988);
INSERT INTO CAR VALUES(	null, "Mazda",  "Miata",  "M121978", 1978);
INSERT INTO CAR VALUES(	null, "Toyota", "Tacoma", "T121968", 1968);
COMMIT;

/*****  APPOINTMENT DATA   *************************************************************/
SET AUTOCOMMIT=0;
INSERT INTO APPOINTMENT VALUES(	null, 1, 1, "2018-02-01");
INSERT INTO APPOINTMENT VALUES(	null, 2, 2, "2018-02-02");
INSERT INTO APPOINTMENT VALUES(	null, 2, 3, "2018-02-03");
INSERT INTO APPOINTMENT VALUES(	null, 3, 4, "2018-02-04");
INSERT INTO APPOINTMENT VALUES(	null, 3, 5, "2018-02-05");    
INSERT INTO APPOINTMENT VALUES(	null, 4, 6, "2018-02-06"); 
COMMIT;

/*****  SERVICE DATA   *************************************************************/
SET AUTOCOMMIT=0;
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
COMMIT;
/****************************************************************************************/


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
