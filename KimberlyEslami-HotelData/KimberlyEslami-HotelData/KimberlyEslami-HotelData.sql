select * from room_has_reservations;
select * from guest;
select * from reservations;

SET SQL_SAFE_UPDATES = 0;
delete from room_has_reservations where Reservations_Guest_guestId = 8;
delete from reservations where Guest_guestId = 8;
delete from guest where guestId = 8;
SET SQL_SAFE_UPDATES = 1;