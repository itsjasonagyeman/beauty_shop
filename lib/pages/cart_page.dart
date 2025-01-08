import 'package:beauty_shop/pages/process_payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beauty_shop/components/cart_provider.dart'; // Import the CartProvider where you manage cartItems

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).items;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 25),
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
                const SizedBox(width: 120,),
                const Text('Cart', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black),),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox( //
              width: double.infinity,
              height: 400,
              child: cartItems.isEmpty
              ? Center(
                  child: Text(
                    'No item selected',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                )
               :  ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  var item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Stack(
                      children: [
                        Container(
                          height: 90,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(  // Product image
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(image: AssetImage('lib/images/addto_cart.png',))
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20)),
                                  Text(item.description, style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700], fontSize: 16, height: 1)),
                                  const Spacer(),
                                  Text('\$${(item.price * item.quantity).toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 25)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(    // Increase/Decrease container
                            height: 40,
                            width: 120,                      
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container( // Reduce button
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[300],
                                    border: Border.all(color: Colors.black, width: 2),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Provider.of<CartProvider>(context, listen: false).decreaseQuantity(item);
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                ),
                                Center(
                                  child: Text(item.quantity.toString(), style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 20)), // Display quantity
                                ),
                                Container( // Increase button
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black, width: 2),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Provider.of<CartProvider>(context, listen: false).increaseQuantity(item);
                                    },
                                    icon: const Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned( // Remove button
                          top: 3,
                          right: 3,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Provider.of<CartProvider>(context, listen: false).removeItem(item);
                              },
                              icon: const Icon(Icons.close, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProcessPayment()));
              },
              child: Container( //Proceed to checkout
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(child: Text('Proceed To Checkout', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
