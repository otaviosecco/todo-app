import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/http/operations.dart';

DateTime dateTime;
TextEditingController _date = TextEditingController();

class AddTask extends StatelessWidget with ChangeNotifier {
  final TextEditingController _categoryController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  TextEditingController _date = TextEditingController();
  final Operations operations = new Operations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _nameController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(labelText: 'Nome'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _categoryController,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(labelText: 'Categoria'),
              ),
            ),
            FuncionaPorra(),
            TextButton.icon(
              icon: Icon(
                Icons.add_box_sharp,
                color: Colors.white,
              ),
              label: Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                final String name = _nameController.text.toString();
                final String category = _categoryController.text.toString();
                final String date = _date.text.toString();
                showDialog(
                  context: context,
                  builder: (contextDialog) {
                    return Consumer<PutaQuePariu>(
                      builder: (context, pqp, child) {
                        return AlertDialog(
                          title: Text('Confirmar?'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Nao'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text('Sim'),
                              onPressed: () {
                                operations.post(name, category, date);
                                Navigator.pop(context);
                                Navigator.pop(context);
                                pqp.adiciona(1);
                                notifyListeners();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class FuncionaPorra extends StatefulWidget {
  @override
  _FuncionaPorraState createState() => _FuncionaPorraState();
}

class _FuncionaPorraState extends State<FuncionaPorra> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
            child: Text(dateTime == null
                ? 'Noithing has been picked yet'
                : dateTime.toString()),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2035),
              ).then((data) => setState(() {
                    dateTime = data;
                  }));
            }),
      ],
    );
  }
}
