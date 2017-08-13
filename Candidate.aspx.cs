using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Candidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AddCandidate_Click(object sender, EventArgs e)
    {
        String fname1, lname1, father1, mother1, high1, ssc1, ssc_gpa1, college1, hsc1, hsc_gpa1, gender1, blood1, major1;
        int id=0;
        fname1 = fname.Text;
        lname1 = lname.Text;
        father1 = father.Text;
        mother1 = mother.Text;
        high1 = high.Text;
        ssc1 = ssc.Text;
        ssc_gpa1 = ssc_gpa.Text;
        college1 = college.Text;
        hsc1 = hsc.Text;
        hsc_gpa1 = hsc_gpa.Text;
        gender1 = gender.SelectedValue;
        blood1 = blood.SelectedValue;
        major1 = major.SelectedValue;        
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);

            String idq = "SELECT MAX(can_id) AS can1 FROM candidate";
            MySqlCommand cmd1 = new MySqlCommand(idq, conn);
            conn.Open();
            MySqlDataReader read1 = cmd1.ExecuteReader();
            while(read1.HasRows && read1.Read())
            {
                id = read1.GetInt32(read1.GetOrdinal("can1"));
                id += 1;
            }
            conn.Close();          


            String query = "INSERT INTO candidate (can_id,can_fname,can_lame,can_father,can_mother,can_gender,cab_blood,can_high,can_college,can_ssc,can_hsc,can_ssc_year,can_hsc_year,can_major) "+
                "VALUES ('"+id+"','"+fname1+"','"+lname1+"','"+father1+"','"+mother1+"','"+gender1+"','"+blood1+"','"+high1+"','"+college1+"','"+ssc_gpa1+"','"+hsc_gpa1+"','"+ssc1+"','"+hsc1+"','"+major1+"')";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();
            message.Text = "User succesfully registered";
            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }
}