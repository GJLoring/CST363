/*
Inserts a customer into the car_owner table and then displays all the cars associated with the user
 */

INSERT INTO car_owner values(null 'LastName', 'FirstName', 'Phone', 'Email');

SELECT OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail, AppointmentDate, ServiceName, ServiceCost, ManufacturerName,ModelName,LicensePlate,Year
from car_owner c inner join appointment a inner join service s inner join car v
where s.AppointmentID = a.AppointmentID and
a.OwnerID = c.OwnerID and
v.CarID = a.CarID and OwnerLastName='LastName';