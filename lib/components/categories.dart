import 'dart:core';

import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final Function(String) onTabChanged;
  const Categories({super.key, required this.onTabChanged});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  double fontSize = 25.0;
  double faceFont = 30.0;
  double bodyFont = 25.0;
  double hairFont = 25.0;
  double giftsFont = 25.0;
  String activeTab = 'Face';
  Color faceunderlineColor = Colors.black;
  Color bodyunderlineColor = Colors.grey[300]!;
  Color hairunderlineColor = Colors.grey[300]!;
  Color giftsunderlineColor = Colors.grey[300]!;
  Color facefontColor = Colors.black;
  Color bodyfontColor = Colors.grey[600]!;
  Color hairfontColor = Colors.grey[600]!;
  Color giftsfontColor = Colors.grey[600]!;
  FontWeight facefontWeight = FontWeight.w500;
  FontWeight bodyfontWeight = FontWeight.w300;
  FontWeight hairfontWeight = FontWeight.w300;  
  FontWeight giftsfontWeight = FontWeight.w300;
  final ScrollController _scrollController = ScrollController();

  void textChange(){
    setState(() {
      if(activeTab == 'Face'){
        faceFont = 30;
        hairFont = 25;
        bodyFont = 25;
        giftsFont = 25;
        faceunderlineColor = Colors.black;
        bodyunderlineColor = Colors.grey[300]!;
        hairunderlineColor = Colors.grey[300]!;
        giftsunderlineColor = Colors.grey[300]!;
        facefontColor = Colors.black;
        bodyfontColor = Colors.grey[600]!;
        hairfontColor = Colors.grey[600]!;
        giftsfontColor = Colors.grey[600]!;
        facefontWeight = FontWeight.w500;
        bodyfontWeight = FontWeight.w300;
        hairfontWeight = FontWeight.w300;  
        giftsfontWeight = FontWeight.w300;        
        _scrollController.animateTo(0.0, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);        
      }
      if(activeTab == 'Body'){
        faceFont = 25;
        hairFont = 25;
        bodyFont = 30;
        giftsFont = 25;
        faceunderlineColor = Colors.grey[300]!;
        bodyunderlineColor = Colors.black;
        hairunderlineColor = Colors.grey[300]!;
        giftsunderlineColor = Colors.grey[300]!;
        facefontColor = Colors.grey[600]!;
        bodyfontColor = Colors.black;
        hairfontColor = Colors.grey[600]!;
        giftsfontColor = Colors.grey[600]!;
        facefontWeight = FontWeight.w300;
        bodyfontWeight = FontWeight.w500;
        hairfontWeight = FontWeight.w300;  
        giftsfontWeight = FontWeight.w300;                
      }      
      if(activeTab == 'Hair'){
        faceFont = 25;
        hairFont = 30;
        bodyFont = 25;
        giftsFont = 25;
        faceunderlineColor = Colors.grey[300]!;
        bodyunderlineColor = Colors.grey[300]!;
        hairunderlineColor = Colors.black;
        giftsunderlineColor = Colors.grey[300]!;
        facefontColor = Colors.grey[600]!;
        bodyfontColor = Colors.grey[600]!;
        hairfontColor = Colors.black;
        giftsfontColor = Colors.grey[600]!;
        facefontWeight = FontWeight.w300;
        bodyfontWeight = FontWeight.w300;
        hairfontWeight = FontWeight.w500;  
        giftsfontWeight = FontWeight.w300;        
      }  
      if(activeTab == 'Gifts'){
        faceFont = 25;
        hairFont = 25;
        bodyFont = 25;
        giftsFont = 30;
        faceunderlineColor = Colors.grey[300]!;
        bodyunderlineColor = Colors.grey[300]!;
        hairunderlineColor = Colors.grey[300]!;
        giftsunderlineColor = Colors.black;
        facefontColor = Colors.grey[600]!;
        bodyfontColor = Colors.grey[600]!;
        hairfontColor = Colors.grey[600]!;
        giftsfontColor = Colors.black;
        facefontWeight = FontWeight.w300;
        bodyfontWeight = FontWeight.w300;
        hairfontWeight = FontWeight.w300;  
        giftsfontWeight = FontWeight.w500;    
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);    
      }      
      widget.onTabChanged(activeTab);
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector( //Face
                    onTap: (){
                      setState(() {
                        activeTab = 'Face';
                        textChange();
                      });
                    },
                    child: Container(  
                      height: 50,
                      width: 100,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Text('Face', style: TextStyle(fontSize: faceFont, fontWeight: facefontWeight, color: facefontColor),),
                          Container(
                            height: 3,
                            width: 70,
                            color: faceunderlineColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector( //Body
                    onTap: (){
                      setState(() {
                        activeTab = 'Body';
                        textChange();
                      });
                    },
                    child: Container(  
                      height: 50,
                      width: 100,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Text('Body', style: TextStyle(fontSize: bodyFont, fontWeight: bodyfontWeight, color: bodyfontColor),),
                          Container(
                            height: 3,
                            width: 70,
                            color: bodyunderlineColor,
                          )
                        ],
                      ),
                    ),
                  ), 
                  GestureDetector( //Hair
                    onTap: (){
                      setState(() {
                        activeTab = 'Hair';
                        textChange();
                      });
                    },
                    child: Container(  
                      height: 50,
                      width: 100,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Text('Hair', style: TextStyle(fontSize: hairFont, fontWeight: hairfontWeight, color: hairfontColor),),
                          Container(
                            height: 3,
                            width: 70,
                            color: hairunderlineColor,
                          )
                        ],
                      ),
                    ),
                  ),  
                  GestureDetector( //Gifts
                    onTap: (){
                      setState(() {
                        activeTab = 'Gifts';
                        textChange();
                      });
                    },
                    child: Container(  
                      height: 50,
                      width: 100,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Text('Gifts', style: TextStyle(fontSize: giftsFont, fontWeight: giftsfontWeight, color: giftsfontColor),),
                          Container(
                            height: 3,
                            width: 70,
                            color: giftsunderlineColor,
                          )
                        ],
                      ),
                    ),
                  ),                                             
                ],
              ),
            );
  }
}