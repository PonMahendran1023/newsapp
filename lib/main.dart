import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'news1.dart';
import 'news2.dart';
import 'news3.dart';
void main(){
  runApp(Bottom());
}
class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bottom2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Bottom2 extends StatefulWidget {
  const Bottom2({super.key});

  @override
  State<Bottom2> createState() => _Bottom2State();
}

class _Bottom2State extends State<Bottom2> {
  int _Youindex=0;
  final List<Widget>_page=[
    Myapi(),
    Myapi1(),
    Myapi2(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('News',style:GoogleFonts.aclonica(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.cast_connected_outlined,color: Colors.black,)),
          IconButton(onPressed: (){}, icon:Icon(Icons.notification_add,color: Colors.black,)),
          IconButton(onPressed: (){}, icon:Icon(Icons.search,color: Colors.black,)),
          IconButton(onPressed: (){}, icon:Icon(Icons.menu,color: Colors.black,)),
          CircleAvatar(
            backgroundImage: AssetImage('../asset/a.jpeg'),

          ),

        ],
        leading: CircleAvatar(
          backgroundImage: AssetImage('../image/2b.jpeg'),
        ),
      ),
      body: _page[_Youindex],
      bottomNavigationBar:BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        fixedColor: Colors.black,
        currentIndex: _Youindex,
        onTap: (mahi){
          setState(() {
            _Youindex=mahi;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.apple,color: Colors.black,),
            label:'Apple\nNEWS',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.car_repair,color: Colors.black,),
            label: 'Tesla \nNEWS',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.add_a_photo_outlined,color: Colors.black,),
            label: 'business\nheadlines',
          )
        ],
      ),

    );
  }
}



