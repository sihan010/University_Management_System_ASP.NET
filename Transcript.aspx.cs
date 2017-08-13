using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class Transcript : System.Web.UI.Page
{
    String student;
    DateTime dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        student= (String)(Session["stu"]);
        String address1 = "", major1 = "", minor1 = "", name1 = "", date1="" ;

        dt = DateTime.Now;
        date1=dt.ToString();

        string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
        MySqlConnection conn = new MySqlConnection(connStr);
        String query = "SELECT stu_fname,stu_lname,stu_address,stu_major,stu_minor FROM student WHERE stu_id='" + student + "';";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        conn.Open();
        MySqlDataReader reader = cmd.ExecuteReader();
        while (reader.HasRows && reader.Read())
        {
            name1 = reader.GetString(reader.GetOrdinal("stu_fname")) + " " + reader.GetString(reader.GetOrdinal("stu_lname"));
            address1 = reader.GetString(reader.GetOrdinal("stu_address"));
            major1 = reader.GetString(reader.GetOrdinal("stu_major"));
            minor1 = reader.GetString(reader.GetOrdinal("stu_minor"));
        }
        conn.Close();
        id.Text = "Student ID: "+student;
        name.Text = "Student Name: " + name1;
        address.Text = "Student Address: " + address1;
        major.Text = "Student Major: " + major1;
        minor.Text = "Student Minor: " + minor1;
        time.Text = "Date: " + date1;


        try
        {
            string connStr1 = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn1 = new MySqlConnection(connStr1);
            String query1 = "SELECT DISTINCT S.c_id AS 'Course ID',C.c_name AS 'Course Name',C.c_credit AS Credit,"+
                "C.c_credit AS 'Credit Earned',E.enroll_grade AS Grade ,E.enroll_semester AS Semester,E.enroll_grade*C.c_credit AS 'Grade Point'"+
                " FROM section S,enrollment E,student_has_enrollment SE,course C " +
                "WHERE S.enroll_id = E.enroll_id AND S.c_id=C.c_id AND SE.stu_id = '" + student + "'";
            MySqlCommand cmd1 = new MySqlCommand(query1, conn1);
            conn1.Open();
            cmd1.ExecuteNonQuery();
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmd1);
            da.Fill(dt);
            result.DataSource = dt;
            result.DataBind();
            conn1.Close();
        }
        catch (Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }

        String grade1 = "not pulled", credit1 = "not pulled"; 

        try
        {
            string connStr1 = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn1 = new MySqlConnection(connStr1);
            String query1 ="SELECT SUM(Data.Credit1) AS Credit FROM (SELECT DISTINCT S.c_id AS 'Course ID',C.c_name AS 'Course Name',C.c_credit AS Credit1," +
                "C.c_credit AS 'Credit Earned',E.enroll_grade AS Grade ,E.enroll_semester AS Semester,E.enroll_grade*C.c_credit AS Grade1" +
                " FROM section S,enrollment E,student_has_enrollment SE,course C " +
                "WHERE S.enroll_id = E.enroll_id AND S.c_id=C.c_id AND SE.stu_id = '" + student + "') AS Data";
            MySqlCommand cmd1 = new MySqlCommand(query1, conn1);
            conn1.Open();
            MySqlDataReader read = cmd1.ExecuteReader();
            while(read.HasRows && read.Read())
            {
                credit1 = read.GetString(read.GetOrdinal("Credit"));                
            }
            conn1.Close();
        }
        catch (Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }

        try
        {
            string connStr1 = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn1 = new MySqlConnection(connStr1);
            String query1 = "SELECT SUM(Data.Grade1) AS Grade FROM (SELECT DISTINCT S.c_id AS 'Course ID',C.c_name AS 'Course Name',C.c_credit AS Credit," +
                "C.c_credit AS 'Credit Earned',E.enroll_grade AS Grade ,E.enroll_semester AS Semester,E.enroll_grade*C.c_credit AS Grade1" +
                " FROM section S,enrollment E,student_has_enrollment SE,course C " +
                "WHERE S.enroll_id = E.enroll_id AND S.c_id=C.c_id AND SE.stu_id = '" + student + "') AS Data";
            MySqlCommand cmd1 = new MySqlCommand(query1, conn1);
            conn1.Open();
            MySqlDataReader read = cmd1.ExecuteReader();
            while (read.HasRows && read.Read())
            {
                grade1 = read.GetString(read.GetOrdinal("Grade"));
            }
            conn1.Close();
        }
        catch (Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }

        credit.Text = "Total Credits Earned: "+credit1;
        grade.Text = "Total Grade Point: " + grade1;
        cgpa.Text = "Camulative GPA: "+(Double.Parse(grade1) / Double.Parse(credit1)).ToString();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void gen_Click(object sender, EventArgs e)
    {
        try
        {
            String docName = "transcript" + student + ".pdf";
            Response.ContentType = "Application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + docName);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            this.Page.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 20f, 0.0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.Flush();
            Response.End();
        }
        catch(Exception ex)
        {
            Label1.Text = "Message:" + ex.Message;
        }
    }    
}