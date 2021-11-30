import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  Future<List<Task>> request(date) async {
    final Response response = await client.get('$baseUrl?date=$date');

    final List<dynamic> decodedJson = jsonDecode(response.body);
    print('Printou no request');
    print(decodedJson.map((dynamic json) => Task.fromJson(json)).toList());
    final resposta =
        decodedJson.map((dynamic json) => Task.fromJson(json)).toList();
    return resposta;
  }

  void update(id, boleia) async {
    boleia = boleia.toString();
    await client.put('$baseUrl/$id', body: {'completed': boleia});
  }

  void delete(id) async {
    await client.delete('$baseUrl/$id');
    notifyListeners();
    print('$id' ' Ripado');
  }

  void post(name, category, date) async {
    await client.post(
      baseUrl,
      body: {
        'name': name.toString(),
        'date': date.toString(),
        'category': category.toString(),
        'completed': 'false',
      },
    );
  }
}
