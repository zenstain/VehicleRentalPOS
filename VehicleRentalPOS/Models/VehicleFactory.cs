using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VehicleRentalPOS.Models
{
    public class VehicleFactory
    {
        //Simple implementation
        public static IVehicle GetVehicle(string VehicleType)
        {
            IVehicle returnVehicle = null;

            if(VehicleType == "Car")
            {
                Car car = null;

                //Simple example: return the first car found.  Obviously there'd be a lot more selection criteria in a more real-world example.
                using (VehicleRentalsEntities entities = new VehicleRentalsEntities())
                {
                    Vehicle v = ( from vehicle in entities.Vehicles
                                  join vehicleModel in entities.VehicleModels on vehicle.VehicleModelId equals vehicleModel.Id
                                  join vehicleType in entities.VehicleTypes on vehicleModel.VehicleTypeId equals vehicleType.Id
                                  where vehicleType.Type == VehicleType
                                  select vehicle).First();

                    if(v != null)
                    {
                        car = new Car
                        {
                            Color = v.Color,
                            Convertible = false, //hard-code for now, need to update VehicleModel table
                            CurrentSpeed = 0.0,
                            Make = v.VehicleModel.VehicleMake.Make,
                            Model = v.VehicleModel.Model,
                            NumberOfDoors = 4, //same, update VehicleModel table
                            NumberOfSeats = 5, //same, update VehicleModel table
                            Type = v.VehicleModel.VehicleType.Type,
                            VehicleWeight = 4000, //update vehiclemodel
                            VIN = v.VIN,
                            Year = v.Year
                        };
                    }

                    returnVehicle = car;
                }
            }
            else if(VehicleType == "Boat")
            {
                returnVehicle = new Boat();
            }
            else if(VehicleType == "UFO")
            {
                returnVehicle = new UFO();
            }

            return returnVehicle;
        }
    }
}
