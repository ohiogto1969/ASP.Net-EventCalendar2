using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// EventDAO class is the main class which interacts with the database. SQL Server express edition
/// has been used.
/// the event information is stored in a table named 'event' in the database.
///
/// Here is the table format:
/// event(event_id int, title varchar(100), description varchar(200),event_start datetime, event_end datetime)
/// event_id is the primary key
/// </summary>
public class EventDAO
{
    //change the connection string as per your database connection.
    private static string connectionString = ConfigurationManager.AppSettings["DBConnString"];

    //this method retrieves all events within range start-end
    public static List<CalendarEvent> getEvents(DateTime start, DateTime end)
    {
        List<CalendarEvent> events = new List<CalendarEvent>();
        SqlConnection con = new SqlConnection(connectionString);
        //SqlCommand cmd = new SqlCommand("SELECT dbo.tblCustomers.lngCustId, ISNull(dbo.tblCustomers.strBusinessName,'') +' '+ISNULL(dbo.tblCustomers.strLastName,'') As fullName, dbo.tblCustomers.strFirstName, dbo.tblCustomers.strLastName, " +
        //                                "dbo.tblProduction.productionId, dbo.tblProduction.jobStartDte, dbo.tblProduction.foreman, dbo.tblProduction.jobEndDte, dbo.tblProduction.all_day, dbo.tblProduction.color " +
        //                                "FROM dbo.tblCustomers " +
        //                                "INNER JOIN dbo.tblProduction ON dbo.tblCustomers.lngCustId = dbo.tblProduction.customerIdFk " +
        //                                "WHERE dbo.tblProduction.jobStartDte>=@start AND dbo.tblProduction.jobEndDte<=@end", con);

        SqlCommand cmd = new SqlCommand("SELECT dbo.tblCustomers.lngCustId, ISNull(dbo.tblCustomers.strBusinessName,'') +' '+ISNULL(dbo.tblCustomers.strLastName,'') +' '+ISNULL(dbo.tblCboForeman.initials,'')As fullName, dbo.tblCustomers.strFirstName, dbo.tblCustomers.strLastName, " +
                                        "dbo.tblProduction.productionId, dbo.tblProduction.jobStartDte, dbo.tblProduction.jobEndDte, dbo.tblProduction.all_day, dbo.tblProduction.color, dbo.tblProduction.textColor, dbo.tblCboForeman.initials, dbo.tblCboForeman.initials " +
                                        "FROM dbo.tblProduction INNER JOIN " +
                                        "dbo.tblCboForeman ON dbo.tblProduction.foreman = dbo.tblCboForeman.foremanID INNER JOIN " +
                                        "dbo.tblProposals ON dbo.tblProduction.proposalIdFk = dbo.tblProposals.proposalId INNER JOIN " +
                                        "dbo.tblCustomers ON dbo.tblProposals.lngCustIdfk = dbo.tblCustomers.lngCustId " +
                                        "WHERE dbo.tblProduction.jobStartDte>=@start AND dbo.tblProduction.jobEndDte<=@end", con);

        cmd.Parameters.Add("@start", SqlDbType.DateTime).Value = start;
        cmd.Parameters.Add("@end", SqlDbType.DateTime).Value = end;

        using (con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                events.Add(new CalendarEvent()
                {
                    id = Convert.ToInt32(reader["productionid"]),
                    initials = Convert.ToString(reader["initials"]),
                    title = Convert.ToString(reader["fullName"]),
                    start = Convert.ToDateTime(reader["jobStartDte"]),
                    end = Convert.ToDateTime(reader["jobEndDte"]),
                    allDay = Convert.ToBoolean(reader["all_day"]),
                    color = Convert.ToString(reader["color"]),
                    textColor = Convert.ToString(reader["textColor"]),
                });
            }
        }
        return events;
        //side note: if you want to show events only related to particular users,
        //if user id of that user is stored in session as Session["userid"]
        //the event table also contains an extra field named 'user_id' to mark the event for that particular user
        //then you can modify the SQL as:
        //SELECT event_id, description, title, event_start, event_end FROM event where user_id=@user_id AND event_start>=@start AND event_end<=@end
        //then add paramter as:cmd.Parameters.AddWithValue("@user_id", HttpContext.Current.Session["userid"]);
    }

    //this method updates the event title and description
    public static void updateEvent(int id, String title, String description)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE Event SET title=@title, description=@description WHERE event_id=@event_id", con);
        cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;
        cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = description;
        cmd.Parameters.Add("@event_id", SqlDbType.Int).Value = id;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    //this method updates the event start and end time ... allDay parameter added for FullCalendar 2.x
    public static void updateEventTime(int id, DateTime start, DateTime end, bool allDay)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE Event SET event_start=@event_start, event_end=@event_end, all_day=@all_day WHERE event_id=@event_id", con);
        cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = start;
        cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = end;
        cmd.Parameters.Add("@event_id", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@all_day", SqlDbType.Bit).Value = allDay;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    //this mehtod deletes event with the id passed in.
    public static void deleteEvent(int id)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("DELETE FROM Event WHERE (event_id = @event_id)", con);
        cmd.Parameters.Add("@event_id", SqlDbType.Int).Value = id;

        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    //this method adds events to the database
    public static int addEvent(CalendarEvent cevent)
    {
        //add event to the database and return the primary key of the added event row

        //insert
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO Event(title, description, event_start, event_end, all_day) VALUES(@title, @description, @event_start, @event_end, @all_day)", con);
        cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = cevent.title;
        cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = cevent.description;
        cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = cevent.start;
        cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = cevent.end;
        cmd.Parameters.Add("@all_day", SqlDbType.Bit).Value = cevent.allDay;

        int key = 0;
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();

            //get primary key of inserted row
            cmd = new SqlCommand("SELECT max(event_id) FROM Event where title=@title AND description=@description AND event_start=@event_start AND event_end=@event_end AND all_day=@all_day", con);
            cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = cevent.title;
            cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = cevent.description;
            cmd.Parameters.Add("@event_start", SqlDbType.DateTime).Value = cevent.start;
            cmd.Parameters.Add("@event_end", SqlDbType.DateTime).Value = cevent.end;
            cmd.Parameters.Add("@all_day", SqlDbType.Bit).Value = cevent.allDay;

            key = (int)cmd.ExecuteScalar();
        }

        return key;
    }


    public static List<CalendarEvent> debuggetEvents(DateTime start, DateTime end)
    {
        var dt = DateTime.Today;
        return new List<CalendarEvent>(new[]
        {
            new CalendarEvent{title = "test1",description = "test 1 desc",start = dt.AddHours(10),end = dt.AddHours(11),allDay = false,color = "#ff0000",},
            new CalendarEvent{title = "test2",description = "test 2 description",start = dt.AddHours(15),end = dt.AddHours(18),allDay = false,color = "#888888",},
            new CalendarEvent{title = "test3",description = "test 3 desc",start = dt.AddHours(-12),end = dt.AddHours(-8),allDay = false,color = "#ffff00",},
            new CalendarEvent{title = "test4",description = "test 4 description",start = dt.AddHours(32),end = dt.AddHours(35),allDay = false,color = "#0000cc",},
        });
    }
}
