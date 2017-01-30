using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VehicleRentalPOS.Models;

namespace VehicleRentalPOS.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult RentVehicle()
        {
            ViewBag.Message = "Implement this.";
            return View();
        }

        public IQueryable<Vehicle> GetVehicles(string VehicleType)
        {
            using (VehicleRentalsEntities entities = new VehicleRentalsEntities())
            {
                IQueryable<Vehicle> vehicles = from vehicle in entities.Vehicles
                                               join vehicleModel in entities.VehicleModels on vehicle.VehicleModelId equals vehicleModel.Id
                                               join vehicleType in entities.VehicleTypes on vehicleModel.VehicleTypeId equals vehicleType.Id
                                               where vehicleType.Type == VehicleType
                                               select vehicle;
                return vehicles;
            }
        }
    }
}