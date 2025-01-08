// ignore: file_names

import 'package:flutter/material.dart';

class Popularcard extends StatelessWidget {
  const Popularcard({super.key, required this.name, required this.description, required this.price});

  final String name;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(    //Popular Card
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(image: AssetImage('lib/images/addto_cart.png',))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,8,0,20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),),
                        Text(description, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey[800], height:0.8),),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Text('\$', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),),
                  Text(price.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),),
                ],
              ),
            );
  }
}