using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class AddLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddSubmitClick(object sender, EventArgs e)
    {
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO logininfo (id,pass,role) VALUES ('" + AddUserID.Text + "','" + AddPass.Text + "','" + AddRole.SelectedValue + "')";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            AddLabel1.Text = "User succesfully registered";

            conn.Close();

        }
        catch (Exception ex)
        {
            AddLabel1.Text = "Message:"+ex.Message;
        }
    }
}