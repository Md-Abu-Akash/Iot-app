

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'blockpage.dart';
import 'flatpage.dart';
import 'innerShadow.dart';

void main() {

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool all=false;
  bool land=false;
  bool podium=false;
  final outerShadow=BoxDecoration(
    color:Colors.grey.shade300,
    borderRadius: BorderRadius.circular(50),
    boxShadow:[
      BoxShadow(
        color: Colors.grey.shade500,
        offset: Offset(4,4),
        blurRadius: 15,
        spreadRadius: -1,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(-4,-4),
        blurRadius: 15,
        spreadRadius: -1,
      )
    ],
  );
  final innerShadow = ConcaveDecoration(
    shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(50) ,
    ),
    colors: [Colors.grey.shade500,Colors.white],
    depression: 10,
  );
  void sendData(massage){
    var client = http.Client();
    try {
      Uri url1 = Uri.http('192.168.0.110:5000',massage);
      Uri url2 = Uri.http('192.168.0.101:5000',massage);
      client.get(url1);
      client.get(url2);
    }
    finally{
      client.close();

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(vertical:60.0, horizontal: 120.0),
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade300,
        child: Row(

          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: (){
                       Navigator.push(context,
                          MaterialPageRoute(builder: (context) => blockpage()));
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.apartment,size: 100,color:Colors.black45),
                          Text('Blocks',style: TextStyle(fontSize: 30,color:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 200),
                      height: 200,
                      decoration:outerShadow,
                    ),
                  ),

                  SizedBox(width: 200, height:20,),

                  GestureDetector(
                    onTap: (){
                      sendData('all');
                      setState(() {
                        all=!all;
                      });
                      if(all==true){
                        sendData('allOn');
                      }else{
                        sendData('allOff');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.select_all,size: 100,color:all? Colors.lightBlueAccent:Colors.black45),
                          Text('All',style: TextStyle(fontSize: 30,color:all? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration:all?innerShadow:outerShadow,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 50, height: 100,),

            Expanded(
              child: Container(
                padding:EdgeInsets.symmetric(vertical:110.0,) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          podium=!podium;
                        });
                        if(podium==true){
                          sendData('podiumOn');
                        }else{
                          sendData('podiumOff');}

                      },
                      child: AnimatedContainer(
                        child:Column(
                          children: [
                            SizedBox(height: 20,),
                            Icon(Icons.add_road_outlined,size: 100,color:podium? Colors.lightBlueAccent:Colors.black45),
                            Text('Podium',style: TextStyle(fontSize: 30,color:podium? Colors.lightBlueAccent:Colors.black45)),
                          ],
                        ),
                        duration:const Duration(milliseconds: 50),
                        height: 200,
                        decoration: podium?innerShadow:outerShadow,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 50, height: 100,),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => flatpage()));
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.home_outlined,size: 100,color:Colors.black45),
                          Text('Flat',style: TextStyle(fontSize: 30,color:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 200),
                      height: 200,
                      decoration: BoxDecoration(
                        color:Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(4,4),
                            blurRadius: 15,
                            spreadRadius: -1,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4,-4),
                            blurRadius: 15,
                            spreadRadius: -1,
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 200, height: 20,),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        land=!land;
                      });
                      if(land==true){
                        sendData('landOn');
                      }else{
                        sendData('landOff');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.landscape_outlined,size: 100,color:land? Colors.lightBlueAccent:Colors.black45),
                          Text('Landscape',style: TextStyle(fontSize: 30,color:land? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds:50),
                      height: 200,
                      decoration: land?innerShadow:outerShadow,
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),

      ),
      floatingActionButton: Container(width:150,height: 200,
        child: Image(image: AssetImage("images/LagunaLogo.png"),),alignment: Alignment(1,1),),

    );
  }
}