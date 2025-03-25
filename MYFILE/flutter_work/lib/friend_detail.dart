import 'package:flutter/material.dart';

class FriendDetail extends StatelessWidget {
  const FriendDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: myDispaly(context,args)
    );
  }

  Widget detail(String details) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: 'Height: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '${details.split('\n')[0].split(': ')[1]}\n',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'Weight: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '${details.split('\n')[1].split(': ')[1]}\n',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextSpan(
          text: 'Favorite: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: '${details.split('\n')[2].split(': ')[1]}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

  Widget myDispaly(BuildContext context, Map<String, dynamic> data){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: (Image.network(
              data['image'],
              fit: BoxFit.cover,
            )),
          ),
          const SizedBox(height: 15),
          showFriend(context, data),
          detail('Height: ${data['height']}\nWeight: ${data['weight']}\nFavorite: ${data['fav']}')
        ],
      ),
    );
  }
  Widget showFriend(BuildContext context, Map<String, dynamic> data) =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name : ${data['name']}',
              style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
            Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'NickName : ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '${data['nick']}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        ],
      ),
    ],
  );
}