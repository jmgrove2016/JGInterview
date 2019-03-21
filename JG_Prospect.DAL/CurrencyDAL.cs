using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using JG_Prospect.BO;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using JG_Prospect.DAL.Database;

namespace JG_Prospect.DAL
{
    public class CurrencyDAL
    {
        public static CurrencyDAL Instance { get; } = new CurrencyDAL();

        private DataSet returndata;


        public DataSet GetAllCurrency()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();
                {
                    returndata = new DataSet();
                    DbCommand command = database.GetStoredProcCommand("SP_GetAllCurrency");
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

        public IEnumerable<CurrencyCountryBO> GetAllCurrencyCountryCode()
        {
            try
            {
                SqlDatabase database = MSSQLDataBase.Instance.GetDefaultDatabase();

                using (DbCommand command = database.GetStoredProcCommand("GetAllCurrencyCountryCode"))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    var result = new List<CurrencyCountryBO>();

                    using (IDataReader reader = database.ExecuteReader(command))
                    {
                        while (reader.Read())
                        {
                            result.Add(new CurrencyCountryBO
                            {
                                CountryCode = reader["CountryCode"].ToString(),
                                CurrencyId = int.Parse(reader["CurrencyId"].ToString()),
                                IsoLanguageCode = reader["IsoLanguageCode"].ToString()
                            });
                        }
                    }

                    return result;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}