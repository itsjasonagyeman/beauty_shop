import 'package:beauty_shop/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:beauty_shop/components/productslist.dart';
import 'package:provider/provider.dart';
import 'package:beauty_shop/components/cart_provider.dart'; // Import your CartProvider here


class Addtocart extends StatefulWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  const Addtocart({super.key, required this.productName, required this.productPrice, required this.productDescription});
  
  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {


  
  int activePage = 0;

  final PageController pageController = PageController(initialPage: 0);
  int quantity = 0;


  void quantityAdd(){
    setState(() {
      quantity++;
    });
  }

  void quantityMinus(){
    setState(() {
      if(quantity > 0){
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row( //top row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector( //Back button
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey[300],
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 35,),
                    ),
                  ),
                  GestureDetector( //Go to cartpage button
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));},
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey[300],
                      child: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 35,),
                    ),
                  ),
                ],
              ),
            ),
            Stack(  //images
              children:[ 
                SizedBox(
                height: 350,
                child: PageView.builder(
                  onPageChanged: (value){
                    setState(() {
                      activePage = value;
                    });
                  },
                  controller: pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index){
                    return Imagepath(image: images[index]);
                  },),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                        List<Widget>.generate(
                          images.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: activePage == index? Colors.black:Colors.grey[400],
                              ),
                            ),
                          )
                        )
                      ),
                  ),
                )
              ]
            ),
            const SizedBox(height: 15,),
            Row( //Characteristics
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage('lib/images/c_neutral.png')),
                  ),
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage('lib/images/vegan.png')),
                  ),
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(image: AssetImage('lib/images/natural.png')),
                  ),
                ),
              ],
            ),      
            const SizedBox(height: 15,),   
            Expanded(
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35),)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30,20,30,12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Size: 4.23 fl oz / 125 ml', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400, fontSize: 15,)),
                          Text('(34 Reviews)', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400, fontSize: 15,))
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('\$${widget.productPrice}', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 35),), //price
                          const Spacer(),
                          Container( //quantity
                            height: 40,
                            width: 118,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: (){quantityMinus();}, icon: const Icon(Icons.remove, color: Colors.black, size: 14,)),
                                  Text(quantity.toString(), style: const TextStyle(color: Colors.black),),
                                  IconButton(onPressed: (){quantityAdd();}, icon: const Icon(Icons.add, color: Colors.black, size: 14,)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          GestureDetector( //Add to cart button
                            onTap: (){
                              Provider.of<CartProvider>(context, listen: false).addProductToCart({
                                  'name': widget.productName,
                                  'description': widget.productDescription, // Add an actual description if available
                                  'price': double.parse(widget.productPrice), // Convert price to double
                                  'quantity': quantity,
                                }
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CartPage()), // Make sure you have a CartPage widget
                              );
                            },
                            child: Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(child: Text('Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )               
          ],
        ),
      ),
    );
  }
}

class Imagepath extends StatelessWidget {
  const Imagepath({super.key, required this.image,});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(  //Images of product
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image))
      ),
    );
  }
}