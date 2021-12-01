import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/classes/task.dart';
import 'package:todoapp/http/operations.dart';
import 'emptyList.dart';
import 'package:intl/intl.dart';

import 'headerDays.dart';

Widget bodyBuilder(BuildContext context, DateTime funciona) {
  Operations operations = new Operations();
  return Consumer<PutaQuePariu>(builder: (context, pqp, child) {
    return Expanded(
      child: FutureBuilder<List<Task>>(
        initialData: List(),
        future: operations.request(selectedDay.toIso8601String(), filter),
        // future: operations.request(DateTime.now().toIso8601String()),
        builder: (context, snapshot) {
          if (snapshot.data.isEmpty) {
            return EmptyList();
          } else {
            final List<Task> task = snapshot.data;
            return ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: IconButton(
                      color:
                          task[index].completed ? Colors.yellow : Colors.black,
                      icon: Icon(Icons.star),
                      onPressed: () {
                        operations.update(
                            task[index].id, !task[index].completed);
                        pqp.adiciona(1);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        operations.delete(task[index].id);
                        pqp.adiciona(1);
                      },
                    ),
                    title: Text(
                      task[index].category.toString(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      task[index].name +
                          '\n' +
                          DateFormat.yMEd().format(task[index].date),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  });
}
