import 'package:flutter/material.dart';
import 'package:tender/Model/datamodel.dart';
import 'package:tender/Screens/history_screen.dart';
import 'package:tender/Widgets/bottom_buttons.dart';
import 'package:tender/Widgets/card_wiget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DataModel> reqs = [];
  var dataa;
  var offset = Offset.zero;
  var angel = 0.0;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffFF655B),
              Color(0xffFF5864),
              Color(0xffFD297B)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white70,
                      ))
                ],
              ),
            ),
            SizedBox(
                height: screenHeight * 0.7 + 50,
                child: Stack(
                  children: data.map((e) {
                    var dat = e;
                    return data.isEmpty
                                  ? CardWidget(
                                      name: dat.name,
                                      age: dat.age,
                                      distance: dat.distance,
                                      image: dat.image) : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onHorizontalDragStart: (details) {},
                        onHorizontalDragEnd: (a) {
                          setState(() {
                            angel = 0;
                          });
                        },
                        onHorizontalDragUpdate: (a) {
                          setState(() {
                            angel += a.primaryDelta ?? 0;
                          });
                          // ignore: avoid_print
                          print(angel / 8);
                          if (angel / 8 > 25) {
                            data.removeLast();
                            setState(() {
                               reqs.add(dat);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 1), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return AlertDialog(
                                      insetPadding: const EdgeInsets.symmetric(
                                          horizontal: 60, vertical: 310),
                                      content: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'You Like ${dat.name}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.green),
                                              ),
                                              child: const Icon(Icons.favorite))
                                        ],
                                      ),
                                    );
                                  });
                              angel = 0;
                            });
                          } else if (angel / 8 < -25) {
                            setState(() {
                             
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 1), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return AlertDialog(
                                      insetPadding: const EdgeInsets.symmetric(
                                          horizontal: 60, vertical: 310),
                                      content: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'You Reject ${dat.name}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.red),
                                              ),
                                              child: const Icon(Icons.close))
                                        ],
                                      ),
                                    );
                                  });
                              data.removeLast();
                              angel = 0;
                            });
                            // ignore: avoid_print
                            print('left');
                          }
                        },
                        child: Transform.translate(
                          offset: Offset(angel / 1.5, 0),
                          child: Transform.rotate(
                              angle: angel / 10 * 0.0174533,
                              child: 
                                   CardWidget(
                                      name: dat.name,
                                      age: dat.age,
                                      distance: dat.distance,
                                      image: dat.image)),
                        ),
                      ),
                    );
                  }).toList(),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomButtonsWidget(
                    icon: Icons.close,
                    onTap: () {},
                  ),
                  BottomButtonsWidget(
                    icon: Icons.favorite,
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return HistoryScreen(req: reqs);
                      }));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
