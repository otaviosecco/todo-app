import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/http/operations.dart';

int filter = 0;

class HeaderDays extends StatelessWidget with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Consumer<PutaQuePariu>(
      builder: (context, pqp, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  TextButton(
                    child: Text('Today', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      selectedDay = DateTime.now();
                      filter = 0;
                      pqp.adiciona(1);
                    },
                  ),
                  TextButton(
                    child:
                        Text('Tomorrow', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      selectedDay = DateTime.now().add(Duration(days: 1));
                      filter = 0;
                      pqp.adiciona(1);
                    },
                  ),
                  TextButton(
                    child: Text('Later', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      selectedDay = DateTime.now().add(Duration(days: 2));
                      filter = 1;
                      pqp.adiciona(1);
                    },
                  ),
                ],
              ),
            ),
            Calendar(),
          ],
        );
      },
    );
  }
}

class Calendar extends StatefulWidget with ChangeNotifier {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PutaQuePariu>(builder: (context, pqp, child) {
      return TextButton(
        child: Text('Calendar', style: TextStyle(color: Colors.white)),
        onPressed: () {
          pqp.adiciona(1);
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2035))
              .then((day) => setState(() {
                    selectedDay = day;
                    filter = 0;

                    pqp.adiciona(1);
                  }));
        },
      );
    });
  }
}

DateTime selectedDay = DateTime.now();
