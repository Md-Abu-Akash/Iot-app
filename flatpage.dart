import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'innerShadow.dart';

class flatpage extends StatefulWidget {
  @override
  _flatpageState createState() => _flatpageState();
}

class _flatpageState extends State<flatpage> {
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
  bool bhk1=false;
  bool bhk2=false;
  bool bhk3=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined),color:Colors.black87 ,
          onPressed:() => Navigator.of(context).pop() ,),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 150.0, horizontal: 100.0),
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        bhk1=!bhk1;
                      });
                      if(bhk1==true){
                        sendData('bhk1On');
                      }else{
                        sendData('bhk1Off');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.bed,size: 100,color:bhk1? Colors.lightBlueAccent:Colors.black45),
                          Text('1 BHK',style: TextStyle(fontSize: 30,color:bhk1? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration: bhk1?innerShadow:outerShadow,
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(width: 100, height: 100,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        bhk2=!bhk2;
                      });
                      if(bhk2==true){
                        sendData('bhk2On');
                      }else{
                        sendData('bhk2Off');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.bed,size: 100,color:bhk2? Colors.lightBlueAccent:Colors.black45),
                          Text('2 BHK',style: TextStyle(fontSize: 30,color:bhk2? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration: bhk2?innerShadow:outerShadow,
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(width: 100, height: 50,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        bhk3=!bhk3;
                      });
                      if(bhk3==true){
                        sendData('bhk3On');
                      }else{
                        sendData('bhk3Off');}

                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.bed,size: 100,color:bhk3? Colors.lightBlueAccent:Colors.black45),
                          Text('3 BHK',style: TextStyle(fontSize: 30,color:bhk3? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration: bhk3?innerShadow:outerShadow,
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
  }}