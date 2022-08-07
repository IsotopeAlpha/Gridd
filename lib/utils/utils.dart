// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:just_app/models/products.dart';
import 'package:sizer/sizer.dart';
import 'colors.dart';

class Utils {
  showProgress(BuildContext context) {
    AlertDialog dialog = AlertDialog(
      content: Row(
        children: const [CircularProgressIndicator(), Text('   Loading...')],
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return dialog;
        });
  }

  List populatePicks() {
    var list = [
      Product(
          name: 'T-shirt', img: 'assets/images/fashion/shirt.jpeg', price: 45),
      Product(
          name: 'Air Force 1',
          img: 'assets/images/fashion/air1.jpeg',
          price: 200),
      Product(
          name: 'Infinix Hot 10 Lite',
          img: 'assets/images/phones/InfinixHot10Lite.jpg',
          price: 550),
      Product(
          name: 'IPhone 6',
          img: 'assets/images/phones/iPhone6.jpg',
          price: 700),
      Product(
          name: 'Hp Pavillion 15 7th Generation',
          img: 'assets/images/comps/hp_pavillion15.png',
          price: 4500),
    ];
    return list;
  }

  List populatePhones() {
    var list = <Product>[
      Product(
          name: 'Infinix Hot 10 Lite',
          img: 'assets/images/phones/InfinixHot10Lite.jpg',
          price: 550),
      Product(
          name: 'IPhone 6',
          img: 'assets/images/phones/iPhone6.jpg',
          price: 700),
      Product(
          name: 'IPhone 7 Plus',
          img: 'assets/images/phones/iPhone7Plus.jpg',
          price: 1200),
      Product(
          name: 'I7Ws Earpods',
          img: 'assets/images/phones/i7ws.jpg',
          price: 70),
      Product(
          name: 'Wired Earpiece',
          img: 'assets/images/phones/wired_earpiece.jpg',
          price: 15),
      Product(
          name: 'Rock Wireless Earpiece',
          img: 'assets/images/phones/Rock.jpg',
          price: 30),
      Product(
          name: 'IPhone 12 Screen Protector',
          img: 'assets/images/phones/iphone12pro.jpg',
          price: 30)
    ];
    return list;
  }

  List<Product> populateFashions() {
    var list = <Product>[
      Product(
          name: 'T-shirt', img: 'assets/images/fashion/shirt.jpeg', price: 45),
      Product(
          name: 'Air Force 1',
          img: 'assets/images/fashion/air1.jpeg',
          price: 200),
      Product(
          name: 'Air Force 1',
          img: 'assets/images/fashion/air3.jpeg',
          price: 200),
      Product(name: 'Short', img: 'assets/images/fashion/short.jpg', price: 35),
      Product(
          name: 'Trouser', img: 'assets/images/fashion/trouser.jpg', price: 50),
      Product(
          name: 'Necklace',
          img: 'assets/images/fashion/necklace.jpeg',
          price: 15),
      Product(
          name: 'Air Force 1',
          img: 'assets/images/fashion/air2.jpeg',
          price: 250),
      Product(
          name: 'Air Force 1',
          img: 'assets/images/fashion/air4.jpeg',
          price: 300),
    ];
    return list;
  }

  List populateComps() {
    var list = [
      Product(
          name: 'Dell Inspirion 15 5th Generation',
          img: 'assets/images/comps/dell_inspirion15.jpeg',
          price: 3500),
      Product(
          name: 'Hp Pavillion 15 7th Generation',
          img: 'assets/images/comps/hp_pavillion15.png',
          price: 4500),
      Product(
          name: 'Hp Elite Desktop 7th Generation',
          img: 'assets/images/comps/hp_elitedesk_i7.jpeg',
          price: 4000),
      Product(
          name: 'Apple Macbook Pro 2022',
          img: 'assets/images/comps/macbook_pro.jpg',
          price: 6000),
      Product(
          name: 'Wireless Mouse and Keyboard',
          img: 'assets/images/comps/wireless_mouse_keyboard.jpeg',
          price: 3500),
    ];
    return list;
  }

  showSnackbar(BuildContext context, String msg) {
    SnackBar snackBar = SnackBar(
      content: Text(
        msg,
        style: TextStyle(
            color: MyColors.primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold),
        softWrap: true,
      ),
      backgroundColor: MyColors.whiteColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showAlertDialog(BuildContext context, String? title, String? msg,
      String? fwrdBtn, Function() onfwrdBtnClick) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        title ?? "",
        style: TextStyle(
            fontFamily: 'Lobster', fontSize: 15.sp, color: MyColors.blackColor),
      )),
      backgroundColor: MyColors.primaryColor,
      content: Text(
        msg ?? "",
        style: TextStyle(fontSize: 10.sp, color: Colors.white),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    Text(
                      'Back',
                    ),
                  ],
                )),
            TextButton(
              onPressed: () {
                onfwrdBtnClick();
              },
              child: fwrdBtn != null
                  ? Row(
                      children: [
                        Text(
                          fwrdBtn,
                          style: const TextStyle(color: MyColors.yellowColor),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            color: MyColors.yellowColor),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
      ],
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
