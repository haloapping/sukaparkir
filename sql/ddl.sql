-- ENUM
CREATE TYPE type AS ENUM('MOTORCYLE','CAR','OTHER');
CREATE TYPE IS_AVAILABLE AS ENUM('NOT AVAILABLE', 'AVAILABLE');

-- TABLE
CREATE TABLE users(
	id UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	phone VARCHAR NOT NULL UNIQUE,
	created_at TIMESTAMP NOT NULL UNIQUE
);

CREATE TABLE vehicles(
	id UUID NOT NULL PRIMARY KEY,
	user_id UUID NOT NULL,
	type type  NOT NULL,
	police_number VARCHAR(8) NOT NULL,
	valid_period DATE NOT NULL,
	brand_name VARCHAR NOT NULL,
	color VARCHAR NOT NULL,
	engine_capacity INT NOT NULL,
	created_at TIMESTAMP NOT NULL UNIQUE,
	updated_at TIMESTAMP NOT NULL UNIQUE,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE parking_lot_prices(
	id UUID NOT NULL PRIMARY KEY,
	type type NOT NULL,
	price INT NOT NULL,
	created_at TIMESTAMP NOT NULL UNIQUE,
	updated_at TIMESTAMP NOT NULL UNIQUE
);

CREATE TABLE parking_lots(
	id UUID NOT NULL PRIMARY KEY,
	parking_lot_price_id UUID NOT NULL,
	name VARCHAR NOT NULL,
	is_available IS_AVAILABLE NOT NULL,
	created_at TIMESTAMP NOT NULL UNIQUE,
	updated_at TIMESTAMP NOT NULL UNIQUE,
	FOREIGN KEY (parking_lot_price_id) REFERENCES parking_lot_prices(id)
);

CREATE TABLE parking_booking(
	id UUID NOT NULL PRIMARY KEY,
	vehicle_id UUID NOT NULL,
	parking_lot_id UUID NOT NULL,
	start_time_booking TIMESTAMP NOT NULL DEFAULT NOW(),
	end_time_booking TIMESTAMP NOT NULL DEFAULT NOW(),
	parking_duration INT DEFAULT 0,
	total INT DEFAULT 0,
	cash INT DEFAULT 0,
	change_due INT DEFAULT 0,
	is_paid BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP NOT NULL UNIQUE,
	updated_at TIMESTAMP NOT NULL UNIQUE,
	FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
	FOREIGN KEY (parking_lot_id) REFERENCES parking_lots(id)
);














