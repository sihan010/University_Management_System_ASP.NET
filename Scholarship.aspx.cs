using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Scholarship : System.Web.UI.Page
{
    String id1, type1, fname1, lname1, parcent1, cgpa1;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddSch_Click(object sender, EventArgs e)
    {
        id1 = (String)(Session["id"]);
        type1 = type.SelectedValue;
        fname1 = fname.Text;
        lname1 = lname.Text;
        parcent1 = parcent.Text;
        cgpa1 = cgpa.Text;

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO scholarship (sch_type,sch_gurantor_fname,sch_gurantor_lname,parcentage,stu_id,sch_cgpa) "+
                "VALUES ('" + type1 + "','" + fname1 + "','" + lname1 + "','" + parcent1 +"','"+id1+"','"+cgpa1+"')";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            message.Text = "Succesfully Applied for Scholarship";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }
}