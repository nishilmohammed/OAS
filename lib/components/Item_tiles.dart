
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myproject/models/items.dart';

// class ItemTiles extends StatefulWidget {
//   final Items items;
//   ItemTiles({Key? key, required this.items}) : super(key: key);

//   @override
//   _ItemTilesState createState() => _ItemTilesState();
// }

// class _ItemTilesState extends State<ItemTiles> {
//   int? enteredValue;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 23),
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           AspectRatio(
//             aspectRatio: 14 / 9,
//             child: GestureDetector(
//               onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => IndivItem(
//                     items: widget.items,
//                   ),
//                 ),
//               ),
//               child: Image.asset(widget.items.imagepath, fit: BoxFit.contain),
//             ),
//           ),
//           Text(widget.items.name, style: const TextStyle(fontSize: 22)),
//           Text(widget.items.description),
//           Text(widget.items.expiry),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Text(widget.items.basebid),
//                   if (enteredValue != null) Text('Highest Bid: $enteredValue'),
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   _showInputDialog(context);
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(20),
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12),
//                     ),
//                   ),
//                   child: Text(
//                     'Bid',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _showInputDialog(BuildContext context) async {
//     int? userInput = await showDialog<int>(
//       context: context,
//       builder: (BuildContext context) {
//         TextEditingController controller = TextEditingController();

//         return AlertDialog(
//           title: const Text('Enter Value'),
//           content: TextField(
//             controller: controller,
//             decoration: const InputDecoration(hintText: 'Enter your bid'),
//             keyboardType: TextInputType.number,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 int? value = int.tryParse(controller.text);
//                 if (value != null) {
//                   setState(() {
//                     enteredValue = value;
//                   });
//                   Navigator.pop(context);
//                 } else {
//                   // Show error or handle invalid input
//                 }
//               },
//               child: const Text('Bid'),
//             ),
//           ],
//         );
//       },
//     );

//     if (userInput != null) {
//       // Handle the user input here, such as updating state or performing arithmetic operations
//       print('User entered: $userInput');
//     }
//   }
// }
//-------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myproject/models/items.dart';
import 'package:myproject/models/itemcart.dart'; // Import the Cart class

class ItemTiles extends StatefulWidget {
  final Items items;
  ItemTiles({Key? key, required this.items}) : super(key: key);

  @override
  _ItemTilesState createState() => _ItemTilesState();
}

class _ItemTilesState extends State<ItemTiles> {
  int? enteredValue;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context); // Access the Cart object

    return Container(
      margin: const EdgeInsets.only(left: 23),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 14 / 9,
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndivItem(
                    items: widget.items,
                  ),
                ),
              ),
              child: Image.asset(widget.items.imagepath, fit: BoxFit.contain),
            ),
          ),
          Text(widget.items.name, style: const TextStyle(fontSize: 22)),
          Text(widget.items.description),
          Text(widget.items.expiry),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(widget.items.basebid),
                  if (enteredValue != null) Text('Highest Bid: $enteredValue'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _showInputDialog(context, cart); // Pass the cart object to the dialog
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Bid',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showInputDialog(BuildContext context, Cart cart) async {
    int? userInput = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: const Text('Enter Value'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter your bid'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                int? value = int.tryParse(controller.text);
                if (value != null) {
                  setState(() {
                    enteredValue = value;
                  });
                  // Add item to cart here
                  cart.addItemToCart(widget.items);
                  Navigator.pop(context);
                } else {
                  // Show error or handle invalid input
                }
              },
              child: const Text('Bid'),
            ),
          ],
        );
      },
    );

    if (userInput != null) {
      // Handle the user input here, such as updating state or performing arithmetic operations
      print('User entered: $userInput');
      widget.items.maxbid=userInput;
    }
  }
}


class IndivItem extends StatelessWidget {
  final Items items;

  IndivItem({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.name),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.report),
            onPressed: () => _showReportDialog(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(11.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  width: 411,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(333)),
                  child: Image.asset(items.imagepath),
                ),
                SizedBox(height: 20),
                Text(
                  items.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  items.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _showInputDialog(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    
                    children: [
                      Container(
                        height: 44,width: 107,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Bid',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showInputDialog(BuildContext context) async {
    int? userInput = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: const Text('Enter Value'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter your bid'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                int? value = int.tryParse(controller.text);
                if (value != null) {
                  Navigator.pop(context);
                } else {
                //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter number')));
                }
              },
              child: const Text('Bid'),
            ),
          ],
        );
      },
    );

    if (userInput != null) {
      // Handle the user input here, such as updating state or performing arithmetic operations
      print('User entered: $userInput');
    }
  }

  Future<void> _showReportDialog(BuildContext context) async {
    TextEditingController controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: 'Enter your report'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle report submission
                  String report = controller.text;
                  print('Report submitted: $report');
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}
