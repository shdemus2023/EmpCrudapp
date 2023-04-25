using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using EmpCrudapp.Entity;
namespace EmpCrudapp.Dal
{
    public static class dalEmployee
    {
        static string constr = ConfigurationManager.ConnectionStrings["EmpConStr"].ConnectionString;

        public static bool empInsert(Employee emp)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(constr))
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    conn.Open();
                    cmd.CommandText = "dbo.InsertEmp";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Name", emp.Name));
                    cmd.Parameters.Add(new SqlParameter("@City", emp.City));
                    cmd.Parameters.Add(new SqlParameter("@Salary", emp.Salary));

                    int count = cmd.ExecuteNonQuery();



                    if (count > 0)
                        return true;
                }

            }
            catch (Exception ex)
            {
            }
            return false;
        }

        public static DataTable empGetAllData()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(constr))
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    conn.Open();
                    cmd.CommandText = "dbo.SelectEmp";
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    return dt;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static bool empUpdate(Employee emp)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(constr))
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    conn.Open();
                    cmd.CommandText = "dbo.UpdateEmp";

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", emp.Id));
                    cmd.Parameters.Add(new SqlParameter("@Name", emp.Name));
                    cmd.Parameters.Add(new SqlParameter("@City", emp.City));
                    cmd.Parameters.Add(new SqlParameter("@Salary", emp.Salary));

                    int count = cmd.ExecuteNonQuery();

                    if (count > 0)
                        return true;
                }

            }
            catch (Exception ex)
            {
            }
            return false;
        }

        public static bool empDelete(int id)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(constr))
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    conn.Open();
                    cmd.CommandText = "dbo.DeleteEmp";

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@Id", id));

                    int count = cmd.ExecuteNonQuery();

                    if (count > 0)
                        return true;
                }

            }
            catch (Exception ex)
            {
            }
            return false;
        }
    }
}