/* This query inserts details for a new service and then selects and display
the full service list with the newly entered service details*/
INSERT INTO service (ServiceID, AppointmentID, ServiceName, ServiceCost)
VALUES (22, 7,  "Oil Change", 1);

SELECT *
FROM service;