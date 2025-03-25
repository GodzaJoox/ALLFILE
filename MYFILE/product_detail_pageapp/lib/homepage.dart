import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var rnd = Random();
    
    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        foregroundColor: Colors.amber,
      ),
      body: myGrid(context)
    );
  }

  Widget myContainer(BuildContext context){
    return Container(
        color: Colors.green,
        width: 350,
        height: 500,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://picsum.photos/id/200/300",
              fit:BoxFit.cover
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.blue
              ),
              onPressed: (){
                Navigator.pushNamed(context, "/ptd_dt",arguments:{'url':'https://picsum.photos/id/200/300'});
              }, 
              child: const Text(" Detail "))
          ],
        ),
      );
  }


  Widget myGrid(BuildContext context){
    return GridView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, 
        childAspectRatio: 3/4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5), 
      itemBuilder: (context,index)=>ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: buildTile(context,(index+1),(Random().nextInt(200)+50)),
      ));
    }
  Widget buildTile(BuildContext context,int index,int price) => GridTile(
    footer: GridTileBar(
      backgroundColor: Colors.black,
      title: Text("Item no : $index"),
      subtitle: Text("Price : $price"),
      trailing: InkWell(
        child: const Icon(Icons.zoom_in,size: 32,color: Colors.amberAccent,),
        onTap: () => {
          Navigator.pushNamed(context, '/ptd_dt',arguments: {"id":index,"price":price})
        },
      ),
    ),
    child: Image.network("https://picsum.photos/id/${index*9}/1000",fit: BoxFit.cover,));
}