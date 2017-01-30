using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VehicleRentalPOS.Models
{
    public class UFO : IVehicle
    {
        public int Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Type { get; set; }
        public string VIN { get; set; }
        public double VehicleWeight { get; set; } //Earth weight at sea level
        public string Color { get; set; }
        public double CurrentSpeed { get; set; } //Measured in impulse or warp

        //UFO-specific stuff.  Lot more considerations depending on the size/type of ship.
        public string CurrentUOM { get; set; } //impulse or warp?
        public int NumberOfSeats { get; set; }
        public bool WarpCapable { get; set; } //Do you really want to rent a warp-capable vehicle?  Think of the liability.
        public bool Piloted { get; set; } //Unless you rent it with a trained pilot as part of the deal. Which makes this more of a charter in that case, doesn't it?
        public bool Kitchen { get; set; } //This might be a big UFO.
        public int NumberOfBathrooms { get; set; }
        public bool GameRoom { get; set; } //Includes Jedi training globe.

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

        public double Turn(double Radius)
        {
            return CurrentSpeed / Radius;
        }
    }
}
