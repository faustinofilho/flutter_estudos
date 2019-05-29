import 'dart:convert';

import 'package:flutter_estudos/domain/response.dart';
import 'package:http/http.dart' as http;

class LoginService {

  static Future<Response> login(String login, String senha) async
  {
    
//    final response = await http.post(
//        'http://livrowebservices.com.br/rest/login',
//        body: {
//          'login': login,
//          'senha': senha
//        })
//        .then((response) {
////              print("status code ${response.statusCode}");
////              print("Body code ${response.body}");
//    //      print('Response status: ${response}');
//    //      print('Response body: ${response.body}');
//        });

    final response = await http.post(
        'http://livrowebservices.com.br/rest/login',
        body: {
          'login': login,
          'senha': senha
        });

    final s = response.body;

    print(s);

    final r = Response.fromJson(json.decode(s));


    return r;
  }

}