package main

import (
	"fmt"
	"time"

	"github.com/google/uuid"
)

type User struct {
	Id        uuid.UUID `json:"id"`
	FirstName string    `json:"firstName"`
	LastName  string    `json:"lastName"`
	Phone     string    `json:"phone"`
	CreatedAt time.Time `json:"createdAt"`
}

type Vehicle struct {
	Id             uuid.UUID `json:"id"`
	UserId         uuid.UUID `json:"userId"`
	Type           string    `json:"type"`
	PoliceNumber   string    `json:"policeNumber"`
	ValidPeriod    time.Time `json:"validPeriod"`
	BrandName      string    `json:"brandName"`
	Color          string    `json:"color"`
	EngineCapacity int       `json:"engineCapacity"`
	CreatedAt      time.Time `json:"createdAt"`
	UpdatedAt      time.Time `json:"updatedAt"`
}

type ParkingLotPrice struct {
	Id        uuid.UUID `json:"id"`
	Type      string    `json:"type"`
	Price     int       `json:"price"`
	CreatedAt time.Time `json:"createdAt"`
	UpdatedAt time.Time `json:"updatedAt"`
}

type ParkingLot struct {
	Id                uuid.UUID `json:"id"`
	ParkingLotPriceId uuid.UUID `json:"parkingLotPriceId"`
	Name              string    `json:"name"`
	IsAvailable       string    `json:"isAvailable"`
	CreatedAt         time.Time `json:"createdAt"`
	UpdatedAt         time.Time `json:"updatedAt"`
}

type ParkingBooking struct {
	Id               uuid.UUID `json:"id"`
	VehicleId        uuid.UUID `json:"vehicleId"`
	ParkingLotId     uuid.UUID `json:"parkingLotId"`
	StartTimeBooking time.Time `json:"startTimeBooking"`
	EndTimeBooking   time.Time `json:"endTimeBooking"`
	ParkingDuration  int       `json:"parkingDuration"`
	Total            int       `json:"total"`
	Cash             int       `json:"cash"`
	ChangeDue        int       `json:"changeDue"`
	IsPaid           bool      `json:"isPaid"`
	CreatedAt        time.Time `json:"createdAt"`
	UpdatedAt        time.Time `json:"updatedAt"`
}

func main() {
	fmt.Println("Hi")
}
