import 'package:beauty_shop/components/categories.dart';
import 'package:beauty_shop/components/popular_card.dart';
import 'package:beauty_shop/components/productcard.dart';
import 'package:beauty_shop/pages/cart_page.dart';
import 'package:beauty_shop/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:beauty_shop/components/productslist.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int productType = face.length;
  List productList = face;
  String activeTab = 'Face';
  
  void onTabChanged(String newTab){
    setState(() {
      activeTab = newTab;
      if (newTab == 'Face') {
        productType = face.length;
        productList = face;
      } else if (newTab == 'Body') {
        productType = body.length;
        productList = body;
      } else if (newTab == 'Hair') {
        productType = hair.length;
        productList = hair;
      } else {
        productType = gifts.length; // This is for the 'Gifts' category or any other
        productList = gifts;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(    //profile button
                  onTap: (){},
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('lib/images/prof.jpg'), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchPage()));
                }, icon: const Icon(Icons.search_outlined, color: Colors.black, size: 30,)),//search button
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
                }, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 30,))//Cart button
              ],
            ),//Top row
            const SizedBox(height: 20,),
            Categories(onTabChanged: onTabChanged,),
            const SizedBox(height: 20,),
            SizedBox( //Products
              height: 350,
              child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: productList.length, itemBuilder: (context, index){
                final List<Map<String, dynamic>> productList;
                if (activeTab == 'Face') {
                  productList = face;
                } else if (activeTab == 'Body') {
                  productList = body;
                } else if (activeTab == 'Hair') {
                  productList = hair;
                } else {
                  productList = gifts;
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Productcard(
                    productName: productList[index]['name'],
                    productDescription: productList[index]['description'],
                    productPrice: productList[index]['price'.toString()],
                  ),
                );
              },),
            ),
            const SizedBox(height: 10,),
            const Text('Popular', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black),), //Popular Text
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(itemCount: popular.length, itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Popularcard(
                    name: popular[index]['name'], 
                    description: popular[index]['description'], 
                    price: popular[index]['price'.toString()]),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}