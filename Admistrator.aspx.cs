using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Admistrator : System.Web.UI.Page
{
    String id, role;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0)
        {
            id = (String)(Session["id"]);
            role = (String)(Session["role"]);
            
            GurID.Text = "ID: " + id;            
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
        Label2.Text = "Select Student ID for Enrollment History";
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT stu_id FROM student;";
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
            String query = "SELECT E.enroll_id,E.enroll_semester,E.enroll_grade FROM enrollment E , student_has_enrollment SE " +
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
            String query = "SELECT DISTINCT S.c_id,E.enroll_grade,E.enroll_semester FROM section S,enrollment E,student_has_enrollment SE " +
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

    protected void faculty_Click(object sender, EventArgs e)
    {
        fa_label.Text = "Select any Faculty ID for Details";
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT fa_id FROM faculty";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            DropDownList3.DataSource = cmd.ExecuteReader();
            DropDownList3.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            Label4.Text = "Message:" + ex.Message;
        }
    }

    protected void course_Click(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Response.Redirect("CourseCRUD.aspx", false);
    }

    protected void school_Click(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Response.Redirect("SchoolCRUD.aspx", false);
    }

    protected void department_Click(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Response.Redirect("DepartmentCRUD.aspx", false);
    }

    protected void candidate_Click(object sender, EventArgs e)
    {
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT * FROM candidate";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            can_res.DataSource = dt;
            can_res.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            Label2.Text = "Message:" + ex.Message;
        }
    }

    protected void fa_button_Click(object sender, EventArgs e)
    {
        String faculty1 = DropDownList3.SelectedValue;
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT * FROM faculty";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd);
            da.Fill(dt);
            fa_result.DataSource = dt;
            fa_result.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            Label2.Text = "Message:" + ex.Message;
        }
    }

    protected void fa_more_Click(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Response.Redirect("FacultyCRUD.aspx", false);
    }

    protected void addLogin_Click(object sender, EventArgs e)
    {
        Response.BufferOutput = true;
        Response.Redirect("AddLogin.aspx", false);
    }
}