using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmpCrudapp.Dal;
using EmpCrudapp.Entity;

namespace EmpCrudapp
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                loadData();
        }

        private void loadData()
        {
            GridView1.DataSource = dalEmployee.empGetAllData();
            GridView1.DataBind();
            Session["selectedId"] = -1;
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {   // Insert
            Employee emp = new Employee
            {
                Name = txtName.Text.Trim(),
                City = txtCity.Text.Trim(),
                Salary = Convert.ToInt32(txtSalary.Text.Trim())
            };

            string msg = dalEmployee.empInsert(emp) ? "Inserted" : "failed";

            clearFields();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow SelectedRow = GridView1.SelectedRow;
            txtName.Text = SelectedRow.Cells[2].Text;
            txtCity.Text = SelectedRow.Cells[3].Text;
            txtSalary.Text = SelectedRow.Cells[4].Text;

            Session["selectedId"] = Convert.ToInt32(SelectedRow.Cells[1].Text); // id from hidden col


        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string msg;
            int id = Convert.ToInt32(Session["selectedId"]);

            if (id > 0)
            {
                Employee emp = new Employee
                {
                    Id = id,
                    Name = txtName.Text.Trim(),
                    City = txtCity.Text.Trim(),
                    Salary = Convert.ToInt32(txtSalary.Text.Trim())
                };

                msg = dalEmployee.empUpdate(emp) ? "Updated" : "failed";

                clearFields();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string msg;
            int id = Convert.ToInt32(Session["selectedId"]);

            if (id > 0)
            {
                msg = dalEmployee.empDelete(id) ? "Deleted" : "failed";

                clearFields();
            }
        }

        private void clearFields()
        {
            txtName.Text = "";
            txtCity.Text = "";
            txtSalary.Text = "";
            Session["selectedId"] = -1;
            loadData();
        }
    }
}