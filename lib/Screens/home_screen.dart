import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tender/Functions/alert_function.dart';
import 'package:tender/Model/datamodel.dart';
import 'package:tender/Screens/history_screen.dart';
import 'package:tender/Widgets/bottom_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<SwipeItem> _swipeItems = []; 
 MatchEngine? matchEngine;
 List<DataModel> reqs = [];
  var dataa;

@override
  void initState() {
    
    for(int i =0; i<data.length; i++){
      _swipeItems.add(SwipeItem(
        content: DataModel(
          name: data[i].name, 
        age: data[i].age, 
        distance: data[i].distance, 
        image: data[i].image)
      , likeAction: (){
       actions(context, data[i].name, 'like');
       reqs.add(data[i],);
      }, 
      nopeAction: (){
        actions(context, data[i].name, 'rejected');
      }), 
      );
    }
    matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  
  }



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth =  MediaQuery.sizeOf(context).width;
    return Scaffold(
     
      body: Container(
        height: screenHeight , 
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, 
            end: Alignment.bottomCenter,
            colors: [
            Color(0xffFF655B), 
            Color(0xffFF5864), 
            Color(0xffFD297B)
          ])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(top: 60, left: 10 ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   const Text('Discover', style: TextStyle(
                      color: Colors.white70, 
                      fontSize: 30, 
                      fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.menu, color: Colors.white70,))
                 ],
               ),
             ),
            SizedBox(
              height: screenHeight * 0.7 + 50, 
              child: SwipeCards(
                matchEngine: matchEngine!, 
                leftSwipeAllowed: true, 
                rightSwipeAllowed: true, 
                upSwipeAllowed: false, 
              itemBuilder: (_ , index){
             dataa = data[index];
               return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                      child: Container(
                        // height: 90, 
                        // width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:   Image.network(dataa.image, fit: BoxFit.fill, height: screenHeight * 0.8 , width: screenWidth ,
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                return child;
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if(loadingProgress == null){
                                  return child;
                                } else {
                                return  const Center(
                                    child: CircularProgressIndicator.adaptive(
                                     backgroundColor: Colors.black,
                                    ),
                                  );
                                }
                              },)), 
                              
                               Align(
                                  alignment: Alignment.bottomLeft,
                                   child: Opacity(
                                    opacity: 0.9,
                                     child: Container(
                                      height: 90, 
                                      width: screenWidth  ,
                                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter, 
                                          end: Alignment.bottomCenter,
                                          colors: [
                                          Colors.transparent, 
                                          Colors.black
                                        ]
                                        ), 
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(dataa.name, 
                                     style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold),), 
                                      Text("Age ${dataa.age}", 
                                     style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 18, 
                                      fontWeight: FontWeight.normal),), 
                                      Text(dataa.distance, 
                                     style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 18, 
                                      fontWeight: FontWeight.normal),)
                                        ],
                                      ),
                                     ),
                                   ) ),
                          ],
                        ),
                      ),
                    );
              }, onStackFinished: (){
                return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('List is Over')));
              },)  ),
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomButtonsWidget(icon: Icons.close, onTap: (){},), 
                  BottomButtonsWidget(icon: Icons.favorite,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_){
                      return HistoryScreen(req: reqs);
                    }));
                  },)
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}