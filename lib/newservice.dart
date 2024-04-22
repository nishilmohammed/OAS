import 'package:flutter/material.dart';
import 'package:myproject/home.dart';


class NewService extends StatefulWidget {
  const NewService({super.key});

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 248, 227),
        body: ListView(
          children: const [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     pickImages();
                //   },
                //   child: Container(
                //     height: 133,
                //     width: 133,
                //     decoration: BoxDecoration(
                //       color: const Color.fromARGB(54, 105, 240, 175),
                //       borderRadius: BorderRadius.circular(6),
                //     ),
                //     child: Icon(
                //       Icons.image,
                //       size: 33,
                //     ),
                //   ),
                // ),
              ],
              



            ),


          ],
        ),
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: 2,
          onTap: (p0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeP(
                      currentIndex: p0,
                    )));
          },
        ));

  

  }
}