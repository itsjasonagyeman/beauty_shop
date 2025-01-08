import 'package:beauty_shop/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CoverPage extends StatelessWidget {
  const CoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('lib/images/cover_page.png'),
            const Text('Let Us Reward', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You,', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),),
                Text(' Naturally', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SlideAction(
                borderRadius: 25,
                elevation: 0,
                innerColor: Colors.black,
                outerColor: Colors.grey[400],
                text: 'Let\'s go',
                textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
                onSubmit: (){
                  return
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Homepage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}