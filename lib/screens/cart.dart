// ignore_for_file: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:just_app/screens/checkout.dart';
import 'package:just_app/screens/home.dart';
import 'package:just_app/utils/colors.dart';
import 'package:just_app/utils/utils.dart';
import 'package:sizer/sizer.dart';

import '../widgets/cart_widget.dart';

//Class for viewing the cart

class Cart extends StatefulWidget {
  Cart({
    Key? key,
  }) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> with ChangeNotifier {
  List cart = [];
  @override
  void initState() {
    if (Hive.box('UserDetails').get('cart') != null) {
      cart = Hive.box('UserDetails').get('cart');
    } else {
      cart = [];
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    CartState().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        title: const Text('Cart', style: TextStyle(fontFamily: 'Lobster')),
        actions: [MyCart(cart: cart)],
      ),
      body: Container(
        color: MyColors.primaryColor,
        child: cart.isEmpty
            ? Center(
                child: Text(
                  'Cart Empty',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Colors.white,
                      fontSize: 12.sp),
                ),
              )
            : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  var item = cart[index];
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Card(
                      color: MyColors.yellowColor,
                      elevation: 4,
                      child: ListTile(
                        leading: SizedBox(
                          width: 30.w,
                          height: 40.w,
                          child: item.img,
                        ),
                        title: Text(item.name),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.remove_circle,
                            color: MyColors.redColor,
                          ),
                          onTap: () {
                            setState(() {
                              cart.remove(item);

                              notifyListeners();
                            });
                          },
                        ),
                      ),
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MyColors.whiteColor,
        foregroundColor: MyColors.blackColor,
        onPressed: () {
          // if (widget.cart.isEmpty) {
          //   Utils().showSnackbar(
          //       context, 'Add at least one item to cart to checkout');
          // } else {
          Utils().showAlertDialog(
              context, "Checkout", "Proceed to Checkout?", "Proceed", () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Checkout()));
          });
          //}
        },
        icon: const Icon(Icons.double_arrow_sharp),
        label: Text(
          'Checkout',
          style: TextStyle(fontFamily: 'Lobster', fontSize: 12.sp),
        ),
      ),
    );
  }
}
