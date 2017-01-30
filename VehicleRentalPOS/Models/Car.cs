using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VehicleRentalPOS.Models
{
    public class Car : IVehicle
    {
        public Car()
        {

        }

        public Car(int year, string make, string model, string type, string vin, double weight, string color, int numberOfDoors, int numberOfSeats, bool convertible)
        {
            Year = year;
            Make = make;
            Model = model;
            Type = type;
            VIN = vin;
            VehicleWeight = weight;
            Color = color;
            NumberOfDoors = numberOfDoors;
            NumberOfSeats = NumberOfSeats;
            Convertible = convertible;
        }

        public int Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Type { get; set; }
        public string VIN { get; set; }
        public double VehicleWeight { get; set; }
        public string Color { get; set; }
        public double CurrentSpeed { get; set; } //Measured in mph

        //Car-specific stuff
        public int NumberOfDoors { get; set; }
        public int NumberOfSeats { get; set; }
        public bool Convertible { get; set; }


        //Greatly simplified.  To show some actual differences between vehicle types, one could code the actual process of throttling acceleration
        //by indicating throttle amount (fuel flow); current friction resistance (air, road, none, etc.);  current RPM (or whatever the vehicle 
        //type's drive involves for an engine); etc.
        public double Accelerate(double AccelerationRate, double Seconds)
        {
            CurrentSpeed = CurrentSpeed + (AccelerationRate * Seconds);
            return CurrentSpeed;
        }

        public double Brake(double DecelerationRate, double Seconds)
        {
            CurrentSpeed = CurrentSpeed + (DecelerationRate * Seconds);
            return CurrentSpeed;
        }

        //Assume same uom
        public double Turn(double Radius)
        {
            return CurrentSpeed / Radius;
        }
    }
}
