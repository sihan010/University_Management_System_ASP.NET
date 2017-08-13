using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class CourseCRUD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT dept_name FROM departmet;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            department.DataSource = cmd.ExecuteReader();
            department.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }

    protected void addCourse_Click(object sender, EventArgs e)
    {
        String id1, name1, department1, prereq1, credit1, section1, capacity1, start1, end1, room1, room_capacity1,time_id1="";
        id1 = id.Text;
        name1 = name.Text;
        department1 = department.SelectedValue;
        prereq1 = prereq.Text;
        credit1 = credit.Text;
        section1 = section.Text;
        capacity1 = capacity.Text;
        start1 = start.Text;
        end1 = end.Text;
        room1 = room.Text;
        room_capacity1 = room_capacity.Text;

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO course (c_id,c_name,c_credit,c_prereq,dept_name) VALUES ('"+id1+"','"+name1+"','"+credit1+"','"+prereq1+"','"+department1+"');";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            //message.Text = "Department succesfully Added";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO room (room_no,room_capacity) VALUES ('" + room1 + "','" + room_capacity1 +"');";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            //message.Text = "Department succesfully Added";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO timeslot (time_start_time,time_end_time) VALUES ('" + start1 + "','" + end1 + "');";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            //message.Text = "Department succesfully Added";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT MAX(time_id) AS time FROM timeslot;";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader read = cmd.ExecuteReader();
            if(read.HasRows && read.Read())
            {
                time_id1 = read.GetInt32(read.GetOrdinal("time")).ToString();
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }

        try
        {
            string connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=focus_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO section (sec_no,sec_capacity,enroll_id,c_id,time_id,room_no) VALUES ('" + section1 + "','" + capacity1 + "','1','" + id1 + "','" + time_id1 +"','"+ room1 +"');";
            MySqlCommand cmd = new MySqlCommand(query, conn);

            conn.Open();
            MySqlDataReader myReader = cmd.ExecuteReader();

            message.Text = "Course succesfully Added";

            conn.Close();

        }
        catch (Exception ex)
        {
            message.Text = "Message:" + ex.Message;
        }
    }
}