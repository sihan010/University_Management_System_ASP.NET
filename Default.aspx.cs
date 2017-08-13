using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void apply_Click(object sender, EventArgs e)
    {
        int adm = 0;
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT adm_open FROM control;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader reader1 = cmd.ExecuteReader();
            while (reader1.HasRows && reader1.Read())
            {
                adm = reader1.GetInt32(reader1.GetOrdinal("adm_open"));
            }
            conn.Close();
            if (adm == 1)
            {
                Response.BufferOutput = true;
                Response.Redirect("Candidate.aspx", false);
            }
            else
            {
                Label1.Text = "Admission is not open now. Please Come Back Next Semester. Thanks for Visiting.";
            }
            //Label1.Text = "Message: An Erron Occured. Wait Untill Admin Fixes it";

        }
        catch (Exception ex)
        {
            Label1.Text = "Message: An Erron Occured. Wait Untill Admin Fixes it";
        }
    }
}