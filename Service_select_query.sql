/*This SELECT query selects fields from the service table and uses a JOIN to select fields from the appointmnet, car, and car_owner tables
and displays all the information together. The query can be used to lookup an specific serviceID and retrieve information for the service order. 
In this case the WHERE ServiceID = 1 and this can be changed to a different ServiceID number or completely delete the WHERE ServiceID = 1 line to get
a full list of all the service orders with the corresponding information  */
SELECT ServiceID AS ID, ServiceName AS ServicePerformed, AppointmentDate AS ServiceDate,
ManufacturerName, ModelName,  LicensePlate, Year AS CarInformation,
CONCAT(OwnerLastName, '.', OwnerFirstName) AS OwnerName, OwnerPhone AS Phone, OwnerEmail AS Email
FROM hopperauto.service
JOIN (hopperauto.appointment, hopperauto.car, hopperauto.car_owner)
ON service.AppointmentID = appointment.AppointmentID
AND appointment.CarID = car.CarID
AND appointment.OwnerID = car_owner.OwnerID
WHERE ServiceID = 1;