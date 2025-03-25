import 'package:api_exam_app/model/user.dart';
import 'package:api_exam_app/service/user_api.dart';
import 'package:flutter/material.dart';

  class HomeScreen extends StatefulWidget {
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
  }

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await UserApi.fetchUsers();
      setState(() {
        users = response;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  void showUserDialog(User user) {
    String title = "${user.name.first} ${user.name.last}";
    if (user.gender == 'male') {
      title = "Mr.$title";
    } else if (user.gender == 'female') {
      title = "Mrs.$title";
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                  user.picture,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 10),
              Text("e-Mail : ${user.email}"),
              Text("Nationality : ${user.nationality}"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API Call"),
      ),
      body: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                String title = "${user.name.first} ${user.name.last}";
                if (user.gender == 'male') {
                  title = "Mr.$title";
                } else if (user.gender == 'female') {
                  title = "Mrs.$title";
                }
                return ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      user.picture,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(title),
                  subtitle: Text(user.phone),
                  trailing: IconButton(
                    icon: Icon(
                      user.gender == 'male'
                      ? Icons.wysiwyg_rounded
                      : Icons.yard_outlined
                    ),
                    color: user.gender == 'male' 
                    ? Colors.blue 
                    : Colors.pink,
                    onPressed: () { 
                      showUserDialog(user);
                     },
                  ),
                );
              },
            ),
    );
  }
}
