
CREATE TABLE memberTest
(	
	id		varchar2(20) primary key,
	password	varchar2(20) not null,
	name		varchar2(10) not null,
	tel		varchar2(20),
	addr		varchar2(400)
);