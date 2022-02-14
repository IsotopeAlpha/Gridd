import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_app/screens/tab_manager.dart';

//Class to handle Orders

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  OrdersState createState() => OrdersState();
}

class OrdersState extends State<Orders> {
  var orders = [];
  late int? l;

  @override
  void initState() {
    orders = Hive.box('UserDetails').get('Orders');
    l = Hive.box('UserDetails').get('OrdersLength');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Orders',
          style: TextStyle(fontSize: 30, fontFamily: 'Lobster'),
        ),
        leading: GestureDetector(
          child: const Icon(Icons.close),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TabsManager()));
          },
        ),
      ),
      body: Container(color: Colors.blueGrey, child: displayOrders()),
    );
  }

  displayOrders() {
    if (l == 0 || l == null) {
      return const Center(
        child: Text(
          'No Orders Yet',
          style: TextStyle(fontFamily: 'Lobster'),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: l,
          itemBuilder: (context, index) {
            var item = orders[index];
            return ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: item.img,
              ),
              isThreeLine: true,
              subtitle: const Text('In Transit'),
              title: Text(
                item.name,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                'GHs ' + item.price.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          });
    }
  }
}
