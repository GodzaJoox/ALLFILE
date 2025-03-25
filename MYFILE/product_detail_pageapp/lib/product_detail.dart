import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var id = args['id'];
    var price = args['price'];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        foregroundColor: Colors.amber,
      ),
      body: myDispaly(context, id, price)
    );
  }
  Widget detail() => Container(
    margin: const EdgeInsets.all(20),
    child: const Text("หมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหมหมาเห่าได้ไหม")
  );

  Widget showPrice(int id,int price) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Item no. $id"),
      Text("Price: \$$price")
    ],),
    const Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.add_shopping_cart,color:Colors.green,size:36)
      ],
    )
    ],
    
  );

  Widget myDispaly(BuildContext context,int id,int price){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network('https://picsum.photos/id/${id*9}/1000',fit: BoxFit.cover),
          ),
          const SizedBox(height: 15),
          showPrice(id,price),
          
          const SizedBox(height: 15),
          detail()
        ],
      ),
    );
  }

  Widget myContainer(BuildContext context,int index){
    return Container(
        color:Colors.white,
        child:Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://picsum.photos/id/${index*9}/1000",
            fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            detail(),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.blue  
              ),  
              onPressed: (){
                Navigator.pop(context);
                }, 
              child: const Text(" << Back"))
          ],
        ),
        )
      );
  }
}
