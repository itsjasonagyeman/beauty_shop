import 'package:beauty_shop/components/cart_provider.dart';
import 'package:beauty_shop/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProcessPayment extends StatefulWidget {
  const ProcessPayment({super.key});

  @override
  State<ProcessPayment> createState() => _ProcessPaymentState();
}

class _ProcessPaymentState extends State<ProcessPayment> {

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {


    List <Map<String, dynamic>> paymentMethod = [
      {
        'name' : 'MTN',
        'color': Colors.yellow,
        'image' : 'lib/images/mtn.jpg',
      },
      {
        'name' : 'TELECEL',
        'color': Colors.red,
        'image' : 'lib/images/telecel.jpg',
      },
      {
        'name' : 'AIRTEL-TIGO',
        'color': Colors.blue,
        'image' : 'lib/images/airteltigo.jpg',
      },
      {
        'name' : 'MASTERCARD',
        'color': Colors.orange,
        'image' : 'lib/images/mastercard.jpg',
      }                    
    ];

    void alertDialog(){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
            }, 
            child: const Text('Close', style: TextStyle(color: Colors.red),),
            ),
          ],
          title: const Text('Success', style: TextStyle(color: Colors.white, fontSize: 20),),
          content: const Text('Order Confirmed', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,25,20,25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector( //back button
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey[300],
                      child: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 35),
                    ),
                  ),
                  const SizedBox(width: 70,),
                  const Text('Payment Method', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),),
                ],
              ),
              const SizedBox(height: 30,),
              const Text('Shipping to', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),),
              const SizedBox(height: 10,),
              Container( //location
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container( //location image container
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white, //map image,
                        image: const DecorationImage(image: AssetImage('lib/images/location.jpg')),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 3),
                            spreadRadius: 3,
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.1),
                          )]
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20,8,0,8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Home', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black),),
                          SizedBox(height: 5,),
                          Text('147 Cader Lane, Petaluma', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey, height: 1),),
                          Text('CA 9495, Australia', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey, height: 1),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              const Text('Add Payment method', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),),
              const SizedBox(height: 10,),
              Container( //payment method
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300]
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: paymentMethod.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                            color: paymentMethod[index]['color'],
                            image: DecorationImage(image: AssetImage(paymentMethod[index]['image']), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2,
                              color: selectedIndex == index ? Colors.black : Colors.transparent,
                            )
                          ),
                        ),
                      ),
                    );
                  }
                  ),
              ),  
              const SizedBox(height: 30,),
              Container( // Total Tally
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
                    const Spacer(),
                    Text('\$${Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),)
                  ],
                ),
              ),    
              const Spacer(),
              InkWell(
                onTap: (){
                  alertDialog();
                },
                child: Container( //Proceed to checkout
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(child: Text('Confirm Order', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),)),
                ),
            ),                        
          ],
        ),
      ),
    );
  }
}