using System.Collections.Generic;
using System.Data;
using JG_Prospect.BO;
using JG_Prospect.DAL;

namespace JG_Prospect.BLL
{
    public class CurrencyBLL
    {
        private CurrencyBLL()
        {
        }

        public static CurrencyBLL Instance { get; } = new CurrencyBLL();

        public DataSet GetAllCurrency()
        {
            return CurrencyDAL.Instance.GetAllCurrency();
        }

        public IEnumerable<CurrencyCountryBO> GetAllCurrencyCountryCode()
        {
            return CurrencyDAL.Instance.GetAllCurrencyCountryCode();
        }
    }
}