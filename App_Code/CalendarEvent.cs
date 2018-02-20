﻿using System;

/// <summary>
/// Summary description for CalendarEvent
/// </summary>
public class CalendarEvent
{
    public int id { get; set; }
    public string title { get; set; }
    public string description { get; set; }
    public DateTime start { get; set; }
    public DateTime end { get; set; }
    public bool allDay { get; set; }
    public string color { get; set; }
    public string textColor { get; set; }
    public string initials { get; set; }
}
