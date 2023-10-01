import'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main (){
  runApp(Myapi());
}
class Myapi extends StatelessWidget {
  const Myapi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api list',
      home: Api2(),
    );
  }
}
class Api2 extends StatefulWidget {
  Api2();

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {
  List<Team>teams=[];
  bool isloading=true;
  _Api2State(){
    getTeams();
  }
  Future<void>getTeams()async{
    try{
      var response=await http.get(Uri.parse("https://newsapi.org/v2/everything?q=apple&from=2023-09-07&to=2023-09-07&sortBy=popularity&apiKey=fe93e72e44b844dcb1fd66328fd4d8cd"));
      if(response.statusCode==200){
        var jsonData=jsonDecode(response.body);
        for(var eachteam in jsonData['articles']){
          final team=Team(
            description: eachteam['description'],
            urlToImage: eachteam['urlToImage'],
              content: eachteam['content']
          );
          teams.add(team);
        }
      } else{
      }
    }catch(error){

    } finally{
      setState(() {
        isloading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Apple Updates'),
        ),
        body:isloading
            ?Center(
          child: CircularProgressIndicator(),
        )
            :teams.isEmpty
            ?Center(
          child: Text('no teams availabel'),
        )
            :ListView.builder(
            itemCount: teams.length,
            itemBuilder:(context,index){
              final team=teams[index];
              return Container(
                child: Row(
                  children: [
                    Container(
                      child: Image.network ('${team.urlToImage}',width: 400,),
                    ),
                   Container(
                     width:800,
                     child:Column(
                       children: [
                         Text('Description:${team.description}'),
                         Text('content:  ${team.content}')
                       ],
                     )
                   )

                  ],
                ),
              );

            }
            )
    );
  }
}

class Team{
  final String description;
  final String urlToImage;
  final String content;
  Team({
    required this.description,
    required this.urlToImage,
    required this.content
  });
}