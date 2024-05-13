import 'package:flutter/material.dart';
import 'package:myproject/components/Item_tiles.dart';
import 'package:myproject/components/service_tile.dart';
import 'package:myproject/models/itemcart.dart';
import 'package:myproject/models/items.dart';
import 'package:provider/provider.dart';

class Realhome extends StatefulWidget {
  const Realhome({Key? key}) : super(key: key);

  @override
  State<Realhome> createState() => _RealhomeState();
}

class _RealhomeState extends State<Realhome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular picks",
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

              //list of items for bid

              SizedBox(
                height: 290, // Set a fixed height for the ListView
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Items items = value.getItemList()[index];

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

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular services",
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
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Services services = value.getServiceList()[index];
                    return ServiceTile(services: services);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
