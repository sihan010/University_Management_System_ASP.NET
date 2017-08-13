using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Faculty : System.Web.UI.Page
{
    String id, name, role;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0)
        {
            id = (String)(Session["id"]);
            role = (String)(Session["role"]);

            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT fa_fname,fa_lname FROM faculty WHERE fa_id='" + id + "';";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("fa_fname")) + " " + reader.GetString(reader.GetOrdinal("fa_lname"));
            }
            conn.Close();
            GurID.Text = "ID: " + id;
            GurName.Text = "Name: " + name;
            Role.Text = "Logged in as: " + role;            
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
        Label2.Text = "Select any Student ID for Enrollment History";
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT stu_id FROM student";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            DropDownList1.DataSource = cmd.ExecuteReader();
            DropDownList1.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            Label2.Text = "Message:" + ex.Message;
        }
    }

    protected void transcript_Click(object sender, EventArgs e)
    {
        Label4.Text = "Select any Student ID for Transcript";
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT stu_id FROM student;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            DropDownList2.DataSource = cmd.ExecuteReader();
            DropDownList2.DataBind();
            conn.Close();

        }
        catch (Exception ex)
        {
            Label4.Text = "Message:" + ex.Message;
        }
    }

    protected void ok1_Click(object sender, EventArgs e)
    {
        String student = DropDownList1.SelectedValue;
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT E.enroll_id AS Enroll_ID ,E.enroll_semester AS Semester ,E.enroll_grade AS Grade FROM enrollment E , student_has_enrollment SE " +
                            "WHERE E.enroll_id=SE.enroll_id AND SE.stu_id='" + student + "'";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            result1.DataSource = dt;
            result1.DataBind();
            conn.Close();

        }
        catch (Exception ex)
        {
            Label2.Text = "Message:" + ex.Message;
        }
    }

    protected void ok2_Click(object sender, EventArgs e)
    {
        String student = DropDownList2.SelectedValue;
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT DISTINCT S.c_id AS Section_ID ,E.enroll_grade AS Grade,E.enroll_semester AS Semester FROM section S,enrollment E,student_has_enrollment SE " +
                            "WHERE S.enroll_id = E.enroll_id AND SE.stu_id = '" + student + "'";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            result2.DataSource = dt;
            result2.DataBind();
            conn.Close();

        }
        catch (Exception ex)
        {
            Label2.Text = "Message:" + ex.Message;
        }
    }

    protected void course_Click(object sender, EventArgs e)
    {
        String dept1="";
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT dept_name FROM faculty WHERE fa_id='" + id + "'";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader read = cmd.ExecuteReader();
            while(read.HasRows && read.Read())
            {
                dept1 = read.GetString(read.GetOrdinal("dept_name"));
            }            
            conn.Close();
        }
        catch (Exception ex)
        {
            Label6.Text = "Message:" + ex.Message;
        }

        

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT C.c_name AS Course,C.c_credit AS Credit,S.sec_no AS Section,S.sec_capacity AS Capacity,R.room_no AS Room,T.time_start_time AS Start,T.time_end_time AS End FROM course C,section S,room R,timeslot T WHERE C.c_id=S.c_id AND S.room_no=R.room_no "+
                "AND S.time_id=T.time_id AND C.dept_name='" + dept1 + "';";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            result3.DataSource = dt;
            result3.DataBind();
            conn.Close();
            Label6.Text = "Courses Associated to " + name;
        }
        catch (Exception ex)
        {
            Label6.Text = "Message:" + ex.Message;
        }
    }

    protected void gen_Click(object sender, EventArgs e)
    {
        String student = DropDownList2.SelectedValue;
        Session["stu"] = student;
        Response.BufferOutput = true;
        Response.Redirect("Transcript.aspx", true);
    }
}