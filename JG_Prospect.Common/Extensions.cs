using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace JG_Prospect.Common
{
    public static class Extensions
    {
        /// <summary>
        /// Converts UTC DateTime to EST DateTime
        /// </summary>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public static DateTime ToEST(this DateTime dateTime)
        {
            DateTime utcDateTime = DateTime.Parse(dateTime.ToString(), CultureInfo.InvariantCulture, DateTimeStyles.RoundtripKind);
            TimeZoneInfo easternTimeZone = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            return TimeZoneInfo.ConvertTimeFromUtc(utcDateTime, easternTimeZone);
        }

        public static string ToEnumDescription(this Enum en) //ext method
        {
            Type type = en.GetType();
            MemberInfo[] memInfo = type.GetMember(en.ToString());
            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (attrs != null && attrs.Length > 0)
                    return ((DescriptionAttribute)attrs[0]).Description;
            }
            return en.ToString();
        }

        public static string ToEnumWordify(this Enum en)
        {
            Type type = en.GetType();
            MemberInfo[] memInfo = type.GetMember(en.ToString());
            string pascalCaseString = memInfo[0].Name;
            Regex r = new Regex("(?<=[a-z])(?<x>[A-Z])|(?<=.)(?<x>[A-Z])(?=[a-z])");
            return r.Replace(pascalCaseString, " ${x}");
        }

        public static List<KeyValuePair<TEnum, string>> GetList<TEnum>()
        where TEnum : struct
        {
            if (!typeof(TEnum).IsEnum) throw new InvalidOperationException();
            return ((TEnum[])Enum.GetValues(typeof(TEnum)))
               .ToDictionary(k => k, v => ((Enum)(object)v).ToEnumDescription())
               .ToList();
        }

        public static Dictionary<int, string> ToDictionary<T>()
        {
            // Ensure T is an enumerator
            if (!typeof(T).IsEnum)
            {
                throw new ArgumentException("T must be an enumerator type.");
            }

            // Return Enumertator as a Dictionary
            return Enum.GetValues(typeof(T)).Cast<T>().ToDictionary(i => (int)Convert.ChangeType(i, i.GetType()), t => t.ToString());
        }
    }
}
