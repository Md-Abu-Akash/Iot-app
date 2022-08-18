import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'innerShadow.dart';

class blockpage extends StatefulWidget {
  @override
  _blockpageState createState() => _blockpageState();
}

  class _blockpageState extends State<blockpage> {
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
    bool allBlock=false;
    bool block1=false;
    bool block2=false;
    bool block3=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(toolbarHeight: 30,
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined),color:Colors.black87 ,
          onPressed:() => Navigator.of(context).pop() ,),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 65.0, horizontal: 200.0),
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
                       allBlock=!allBlock;
                     });
                     if(allBlock==true){
                       sendData('allBlockOn');
                     }else{
                       sendData('allBlockOff');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.apartment,size: 100,color:allBlock? Colors.lightBlueAccent:Colors.black45),
                          Text('All Blocks',style: TextStyle(fontSize: 30,color:allBlock? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration: allBlock?innerShadow:outerShadow,
                    ),
                  ),

                  SizedBox(width: 200, height: 20,),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        block2=!block2;
                      });
                      if(block2==true){
                        sendData('block2On');
                      }else{
                        sendData('block2Off');}

                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.apartment,size: 100,color:block2? Colors.lightBlueAccent:Colors.black45),
                          Text('Block 2',style: TextStyle(fontSize: 30,color:block2? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration: block2?innerShadow:outerShadow,
                    ),
                  ),


                ],
              ),
            ),

            SizedBox(width: 150, height: 100,),

            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       GestureDetector(
            //         child: Container(
            //           height: 200,
            //           width: 200,
            //           decoration: BoxDecoration(
            //               color: Colors.grey.shade300,
            //               borderRadius: BorderRadius.circular(50),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade500,
            //                   offset: Offset(4,4),
            //                   blurRadius: 15,
            //                   spreadRadius: 1,
            //                 ),
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(-4,-4),
            //                   blurRadius: 15,
            //                   spreadRadius: 1,
            //                 )
            //               ]
            //
            //
            //           ),
            //         ),
            //       ),
            //
            //       SizedBox(width: 200, height: 50,),
            //
            //       GestureDetector(
            //         child: Container(
            //           height: 200,
            //           width: 200,
            //           decoration: BoxDecoration(
            //               color: Colors.grey.shade300,
            //               borderRadius: BorderRadius.circular(50),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade500,
            //                   offset: Offset(4,4),
            //                   blurRadius: 15,
            //                   spreadRadius: 1,
            //                 ),
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(-4,-4),
            //                   blurRadius: 15,
            //                   spreadRadius: 1,
            //                 )
            //               ]
            //
            //
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        block1=!block1;
                      });
                      if(block1==true){
                        sendData('block1On');
                      }else{
                        sendData('block1Off');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.apartment,size: 100,color:block1? Colors.lightBlueAccent:Colors.black45),
                          Text('Block 1',style: TextStyle(fontSize: 30,color:block1? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration:block1?innerShadow:outerShadow,
                    ),
                  ),

                  SizedBox(width: 200, height: 20,),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        block3=!block3;
                      });
                      if(block3==true){
                        sendData('block3On');
                      }else{
                        sendData('block3Off');}
                    },
                    child: AnimatedContainer(
                      child:Column(
                        children: [
                          SizedBox(height: 20,),
                          Icon(Icons.apartment,size: 100,color:block3? Colors.lightBlueAccent:Colors.black45),
                          Text('Block 3',style: TextStyle(fontSize: 30,color:block3? Colors.lightBlueAccent:Colors.black45)),
                        ],
                      ),
                      duration:const Duration(milliseconds: 50),
                      height: 200,
                      decoration:block3?innerShadow:outerShadow,
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