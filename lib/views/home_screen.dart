import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  final bool isProfessor;

  HomeScreen({required this.isProfessor});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 9, 3): ['Evento de Exemplo 1'],
    DateTime.utc(2024, 9, 15): ['Evento de Exemplo 2', 'Evento de Exemplo 3'],
  };

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _autoScrollPages();
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime(day.year, day.month, day.day)] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });

    List<String> events = _getEventsForDay(selectedDay);
    if (events.isNotEmpty) {
      _showEventDialog(events);
    }
  }

  void _showEventDialog(List<String> events) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: events.map((event) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.event,
                            color: Colors.green[800],
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              event,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green[800],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _autoScrollPages() {
    Future.delayed(Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % 3;
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
        _autoScrollPages(); // Scroll rolando automaticamente
      }
    });
  }

  void _addEvent(String event) {
    setState(() {
      DateTime dayWithoutTime = DateTime(
        _selectedDay.year,
        _selectedDay.month,
        _selectedDay.day,
      );

      if (_events.containsKey(dayWithoutTime)) {
        _events[dayWithoutTime]!.add(event);
      } else {
        _events[dayWithoutTime] = [event];
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Calendário
          Expanded(
            flex: 2,
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _getEventsForDay,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.yellow[700],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon:
                    Icon(Icons.chevron_left, color: Colors.grey[800]),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: Colors.grey[800]),
              ),
            ),
          ),

          // Botão de adicionar evento ou notificações
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                onPressed: () {
                  if (widget.isProfessor) {
                    // Ação ao clicar no botão de adicionar evento
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController eventController =
                            TextEditingController();
                        return AlertDialog(
                          title: Text('Adicionar Evento'),
                          content: TextField(
                            controller: eventController,
                            decoration: InputDecoration(
                              hintText: 'Detalhes do evento',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (eventController.text.isNotEmpty) {
                                  _addEvent(eventController.text);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Salvar'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Ação ao clicar no botão de notificações
                    // Exemplo: mostrar um diálogo de notificações
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Notificações'),
                          content: Text('Aqui estão suas notificações.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Fechar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child:
                    Icon(widget.isProfessor ? Icons.add : Icons.notifications),
                backgroundColor: Colors.yellow[700],
              ),
            ),
          ),
          // Carrossel
          Expanded(
            flex: 1,
            child: PageView(
              controller: _pageController,
              children: [
                Image.asset('assets/imagens/evento1.png', fit: BoxFit.cover),
                Image.asset('assets/imagens/evento2.png', fit: BoxFit.cover),
                Image.asset('assets/imagens/evento3.png', fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
