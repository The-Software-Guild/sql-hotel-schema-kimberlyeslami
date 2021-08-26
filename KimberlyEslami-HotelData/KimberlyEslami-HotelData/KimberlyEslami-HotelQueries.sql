use kimberlyeslamihoteldb;

SELECT * FROM guest;
select * from reservations;
select * from room;
SELECT * FROM room_has_reservations;

drop table room_has_reservations;

-- Query 1: Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates. --
select distinct g.firstName, g.surname, rhr.Room_roomId, rhr.endDate, rhr.startDate
from room_has_reservations rhr
inner join reservations r on r.Guest_guestId = rhr.Reservations_Guest_guestId
inner join guest g on g.guestId = r.Guest_guestId
where startDate >= "2023-07-01" AND endDate <= "2023-07-31";
-- Answer: 
-- Walter Holaway  204	2023-07-14	2023-07-13 
-- Bettyann Seery  303	2023-07-29	2023-07-28
-- Wilfred  Vise   401	2023-07-21	2023-07-18 --

-- Query 2: Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation. --
select distinct  rhr.Reservations_reservationId, Room_roomId, g.firstName, g.surname, r.amenities, rhr.startdate, rhr.endDate
from room_has_reservations rhr
inner join room r on r.roomId = rhr.Room_roomId
inner join guest g on g.guestId = rhr.Reservations_Guest_guestId
where r.amenities like '%jacuzzi';
-- Answer: 
-- 4	201	Karie 	Yang	Microwave, Jacuzzi	2023-03-06	2023-03-07
-- 2	203	Bettyann Seery	Microwave, Jacuzzi	2023-02-05	2023-02-10 
-- 21	203	Karie 	Yang	Microwave, Jacuzzi	2023-09-13	2023-09-15
-- 9	301	Walter	Holaway	Microwave, Jacuzzi	2023-04-09	2023-04-13
-- 24	301	Mack 	Simmer	Microwave, Jacuzzi	2023-11-22	2023-11-25
-- 18	303	Bettyann Seery	Microwave, Jacuzzi	2023-07-28	2023-07-29 --