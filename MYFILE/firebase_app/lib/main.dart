import 'package:firebase_app/service/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Database db = Database.instance;
  Future<List>? productList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),),
      body: FutureBuilder<List>(
          future: db.getAllData(), 
          builder: (context,snapshots){
            if(snapshots.hasData){
              return ListView.builder(
                itemCount: snapshots.data!.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Text(snapshots.data![index].name),
                    trailing: Text(snapshots.data![index].price),
                  );
                },
                );
              }
              return const Center(child: CircularProgressIndicator(),);
            }
        )
      );
  }
}