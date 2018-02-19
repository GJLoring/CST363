/*Selects columns from car table and appointment table. It uses a JOIN to return matching data from the
appointment table, car table, and car_owner table. The query can be used to lookup a car by CarID and return car information
 */

SELECT car.CarID, ManufacturerName, ModelName,  LicensePlate, Year, Color, Mileage, OwnerLastName, OwnerFirstName,
OwnerPhone , OwnerEmail
FROM hopperauto.car
JOIN (hopperauto.appointment, hopperauto.car_owner)
ON car.CarID = appointment.CarID
AND appointment.OwnerID = car_owner.OwnerID