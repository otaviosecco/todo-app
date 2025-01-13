import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'config.dart';
import 'package:http/http.dart';
import 'package:todoapp/classes/task.dart';

class PutaQuePariu extends ChangeNotifier {
  var pffunciona = 0;

  PutaQuePariu(this.pffunciona);

  void adiciona(pffunciona) {
    pffunciona += 1;
    notifyListeners();
  }
}

class Operations extends ChangeNotifier {
  Future<List<Task>> request(date, filter) async {
    try {
      final Response response =
          await client.get(Uri.parse('$baseUrl?date=$date&filter=$filter'));
      final List<dynamic> decodedJson = jsonDecode(response.body);

      print(decodedJson.map((dynamic json) => Task.fromJson(json)).toList());
      final resposta =
          decodedJson.map((dynamic json) => Task.fromJson(json)).toList();
      return resposta;
    } on SocketException {
      return <Task>[];
    }
  }

  void update(id, boleia) async {
    boleia = boleia.toString();
    await client.put(Uri.parse('$baseUrl/$id'), body: {'completed': boleia});
  }

  void delete(id) async {
    await client.delete(Uri.parse('$baseUrl/$id'));
    notifyListeners();
    print('$id' ' Ripado');
  }

  void post(name, category, date) async {
    await client.post(
      Uri.parse(baseUrl),
      body: {
        'name': name.toString(),
        'date': date.toString(),
        'category': category.toString(),
        'completed': 'false',
      },
    );
  }
}
