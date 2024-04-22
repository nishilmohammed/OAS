// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:myproject/components/Item_tiles.dart';
// import 'package:myproject/models/items.dart';

// class Realhome extends StatefulWidget {
//   const Realhome({super.key});

//   @override
//   State<Realhome> createState() => _RealhomeState();
// }

// class _RealhomeState extends State<Realhome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 23),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Hot picks",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Text(
//                   "see all",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           Expanded(
//               child: ListView.builder(
//             itemCount: 5,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               Items items = Items(
//                   name: 'car',
//                   description: 'speed car',
//                   expiry: '12/01/2001',
//                   basebid: '2222222',
//                   imagepath: 'assets/ceeeer.jpg',
//                   category: 'car');

//               return ItemTiles(
//                 items: items,
//               );
//             },
//           )),
//           const Padding(
//             padding: EdgeInsets.only(top: 80.0),
//             child: Divider(
//               color: Color.fromARGB(255, 255, 255, 255),
//             ),
//           ),
//           Expanded(
//               child: ListView.builder(
//             itemCount: 5,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               Items items2 = Items(
//                   name: 'car',
//                   description: 'speed car',
//                   expiry: '12/01/2001',
//                   basebid: '2222222',
//                   imagepath: 'assets/ceeeer.jpg',
//                   category: 'car');

//               return ItemTiles(
//                 items: items2,
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:myproject/components/Item_tiles.dart';
import 'package:myproject/models/items.dart';

class Realhome extends StatefulWidget {
  const Realhome({Key? key}) : super(key: key);

  @override
  State<Realhome> createState() => _RealhomeState();
}

class _RealhomeState extends State<Realhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot picks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 290, // Set a fixed height for the ListView
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Items items = Items(
                    name: 'car',
                    description: 'speed car',
                    expiry: '12/01/2001',
                    basebid: '2222222',
                    imagepath: 'assets/ceeeer.jpg',
                    category: 'car',
                  );

                  return ItemTiles(
                    items: items,
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Divider(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(
              height: 290, // Set a fixed height for the ListView
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Items items2 = Items(
                    name: 'Painting',
                    description: 'need to paint 500 sqdt',
                    expiry: '12/01/2001',
                    basebid: '2222222',
                    imagepath: 'assets/house.jpg',
                    category: 'painting',
                  );

                  return ItemTiles(
                    items: items2,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
