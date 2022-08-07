// ignore_for_file: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:just_app/utils/utils.dart';
import 'package:sizer/sizer.dart';
import '../utils/colors.dart';
import '../widgets/cart_widget.dart';
import 'details.dart';

//Product (Phones) class

class Phones extends StatefulWidget {
  Phones({Key? key}) : super(key: key);

  @override
  PhonesState createState() => PhonesState();
}

class PhonesState extends State<Phones> with ChangeNotifier {
  final List _phones = Utils().populatePhones();
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
    PhonesState().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.primaryColor,
          leading: const BackButton(),
          title: const Text('Phones and Accessories',
              style: TextStyle(fontFamily: 'Lobster')),
          actions: [MyCart(cart: cart)]),
      body: SizedBox(
        width: 100.w,
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: _phones.length,
            itemBuilder: (context, index) {
              var item = _phones[index];
              return Padding(
                padding: const EdgeInsets.all(4),
                child: GestureDetector(
                  child: Card(
                    elevation: 4,
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              item.img,
                              height: 35.w,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              color: Colors.white,
                              width: 10.w,
                              height: 10.w,
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                onTap: () {
                                  setState(() {
                                    cart.add(item);
                                    Hive.box('UserDetails').put('cart', item);
                                    notifyListeners();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Card(
                            elevation: 1,
                            color: MyColors.yellowColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1.w)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              child: Text(
                                'GHs ${item.price}',
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(item: item)));
                  },
                ),
              );
            }),
      ),
    );
  }
}
