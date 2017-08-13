using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class DepartmentCRUD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT sc_name FROM school;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            school.DataSource = cmd.ExecuteReader();
            school.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }

    protected void addDept_Click(object sender, EventArgs e)
    {
        String name1, number1, school1;
        name1 = name.Text;
        number1 = number.Text;
        school1 = school.SelectedValue;

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO departmet (dept_name,dept_faculties_no,sc_name) VALUES ('"+name1+"','"+number1+"','"+school1+"');";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            message.Text = "Department succesfully Added";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }
}