using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VehicleRentalPOS.Models
{
    public interface IVehicle
    {
        int Year { get; set; }
        string Make { get; set; }
        string Model { get; set; }
        string Type { get; set; }
        string VIN { get; set; }
        double VehicleWeight { get; set; }
        string Color { get; set; }
        double CurrentSpeed { get; set; }

        double Accelerate(double AccelerationRate, double Seconds);

        double Brake(double DecelerationRate, double Seconds);

        double Turn(double Radius);
    }
}
