// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_app/screens/home.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import 'package:sizer/sizer.dart';

//Class for checking out after selecting product(s).

class Checkout extends StatefulWidget {
  const Checkout({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state, library_private_types_in_public_api
  CheckoutState createState() => CheckoutState();
}

// ignore: camel_case_types
enum paymentMethod { cash, online }

class CheckoutState extends State<Checkout> {
  List cart = [];

  @override
  void initState() {
    if (Hive.box('UserDetails').get('cart') != null) {
      cart = Hive.box('UserDetails').get('cart');
    } else {
      cart = [];
    }
    setState(() {
      total = calculateTotal();
    });
    super.initState();
  }

  int total = 0;
  Box box1 = Hive.box('UserDetails');
  // ignore: prefer_typing_uninitialized_variables
  var items;

  @override
  Widget build(BuildContext context) {
    var item = cart;
    items = item;
    paymentMethod pay = paymentMethod.cash;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: MyColors.primaryColor,
        title: const Text('Checkout', style: TextStyle(fontFamily: 'Lobster')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: MyColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.all(2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: MyColors.whiteColor,
                          fontFamily: 'Lobster'),
                    ),
                    Text(
                      'Prices',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: MyColors.yellowColor,
                          fontFamily: 'Lobster'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                color: MyColors.primaryColor,
                width: 100.w,
                height: 300,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item[index].name,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: MyColors.whiteColor),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 4,
                      child: Container(
                        color: Colors.grey[50],
                        child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 2.w),
                                  child: Text(
                                    'GHs ${item[index].price}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: MyColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(2.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 6,
                      child: Text(
                        'Total:',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontFamily: 'Lobster'),
                      )),
                  Flexible(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(right: 2.w, left: 3.w),
                      child: Text(
                        'GHs: $total',
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black,
                            fontFamily: 'Lobster'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100.w,
              padding: EdgeInsets.all(1.w),
              color: MyColors.primaryColor,
              child: Text(
                'Payment Method',
                style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 12.sp,
                    color: MyColors.whiteColor),
              ),
            ),
            ListTile(
              title: Text(
                'Pay On Delivery',
                style: TextStyle(fontSize: 12.sp),
              ),
              leading: Radio(
                value: paymentMethod.cash,
                groupValue: pay,
                onChanged: (paymentMethod? value) {
                  setState(() {
                    pay = value!;
                  });
                },
              ),
            ),
            // ListTile(
            //   title: Text(
            //     'Pay Online',
            //     style: TextStyle(fontSize: 12.sp),
            //   ),
            //   leading: Radio(
            //     splashRadius: 4,
            //     value: paymentMethod.online,
            //     groupValue: pay,
            //     onChanged: (paymentMethod? value) {
            //       setState(() {
            //         pay = value!;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.whiteColor,
        onPressed: () {
          Utils().showAlertDialog(context, "Place Order",
              "About to Place Order, Continue?", "Order", () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          });
        },
        icon: const Icon(Icons.double_arrow_sharp),
        label: Text(
          'Order',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 12.sp),
        ),
      ),
    );
  }

  calculateTotal() {
    int total = 0;
    for (int i = 0; i < cart.length; i++) {
      total = cart[i].price + total;
    }
    return total;
  }
}
