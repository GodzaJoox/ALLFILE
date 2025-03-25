import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var Name = ["Chakhrit Asangkaruna","Veawan Paophang","Chaloemchai Philawut"];
  var NickName = ["Blue","Preaw","Bas"];
  var leadingIcon = [Icons.face_3,Icons.face_2,Icons.face_4];
  var details = [
    "\nHeight : 190 cm \nWeight : 60 kg\nFavorite : FootBall",
    "\nHeight : 150 cm \nWeight : 80 kg\nFavorite : PlayGame",
    "\nHeight : 200 cm \nWeight : 30 kg\nFavorite : Cosplay"
    ];

  final List<Map<String,dynamic>> data = [
    {
      'image':
          'https://scontent.fbkk22-4.fna.fbcdn.net/v/t39.30808-6/259962750_2347606918710140_9011689649393294612_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEl1G3k03mBupJVUpQEu_KlJzsT2HtDMN4nOxPYe0Mw3qFenj4McLqQzo7vJYrXJ-K1iGNXEsEI9govpY_ssuRP&_nc_ohc=DhQJmQ1LrtYQ7kNvgFn3EdG&_nc_oc=AdhufFfuhvbXm25KEbRc5zwR8pHFJwpwm58qKkdZomQvGi0pzsjj7nyVaSXYXRQDrxB_nUUgHPuyxDdOu5oo3kkU&_nc_zt=23&_nc_ht=scontent.fbkk22-4.fna&_nc_gid=A9dvIhhTpZ3PHaOcdVKd43g&oh=00_AYC2jGjQlos7Pouc5KWKGl0HDl-u-4Qt6zt-uGYv8qiplg&oe=67703B53',
      "name": 'Thanadol Singthuean',
      'nick': 'GodzaJoox',
      "height": '175 cm',
      "weight": '85 kg',
      'fav': 'ชอบเล่นเกมแบบหนักหน่วง'
    },
    {
      'image':
          'https://scontent.fbkk22-4.fna.fbcdn.net/v/t1.6435-9/165652503_1171522049956186_1841023122843357154_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFkmBci_c4Q8J2fqnFOzzIiKkYp7Vxu_esqRintXG7961Ch3ypYt3rRYPDOy2EXqYvEkBCRmqwv0MxCSVxTDbXZ&_nc_ohc=P8x6ehl1T1YQ7kNvgHiO_t6&_nc_oc=AdgFZ3gkkzNMIzXsceSoD519iu53PsiP6Adg8d2H52CMlPw49TaCFVio7sRN5PRIHZt7cf40qyX8L0ll0rOG0MCs&_nc_zt=23&_nc_ht=scontent.fbkk22-4.fna&_nc_gid=ArQ1jhRSx_9ojaQ83bUnJeg&oh=00_AYA5E-LFAtCy2NSEfT-6Rmp649Q5Ar0KffU53Xv8Ztl0mg&oe=679238C9',
      "name": 'Peerapat Kaewthani',
      'nick': 'Folk',
      "height": '178 cm',
      "weight": '70 kg',
      'fav': 'ชอบหมา'
    },
    {
      'image':
          'https://scontent.fbkk22-6.fna.fbcdn.net/v/t1.6435-9/64326156_588925988604856_4152992006659899392_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeH3zOTNp2-9N32TDyopjkrljd78orpmTGGN3vyiumZMYQsF3ptL58mrrFUTkTXXb_ZDsK4yD8mrtsQ8Bkd3Vs92&_nc_ohc=38haUWaiJqUQ7kNvgHQznzy&_nc_oc=AdgiVqSgEpSslRpuoavaCc5Z2YL9ePMoGhJu0F9nyr1CHbDESr56zrYICSWEMF89kwD0i4-zv9U-XZ5Xk05riyVI&_nc_zt=23&_nc_ht=scontent.fbkk22-6.fna&_nc_gid=AG9vNqFDjGkaeqEGBWUstik&oh=00_AYAOMSlyy_QYac-R2Efz6bB25DES8G7ABx9Cb0r2r3GA4g&oe=67924966',
      "name": 'Chakhrit Asangkaruna ',
      'nick': 'Blue ',
      "height": '170 cm',
      "weight": '55 kg',
      'fav': 'ชอบหอมเเก้วตัวเอง'
    },
    {
      'image':
          'https://scontent.fbkk22-3.fna.fbcdn.net/v/t1.6435-9/67613550_917532261928065_4865885758080155648_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5bbf69&_nc_eui2=AeHOMSqE0mBxEJYAdvLvA52dSVuaYFAlG9ZJW5pgUCUb1gn8C-fVRiSOpe2L1N6tKUzNGZdVQlOut3jzw3PSy9uN&_nc_ohc=S8vbFYWwzjsQ7kNvgFERpwK&_nc_oc=Adjni0HqGUNosQ1_t0ucbDTTANeNx1K_xMPA9Et-Ivyn2GeN2qGStypKPY17o9WnPdVeaGwF5f9QqTK72P_SfTNK&_nc_zt=23&_nc_ht=scontent.fbkk22-3.fna&_nc_gid=Au3-dgsk_tk3botsLMqNwW7&oh=00_AYCalGu7H6RjDkU8eBrc9K2REg04jG0dDClyWQX5-IlLWA&oe=67926023',
      "name": 'Nonkit Seakhow',
      'nick': 'Tee',
      "height": '182 cm',
      "weight": '97 kg',
      'fav': 'ชอบยกล้อ'
    },
    {
      'image':
          'https://scontent.fbkk22-3.fna.fbcdn.net/v/t1.6435-9/72781755_1163455674044634_3417416640323649536_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFUjEu54RU5IKui5_1MMW-kmap_SaOrU-OZqn9Jo6tT4_HH5ZoCYaqcdeDXepaq6A-EuHbh6s93T2UtDee_LZjg&_nc_ohc=Nw0E-UwrOgcQ7kNvgHIT93Y&_nc_oc=Adg87xbDEwldr1LlVsNCStuK0dO208WlIzqtoYVsCZIFUQR310TPJqXbDMr6IfZA1omzYKafpWHgvAeuZsUAgF8w&_nc_zt=23&_nc_ht=scontent.fbkk22-3.fna&_nc_gid=AMPwOtNRXLr-pAdIsV54Tyu&oh=00_AYCIHoNO5QYnP6NtYWrleIwtreLgFjTmJfqyTPBqZ6oFkA&oe=679258B2',
      "name": 'Chaloemchai Philawut',
      'nick': 'Bus',
      "height": '155 cm',
      "weight": '40 kg',
      'fav': 'ชอบเเอ็ค'
    },
    {
      'image':
          'https://scontent.fbkk22-6.fna.fbcdn.net/v/t39.30808-6/325458920_1178386672802294_2296933109312767397_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeF6Eh1cdnnyIEOoaymd2OFaN8ZaXIrgKdk3xlpciuAp2aNGEpoWsSMzdlq5YPd0R1nVftdTG7UZ4eIh_hqehvBW&_nc_ohc=V3r63nqCNoYQ7kNvgH2GW7y&_nc_oc=AdhtpP43xyld-fHsfgXKMInSCm9TZwk7aIt_1Tum8GmcE7WqQthfzkEVaXCxIBqTBVE-4ltHL3i1Cuni3qOVleyr&_nc_zt=23&_nc_ht=scontent.fbkk22-6.fna&_nc_gid=AI_NP6QnMOrXbAqKqJue5sR&oh=00_AYBFPVLBoe2tO89X2T0uQVeoJAVjfi33ZUoAltq1RXBVzg&oe=6770CB66',
      "name": 'Pawat',
      'nick': 'Pao',
      "height": '199 cm',
      "weight": '83.5 kg',
      'fav': 'ชอบเล่นดนตรี'
    }
  ];
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: myGrid(context)
    );
  }
  
Widget myGrid(BuildContext context){
    return GridView.builder(
      itemCount: 6,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, 
        childAspectRatio: 3/4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5), 
      itemBuilder: (context,index)=>ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: buildTile(context, data[index]),
      ));
    }
  Widget buildTile(BuildContext context, Map<String, dynamic> data) => GridTile(
      footer: GridTileBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text('Name : ${data['name']}'),
        subtitle: Text('Nickname : ${data['nick']}'),
        trailing: InkWell(
          child: const Icon(
            Icons.zoom_in,
            size: 32,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onTap: () => {
            Navigator.pushNamed(context, '/friend_dt', arguments: data)
          },
        ),
      ),
      child: Image.network(
        data['image'],
        fit: BoxFit.cover,
      ));
}
