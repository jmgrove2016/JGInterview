using JG_Prospect.DAL.Database;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System;
using System.Data;
using System.Data.Common;


namespace JG_Prospect.DAL
{
    public class CountryDAL
    {
        public static CountryDAL Instance { get; } = new CountryDAL();
        private DataSet returndata;

        public DataSet GetDepartmentsByFilter(int? departmentId)
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("SP_GetAllCountry");
                    command.CommandType = CommandType.StoredProcedure;
                    returndata = database.ExecuteDataSet(command);

                    return returndata;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
