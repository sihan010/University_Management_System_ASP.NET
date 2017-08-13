using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class SchoolCRUD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void addSch_Click(object sender, EventArgs e)
    {
        String name1, number1;
        name1 = name.Text;
        number1 = number.Text;

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO school (sc_name,sc_dept_no) VALUES ('" + name1 + "','" + number1 +"')";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            message.Text = "School succesfully Added";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }
}