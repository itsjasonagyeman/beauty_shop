import 'package:beauty_shop/pages/addtocart.dart';
import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  const Productcard({super.key, required this.productName, required this.productDescription, required this.productPrice});

  final String productName;
  final String productDescription;
  final double productPrice;

  @override
  Widget build(BuildContext context) {
    return  Container( //product
              height: 350,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,                
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container( //product image
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('lib/images/product_card.png'))
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(productName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                    Text(productDescription, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey, height: 1),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('\$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                        Text(productPrice.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                        const Spacer(),
                        GestureDetector( //shop button
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Addtocart(
                                productName: productName,
                                productPrice: productPrice.toString(),
                                productDescription: productDescription,
                              )),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: const Icon(Icons.shopping_bag_outlined, color: Colors.white,),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
  }
}