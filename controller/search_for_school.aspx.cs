using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search_for_school : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void search_Click(object sender, EventArgs e)
    {
        
        
        RadioButtonList search = ((RadioButtonList)FindControl("option"));
        String info = ((TextBox)FindControl("info")).Text;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        Table resTable = ((Table)FindControl("res_table"));
       // resTable.Rows.Clear();

        SqlDataReader rdr;


        if (search.SelectedValue.Equals("address"))
        {
            SqlCommand cmd;

            cmd = new SqlCommand("Search_for_school_by_address", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@s_address", info));
            conn.Open();
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        else if(search.SelectedValue.Equals("type"))
        {
            SqlCommand cmd;
            
            cmd = new SqlCommand("Search_for_school_by_type", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@type", info));
            conn.Open();
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        else
        {
            SqlCommand cmd;

            cmd = new SqlCommand("Search_for_school_by_name", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@s_name", info));
            conn.Open();
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        while(rdr.Read())
        {
            int id = rdr.GetInt32(rdr.GetOrdinal("school_id"));
            string name = rdr.GetString(rdr.GetOrdinal("school_name"));
            String phone= rdr.GetString(rdr.GetOrdinal("phone_num"));
            String address= rdr.GetString(rdr.GetOrdinal("school_address"));
            String email= rdr.GetString(rdr.GetOrdinal("email"));
            String mission= rdr.GetString(rdr.GetOrdinal("mission"));
            String vision = rdr.GetString(rdr.GetOrdinal("vision"));
            int fees = rdr.GetInt32(rdr.GetOrdinal("fees"));
            TableRow nr = new TableRow();
            TableCell nc = new TableCell();
            nc.Text = id+"";
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = name;
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = phone;
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = address;
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = email;
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = mission;
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = vision;
            nr.Cells.Add(nc);
            nc = new TableCell();
            nc.Text = fees+"";
            nr.Cells.Add(nc);
            nc = new TableCell();
            resTable.Rows.Add(nr);

        }
 
    }
}