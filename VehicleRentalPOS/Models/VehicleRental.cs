//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VehicleRentalPOS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class VehicleRental
    {
        public int Id { get; set; }
        public int VehicleId { get; set; }
        public int RateId { get; set; }
        public int CustomerId { get; set; }
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public bool DeleteFlag { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Rate Rate { get; set; }
        public virtual Vehicle Vehicle { get; set; }
    }
}