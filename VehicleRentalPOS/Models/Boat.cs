using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VehicleRentalPOS.Models
{
    public class Boat : IVehicle
    {
        public int Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Type { get; set; }
        public string VIN { get; set; }
        public double VehicleWeight { get; set; }
        public string Color { get; set; }
        public double CurrentSpeed { get; set; } //Measured in knots

        //Boat-specific stuff
        public int Length { get; set; }
        public string EngineType { get; set; } //Inboard or outbourd engines?
        public int NumberOfEngines { get; set; }
        public bool Sleeper { get; set; } //Or whatever they call boats that you can go below decks and sleep uncomfortably in

        private double _turnAngle;
        public double TurnConstant { get; set; } //Different boats have different angles they'll list at, depending on the tightness of the turn. Data point.
        public double TurnAngle
        {
            get
            {
                return _turnAngle;
            }
        }


        public double Accelerate(double AccelerationRate, double Seconds)
        {
            CurrentSpeed = CurrentSpeed + (AccelerationRate * Seconds);
            return CurrentSpeed;
        }

        //Boats really don't come with brakes, so this can be essentially a zero return
        public double Brake(double DecelerationRate, double Seconds)
        {
            return 0.0;
        }

        //Assume same uom
        public double Turn(double Radius)
        {
            double retVal = 0.0;

            if(Radius > 0.0)
            {
                retVal = CurrentSpeed / Radius;
                _turnAngle = Radius / TurnConstant; //This is nowhere near accurate, just here more as a placeholder. You'd do some form of trig for this.
            }
            else
            {
               _turnAngle = 0.0;
            }

            return retVal;
        }
    }
}
