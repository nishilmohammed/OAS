import 'package:flutter/material.dart';
import 'package:myproject/home.dart';
import 'package:myproject/openauc.dart';
import 'package:myproject/register.dart';

class MyAuction extends StatefulWidget {
  MyAuction({super.key});

  @override
  State<MyAuction> createState() => _MyAuctionState();
}

class _MyAuctionState extends State<MyAuction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // MyButton(onTap:(){

        //    Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => HomeP(),
        //         ));
        // } ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OpenAuction(),
                ));
              },
              child: Text(
                "Open",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Text(
              "Closed",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Mine",
              style: TextStyle(fontSize: 16),
            ),
          ],
        )
      ],
    ));
  }
}
