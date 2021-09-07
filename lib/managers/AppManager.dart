import 'dart:async' show Future;
import 'package:exemplo_feed/models/user.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


   Future<String> _carregarJSON() async {
    return await rootBundle.loadString('lib/json/json_wakkefun.json');
  }

  Future<List<User>> carregarUsuario() async {

    String jsonString = await _carregarJSON();

    final jsonDecodificado = json.decode(jsonString);

    final users = <User>[];

    for (var usuario in jsonDecodificado) {
      final user = new User.fromJson(usuario);
      users.add(user);
    }
    return users;
  }

