import 'package:beauty_shop/components/productcard.dart';
import 'package:beauty_shop/components/productslist.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final textController = TextEditingController(); //get what user typed
  int searchResult = face.length;
  List searchResultList = face;
  String searchInput = '';

  void search(){
    setState(() {
      if(searchInput.contains('face')){
        searchResult = face.length;
        searchResultList = face;
      }
      else if(searchInput.contains('body')){
        searchResult = body.length;
        searchResultList = body;
      }
      else if(searchInput.contains('hair')){
        searchResult = hair.length;
        searchResultList = hair;
      }
           else if(searchInput.contains('gifts')){
        searchResult = gifts.length;
        searchResultList = gifts;
      }       
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 20, bottom: 25),
        child: Column(
          children: [
            Row( //App bar
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
                    const SizedBox(width: 100,),
                    const Text('Search', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),),
                    const Spacer(),
                    GestureDetector(    //profile button
                      onTap: (){},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: const DecorationImage(image: AssetImage('lib/images/prof.jpg'), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,) ,    
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'What are you looking for?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),                      
                    ),
                  suffixIcon: IconButton(onPressed: (){textController.clear();}, icon: const Icon(Icons.clear)),
                  prefixIcon: IconButton(onPressed: (){
                    setState(() {
                      searchInput = textController.text;
                      search();
                    });
                  }, icon: const Icon(Icons.search, color: Colors.blue,))  
                  ),
                ),
      
                Expanded(
                  child: GridView.builder(
                    itemCount: searchResult,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.48), 
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Productcard(productName: searchResultList[index]['name'], productDescription: searchResultList[index]['description'], productPrice: searchResultList[index]['price'.toString()]),
                      );
                    }
                    ),
                ),
          ],
        ),
      ),
    );
  }
}