import 'dart:convert';
import 'package:api_exam_app/model/user.dart';
import 'package:api_exam_app/model/user_name.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final results = json['results'] as List<dynamic>;

      final users = results.map<User>((person) {
        final name = UserName(
          title: person['name']['title'], 
          first: person['name']['first'],
          last: person['name']['last'],
        );
        return User(
          cell: person['cell'],
          gender: person['gender'],
          picture: person['picture']['thumbnail'],
          name: name,
          email: person['email'],
          phone: person['phone'],
          nationality: person['nat'], 
        );
      }).toList();

      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
