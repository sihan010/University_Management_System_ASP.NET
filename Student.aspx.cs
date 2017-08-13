using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Student : System.Web.UI.Page
{
    String id, name, role;
    protected void Page_Load(object sender, EventArgs e)
    {
        int reg=0;
        if (Session.Count > 0)
        {
            id = (String)(Session["id"]);
            role = (String)(Session["role"]) ;

            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT stu_fname,stu_lname FROM student WHERE stu_id='"+id+"';";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader reader=cmd.ExecuteReader();
            while(reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("stu_fname")) + " " + reader.GetString(reader.GetOrdinal("stu_lname"));
            }
            conn.Close();            
            StuID.Text = "ID: "+id;
            StuName.Text = "Name: "+name;
            StuRole.Text = "Logged in as: "+role;

            query = "SELECT reg_open FROM control WHERE id=1;";
            cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader reader1 = cmd.ExecuteReader();
            while (reader1.HasRows && reader1.Read())
            {
                reg = reader1.GetInt32 (reader1.GetOrdinal("reg_open"));
            }
            conn.Close();
            if (reg == 0)
                Label2.Text = "Registration is Closed Now";
            else if(reg==1)
                Label2.Text = "Registration is Open Now.Please Contact Advisor";
        }
        else
        {
            Response.BufferOutput = true;
            Response.Redirect("Login.aspx", false);
        }           
        
    }

    protected void logOut_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.BufferOutput = true;
        Response.Redirect("Default.aspx", false);
    }

    protected void enrollment_Click(object sender, EventArgs e)
    {
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT E.enroll_id AS Enrollment_ID ,E.enroll_semester AS Semester,E.enroll_grade AS Grade FROM enrollment E , student_has_enrollment SE "+
                            "WHERE E.enroll_id=SE.enroll_id AND SE.stu_id='"+id+"'";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            result.DataSource = dt;
            result.DataBind();           
            conn.Close();

        }
        catch (Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }
    }

    protected void transcript_Click(object sender, EventArgs e)
    {
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT DISTINCT S.c_id AS Section_ID ,E.enroll_grade AS Grade ,E.enroll_semester AS Semester FROM section S,enrollment E,student_has_enrollment SE "+
                           "WHERE S.enroll_id = E.enroll_id AND SE.stu_id = '"+id+"'" ;
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            result.DataSource = dt;
            result.DataBind();
            conn.Close();

        }
        catch (Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }
    }

    protected void registration_Click(object sender, EventArgs e)
    {

    }

    protected void scholarship_Click(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Response.Redirect("Scholarship.aspx", false);
    }

    protected void genPDF_Click(object sender, EventArgs e)
    {
        Session["stu"] = id;
        Response.BufferOutput = true;
        Response.Redirect("Transcript.aspx", true);
    }
}