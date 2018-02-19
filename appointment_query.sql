/*Selects all columns from appointment table and owner information from car_owner table. It uses a JOIN to return matching data from the
appointment table, car table, car_owner table, and service table. The query can be used to lookup an OwnerName and return Appointment Date
and Service
 */

SELECT DISTINCT appointment.AppointmentID, car_owner.OwnerFirstName, car_owner.OwnerLastName, AppointmentDate, ServiceName
FROM hopperauto.appointment
JOIN(hopperauto.car, hopperauto.car_owner, hopperauto.service)
ON car.CarID = appointment.CarID
AND appointment.OwnerID = car_owner.OwnerID
ORDER BY  appointment.AppointmentID
