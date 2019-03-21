using System.Data;
using JG_Prospect.DAL;

namespace JG_Prospect.BLL
{
    public class CountryBLL
    {
        private CountryBLL()
        {
        }

        public static CountryBLL Instance { get; } = new CountryBLL();

        public DataSet GetAllCountry()
        {
            return CountryDAL.Instance.GetDepartmentsByFilter(0);
        }
    }
}
