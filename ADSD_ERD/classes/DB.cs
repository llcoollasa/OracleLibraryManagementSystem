using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OracleClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace ADSD_ERD.classes
{
    class DB
    {
        private OracleConnection oracleConnection = null;
        private OracleCommand oracleCommand = null;

        /// <summary>
        /// Open DB Connection
        /// </summary>
        public DB()
        {
            String conStr = ConfigurationManager.ConnectionStrings["CESConnection"].ConnectionString;

            try
            {
                if (this.oracleConnection == null)
                {
                    this.oracleConnection = new OracleConnection(conStr);
                    this.oracleConnection.Open();
                }
                else
                {
                    if (this.oracleConnection.State == System.Data.ConnectionState.Closed)
                    {
                        this.oracleConnection.Open();
                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

        }

        /// <summary>
        /// Get Select SQL result set
        /// </summary>
        /// <param name="sql">SELECT SQL Statement</param>
        /// <returns>Result as DataTable</returns>
        public DataTable getResult(String sql)
        {
            DataTable dt = new DataTable();
            if (this.oracleConnection.State != System.Data.ConnectionState.Closed)
            {
                OracleDataAdapter da = new OracleDataAdapter(sql, this.oracleConnection);
                da.Fill(dt);
            }
            else
            {
                Console.WriteLine("connection lost");
            }
            return dt;
        }

        /// <summary>
        /// Execute non query statements
        /// </summary>
        /// <param name="sql">INSERT/DELETE/UPDATE SQL Statement</param>
        /// <returns>Result as DataTable</returns>
        public int executeNonQuery(String sql)
        {
            int result = 0;

            if (this.oracleConnection.State != System.Data.ConnectionState.Closed)
            {
                this.oracleCommand = new OracleCommand(sql, this.oracleConnection);
                result = this.oracleCommand.ExecuteNonQuery();
            }
            else
            {
                Console.WriteLine("Connection Lost"); 
            }
            return result;
        }

        /// <summary>
        /// Close DB Connection
        /// </summary>
        public void closeConnection()
        {
            if (this.oracleConnection.State != System.Data.ConnectionState.Closed)
            {
                this.oracleConnection.Close();
            }
        }
        /// <summary>
        /// Prepare Search SQL Statement
        /// </summary>
        /// <returns></returns>
        public string prepareSearchSql(Dictionary<string, string> parameters, string sql)
        {
            int paramCount = 0;
            foreach (var item in parameters)
            {
                String param = item.Key + " LIKE '" + item.Value + "%'";
                if (paramCount > 0)
                {
                    sql += " AND " + param;
                }
                else
                {
                    sql += param;
                }

                paramCount++;
            }
            return sql;
        }
    }
}