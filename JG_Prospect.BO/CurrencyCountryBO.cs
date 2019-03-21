namespace JG_Prospect.BO
{
    /// <summary>
    /// Business object class for Currency/Country intermediate table
    /// </summary>
    public class CurrencyCountryBO
    {
        /// <summary>
        /// Currency unique identifier.
        /// </summary>
        public int CurrencyId { get; set; }
        /// <summary>
        /// Country ISO code.
        /// </summary>
        public string CountryCode { get; set; }

        /// <summary>
        /// Iso language code.
        /// </summary>
        public string IsoLanguageCode { get; set; }
    }
}
