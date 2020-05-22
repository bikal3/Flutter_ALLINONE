import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class DateTable extends StatefulWidget {
  @override
  _DateTableState createState() => _DateTableState();
}

class _DateTableState extends State<DateTable> with TickerProviderStateMixin {
  DateTime _selectedDay;
  bool _isLoading = false;
  String _selectedEvent;
  Map<dynamic, List> _events;
  AnimationController _animationController;
  CalendarController _calendarController;
  @override
  void initState() {
    // _selected();
    super.initState();
    _calendarController = CalendarController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
    });

    print('Selected day: $day');
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      backgroundColor: Colors.grey[600],
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          const SizedBox(height: 8.0),
          Text(_selectedEvent),
          formContainer(),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    if (_selectedEvent == null) {
      _selectedDay = DateTime.now();
      setState(() {
        // _selectedEvent = _selectedDay.toString();
        _selectedEvent = DateFormat('yyyy-MM-dd').format(_selectedDay);
        // _isLoading = true;
      });
    } else {
      setState(() {
        _selectedEvent = DateFormat('yyyy-MM-dd').format(_selectedDay);
        // _isLoading = true;
      });
    }
    return TableCalendar(
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      initialCalendarFormat: CalendarFormat.week,
      availableGestures: AvailableGestures.all,
      formatAnimation: FormatAnimation.slide,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },

      onDaySelected: _onDaySelected,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.white),
        weekdayStyle: TextStyle().copyWith(color: Colors.white),
      ),
      // availableCalendarFormats:CalendarFormat.month,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.black54,
        todayColor: Colors.black12,
        markersColor: Colors.white,
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.white),
        holidayStyle: TextStyle().copyWith(color: Colors.white),
        weekdayStyle: TextStyle().copyWith(color: Colors.white),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonVisible: false,
        titleTextStyle: TextStyle().copyWith(color: Colors.white),

        // formatButtonDecoration: BoxDecoration(
        //   color: Colors.blue[400],
        //   borderRadius: BorderRadius.circular(16.0),
        // ),
      ),
    );
  }

  Widget textDate(BuildContext context) {
    if (_isLoading = false) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Text(_selectedEvent);
    }
  }

  Widget formContainer() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(12)),
    );
  }
}
