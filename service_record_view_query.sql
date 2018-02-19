/*Selects Relevant Columns from all tables to display complete service record .
Uses a JOIN to return matching data from the appointment table, car table, car_owner table, and service tables.
 */

CREATE VIEW AppointmentDetail AS
select OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail, AppoinmentDate, ServiceName, ServiceCost, ManufacturerName,ModelName,LicencePlate,Year
from car_owner c inner join appointment a inner join service s inner join car v
where s.AppointmentID = a.AppointmentID and
a.OwnerID = c.OwnerID and
v.CarID = a.CarID;


/*
Sample usage:
Search for appointments by owner
*/

Select * from
AppointmentDetail
where OwnerFirstName = "Jose";


/*
Sample usage:
Search for appointments by License
*/
Select * from
AppointmentDetail
where LicencePlate = "T121968";