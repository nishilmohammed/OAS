import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myproject/models/items.dart';


// ignore: must_be_immutable
class ItemTiles extends StatelessWidget {
  Items items;
  ItemTiles({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 23),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 14/9,
            child: Image.asset(items.imagepath,fit: BoxFit.contain,)),
          Text(items.name,style: const TextStyle(fontSize: 22),),
          Text(items.description),
          Text(items.expiry),
       
       
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
              children: [

              Text(items.basebid),
                  

        

              ],
             ),
               Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(

                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                ),
                
                
                
                
                
                child: const Icon(FontAwesomeIcons.hammer,color: const Color.fromARGB(255, 255, 255, 255),),),

            ],
          )
        
          





        ],

      ),
    
    );
  }
}