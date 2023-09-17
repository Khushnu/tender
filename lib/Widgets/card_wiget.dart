import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.name, required this.age, required this.distance, required this.image});
  final String name;
  final int age; 
  final String distance; 
  final String image; 


  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
                            // height: 90,
                            // width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      image,
                                      fit: BoxFit.fill,
                                      height: screenHeight * 0.8,
                                      width: screenWidth,
                                      frameBuilder: (context, child, frame,
                                          wasSynchronouslyLoaded) {
                                        return child;
                                      },
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              backgroundColor: Colors.black,
                                            ),
                                          );
                                        }
                                      },
                                    )),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Opacity(
                                      opacity: 0.9,
                                      child: Container(
                                        height: 90,
                                        width: screenWidth,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 3),
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black
                                                ]),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                             name,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Age $age",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                            Text(
                                              distance,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          );
  }
}