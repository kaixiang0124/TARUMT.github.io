//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TimeZone_Assign
{
    using System;
    using System.Collections.Generic;
    
    public partial class REPLY
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public REPLY()
        {
            this.REVIEWs = new HashSet<REVIEW>();
        }
    
        public string REPLY_ID { get; set; }
        public string EMPLOYEE_ID { get; set; }
        public string REPLY1 { get; set; }
        public System.DateTime REPLY_DATE { get; set; }
    
        public virtual EMPLOYEE EMPLOYEE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<REVIEW> REVIEWs { get; set; }
    }
}
