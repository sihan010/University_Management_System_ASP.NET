using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginSubmitClick(object sender, EventArgs e)
    {
        String ident = "", role1 = "", query = "";
        string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
        MySqlConnection conn = new MySqlConnection(connStr);
        query = "SELECT * FROM logininfo WHERE id='" + LoginUserID.Text + "' AND pass='"
                + LoginPass.Text + "' AND role='" + LoginRole.SelectedValue + "'";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        conn.Open();
        MySqlDataReader myReader = cmd.ExecuteReader();

        while (myReader.HasRows && myReader.Read())
        {
            ident = myReader.GetString(myReader.GetOrdinal("id"));
            role1 = myReader.GetString(myReader.GetOrdinal("role"));
        }
        if (myReader.HasRows)
        {
            Session["id"] = ident;
            Session["role"] = role1;
            Response.BufferOutput = true;
            if (role1 == "Student")
                Response.Redirect("Student.aspx", false);
            else if (role1 == "Faculty")
                Response.Redirect("Faculty.aspx", false);
            else if (role1 == "Register")
                Response.Redirect("Register.aspx", false);
            else if (role1 == "Gurdian")
                Response.Redirect("Gurdian.aspx", false);
            else if (role1 == "Adminstrator")
                Response.Redirect("Admistrator.aspx", false);
        }
        else
        {
            LoginLabel1.Text = "Message: Credentials Don't Match";
        }
        conn.Close();
    }
}