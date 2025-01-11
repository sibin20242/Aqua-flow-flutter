import 'package:aquaflow/services/user/timeapi.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        title: Text('AQUA FLOW',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Notifications clicked!")),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('I', style: TextStyle(color: Colors.indigo[900])),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TableCalendar(
                    onDaySelected: (selectedDay, focusedDay) {
                      print(selectedDay);
                     viewTimeSchedule(data: {
                      'Date':selectedDay.toString().substring(0,10)
                     });
                    },
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2020),
                    lastDay: DateTime(2030),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white),
                      outsideTextStyle: TextStyle(color: Colors.grey[600]),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.white),
                      weekendStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleItem(
                    label: 'Morning',
                    time: '8:00 am - 10:00 am',
                    icon: Icons.wb_sunny,
                  ),
                  SizedBox(height: 16),
                  ScheduleItem(
                    label: 'Evening',
                    time: '5:00 pm - 7:00 pm',
                    icon: Icons.nights_stay,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;

  const ScheduleItem({
    required this.label,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.indigo[900]),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
