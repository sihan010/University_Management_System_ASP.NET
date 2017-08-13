using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.Providers.Entities;

public partial class Register : System.Web.UI.Page
{
    String id, name, role;
    int regi,adm;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0)
        {
            id = (String)(Session["id"]);
            role = (String)(Session["role"]);
            ID.Text = "ID: " + id;
            Role.Text = "Logged in as: " + role;
        }
        else
        {
            Response.BufferOutput = true;
            Response.Redirect("Login.aspx", false);
        }
    }

    protected void reg_Click(object sender, EventArgs e)
    {

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT reg_open,reg_sem FROM control;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.HasRows && reader.Read())
            {
                regi = reader.GetInt32(reader.GetOrdinal("reg_open"));               
            }
            conn.Close();
            if (regi == 1)
            {
                Label1.Text = "Registration is Open for Now";
                reg_toogle.Text = "Close Registration";
            }
            else
            {
                Label1.Text = "Registration is Closed for Now";
                reg_toogle.Text = "Open Registration";
            }

        }
        catch (Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }
    }

    protected void tran_Click(object sender, EventArgs e)
    {
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
                Label2.Text = "Admission is Open for Now";
                Button1.Text = "Close Admission";
            }
            else
            {
                Label2.Text = "Admission is Closed for Now";
                Button1.Text = "Open Admission";
            }
            //Label2.Text = adm.ToString();

        }
        catch (Exception ex)
        {
            Label2.Text = "Message:" + ex.Message;
        }
    }    

    protected void logOut_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.BufferOutput = true;
        Response.Redirect("Default.aspx", false);
    }

    protected void reg_toogle_Click(object sender, EventArgs e)
    {
        if (Label1.Text.Contains("Open"))
        {
            try
            {
                string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
                MySqlConnection conn = new MySqlConnection(connStr);
                String query = "update control set reg_open = 0 where id = 1";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();                            
                conn.Close();
                Label1.Text = "Registration is Closed for Now";
                reg_toogle.Text = "Open Registration";
            }
            catch (Exception ex)
            {
                Label1.Text = "Message:" + ex.Message;
            }
        }
        else if(Label1.Text.Contains("Close"))
        {
            try
            {
                string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
                MySqlConnection conn = new MySqlConnection(connStr);
                String query = "update control set reg_open = 1 where id = 1";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Label1.Text = "Registration is Open for Now";
                reg_toogle.Text = "Close Registration";
            }
            catch (Exception ex)
            {
                Label1.Text = "Message:" + ex.Message;
            }
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Label2.Text.Contains("Open"))
        {
            try
            {
                string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
                MySqlConnection conn = new MySqlConnection(connStr);
                String query = "update control set adm_open = 0 where id = 1";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Label2.Text = "Admission is Closed for Now";
                Button1.Text = "Open Admission";
            }
            catch (Exception ex)
            {
                Label2.Text = "Message:" + ex.Message;
            }
        }
        else if (Label2.Text.Contains("Close"))
        {
            try
            {
                string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
                MySqlConnection conn = new MySqlConnection(connStr);
                String query = "update control set adm_open = 1 where id = 1";
                MySqlCommand cmd = new MySqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                Label2.Text = "Admission is Open for Now";
                Button1.Text = "Close Admission";
            }
            catch (Exception ex)
            {
                Label2.Text = "Message:" + ex.Message;
            }
        }
    }
}
