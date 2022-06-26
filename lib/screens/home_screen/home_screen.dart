// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  Widget singleProducts(){
    return  Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
              height: 230,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      "https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png"
                      ), 
                  ), 
      //              body: Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   child: Image.network(
      //     "https://images.unsplash.com/photo-1547721064-da6cfb341d50?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      //     fit: BoxFit.cover,
      //   ),
      // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fresh Basil', 
                            style: TextStyle(
                              color: Colors.black, 
                              fontWeight: FontWeight.bold,
                           ),
                          ),
                          Text(
                            '50\$/50 gram', 
                            style: TextStyle(
                              color: Colors.grey, 
                              //fontWeight: FontWeight.bold,
                           ),
                          ),
                      
                        Row(
                          children: [
                            Expanded(
                             child: Container(
                              padding: EdgeInsets.only(left: 5),
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                color: Colors.grey,),
                                borderRadius: BorderRadius.circular(8),
                               ),
                                child:Row(
                                children: [
                                 Expanded(child: Text('50 Grams',style: TextStyle(fontSize: 10),)),
                                 Expanded(
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      color: Colors.yellow,
                                    ),
                                  )
                                ],
                              ),
                              ),
                             ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                               ),
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: ui.Color.fromARGB(255, 208, 194, 67),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color:  ui.Color.fromARGB(255, 208, 194, 67),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 15,
                                    color: ui.Color.fromARGB(255, 208, 194, 67),
                                  ),
                                ],
                               ),
                              ),
                            ),
                          ],
                        ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home',
        style: TextStyle(
          color: Colors.black,
          fontSize: 17
        ),),
        actions: [
         CircleAvatar(
          radius: 12,
          backgroundColor: Color.fromARGB(255, 228, 212, 151),
          child: Icon(Icons.search, size: 17, color: Colors.black),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 5),
           child: CircleAvatar(radius: 12,
           backgroundColor: Color.fromARGB(255, 228, 212, 151),
           child: Icon(Icons.shop,size: 17, color: Colors.black),
           ),
         ),
        ],
        backgroundColor: Color.fromARGB(255, 227, 190, 39),
      ),
   resizeToAvoidBottomInset: false,
   body: Padding(
     padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
     child: ListView(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://img.freepik.com/free-photo/organic-food-fruits-vegetables-beans-nuts-black-stone-background-top-view-free-space-your-text_187166-35365.jpg?w=2000"),
            ),
          ),

          // child: BackdropFilter(
          // filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          // child: Container(
          //   decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          // ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 130,bottom: 10),
                      child: Container(
                        height: 50,
                        width: 100,                  
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 238, 226, 115),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ) 
                         ),
                         child: Center(
                         child: Text(
                          "Vegie's",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            shadows: [
                              BoxShadow(
                                color: Color.fromARGB(255, 60, 221, 65),
                                blurRadius: 80,
                                offset: Offset(3,3)
                              )
                            ],
                          ),
                        ),
                       ),
                      ),
                    ),
                    Text(
                      '30% off',
                      style: TextStyle(
                        fontSize: 40,
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                color: Color.fromARGB(255, 39, 202, 44),
                                blurRadius: 30,
                                offset: Offset(3,3)
                              )
                            ], 
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.only(left: 20),
                       child: Text(
                        'On all grocery items available',
                        style: TextStyle(
                          //fontSize: 40,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold
                          ),
                        ),
                     ),
                  ],
                ),
              ),
            ),
          ],
         ),
        ),
      
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Herbs Seasonings"),
              Text(
                "View All",
                 style: TextStyle(color: Colors.grey),
                 ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fresh Fruits"),
              Text(
                "View All",
                 style: TextStyle(color: Colors.grey),
                 ),
            ],
          ),
        ),
           SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
              singleProducts(),
            ],
          ),
        ),
      ],
    ),
   ),
 );
}
}