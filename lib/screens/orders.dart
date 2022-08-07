// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_app/utils/colors.dart';
import 'package:sizer/sizer.dart';
//Class to handle Orders

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  OrdersState createState() => OrdersState();
}

class OrdersState extends State<Orders> {
  var orders;

  @override
  void initState() {
    if (Hive.box('UserDetails').get('Orders') != null) {
      orders = Hive.box('UserDetails').get('Orders');
    } else {
      orders = [];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        title: Text(
          'Orders',
          style: TextStyle(fontSize: 12.sp, fontFamily: 'Lobster'),
        ),
        leading: const BackButton(),
      ),
      body: Container(
        color: MyColors.primaryColor,
        child: orders.length == 0 || orders.length == null
            ? const Center(
                child: Text(
                  'No Orders Yet',
                  style: TextStyle(fontFamily: 'Lobster'),
                ),
              )
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var item = orders[index];
                  return ListTile(
                    leading: Image.asset(
                      item.img,
                      width: 30.w,
                      height: 30.w,
                    ),
                    isThreeLine: true,
                    subtitle: const Text('In Transit'),
                    title: Text(
                      item.name,
                      style: const TextStyle(color: MyColors.whiteColor),
                    ),
                    trailing: Text(
                      'GHs ${item.price}',
                      style: const TextStyle(color: MyColors.whiteColor),
                    ),
                  );
                }),
      ),
    );
  }
}
