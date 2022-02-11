import 'package:flutter/material.dart';
import 'package:just_app/models/products.dart';

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
          'T-shirt',
          Image.asset(
            'assets/images/fashion/shirt.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          45),
      Product(
          'Air Force 1',
          Image.asset(
            'assets/images/fashion/air1.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          200),
      Product(
          'Beef Burger without beef',
          Image.asset(
            "assets/images/dishes/dish4.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          10),
      Product(
          'Fried Rice and Chicken',
          Image.asset(
            "assets/images/dishes/dish5.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          25),
      Product(
          'Infinix Hot 10 Lite',
          Image.asset(
            'assets/images/phones/InfinixHot10Lite.jpg',
            width: 150,
            height: 150,
          ),
          550),
      Product(
          'IPhone 6',
          Image.asset(
            'assets/images/phones/iPhone6.jpg',
            width: 150,
            height: 150,
          ),
          700),
    ];
    return list;
  }

  List populatePhones() {
    var list = <Product>[
      Product(
          'Infinix Hot 10 Lite',
          Image.asset(
            'assets/images/phones/InfinixHot10Lite.jpg',
            width: 150,
            height: 150,
          ),
          550),
      Product(
          'IPhone 6',
          Image.asset(
            'assets/images/phones/iPhone6.jpg',
            width: 150,
            height: 150,
          ),
          700),
      Product(
          'IPhone 7 Plus',
          Image.asset(
            'assets/images/phones/iPhone7Plus.jpg',
            width: 150,
            height: 150,
          ),
          1200),
      Product(
          'I7Ws Earpods',
          Image.asset(
            'assets/images/phones/i7ws.jpg',
            width: 150,
            height: 150,
          ),
          70),
      Product(
          'Wired Earpiece',
          Image.asset(
            'assets/images/phones/wired_earpiece.jpg',
            width: 150,
            height: 150,
          ),
          15),
      Product(
          'Rock Wireless Earpiece',
          Image.asset(
            'assets/images/phones/Rock.jpg',
            width: 150,
            height: 150,
          ),
          30),
      Product(
          'IPhone 12 Screen Protector',
          Image.asset(
            'assets/images/phones/iphone12pro.jpg',
            width: 120,
            height: 120,
          ),
          30)
    ];
    return list;
  }

  List<Product> populateDishes() {
    var list = <Product>[
      Product(
          'Chicken Zinger',
          Image.asset(
            "assets/images/dishes/dish1.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          15),
      Product(
          'Chicken Zinger without chicken',
          Image.asset(
            "assets/images/dishes/dish2.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          20),
      Product(
          'Rice',
          Image.asset(
            "assets/images/dishes/dish3.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          10),
      Product(
          'Beef Burger without beef',
          Image.asset(
            "assets/images/dishes/dish4.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          10),
      Product(
          'Fried Rice and Chicken',
          Image.asset(
            "assets/images/dishes/dish5.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          25),
      Product(
          'Fufu and chicken soup',
          Image.asset(
            "assets/images/dishes/dish6.jpg",
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          25),
    ];
    return list;
  }

  List<Product> populateFashions() {
    var list = <Product>[
      Product(
          'T-shirt',
          Image.asset(
            'assets/images/fashion/shirt.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          45),
      Product(
          'Air Force 1',
          Image.asset(
            'assets/images/fashion/air1.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          200),
      Product(
          'Air Force 1',
          Image.asset(
            'assets/images/fashion/air3.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          200),
      Product(
          'Short',
          Image.asset(
            'assets/images/fashion/short.jpg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          35),
      Product(
          'Trouser',
          Image.asset(
            'assets/images/fashion/trouser.jpg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          50),
      Product(
          'Necklace',
          Image.asset(
            'assets/images/fashion/necklace.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          15),
      Product(
          'Air Force 1',
          Image.asset(
            'assets/images/fashion/air2.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          250),
      Product(
          'Air Force 1',
          Image.asset(
            'assets/images/fashion/air4.jpeg',
            fit: BoxFit.contain,
            width: 150,
            height: 150,
          ),
          300),
    ];
    return list;
  }

  List populateComps() {
    var list = [
      Product(
          'Dell Inspirion 15 5th Generation',
          Image.asset(
            'assets/images/comps/dell_inspirion15.jpeg',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
          3500),
      Product(
          'Hp Pavillion 15 7th Generation',
          Image.asset(
            'assets/images/comps/hp_pavillion15.png',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
          4500),
      Product(
          'Hp Elite Desktop 7th Generation',
          Image.asset(
            'assets/images/comps/hp_elitedesk_i7.jpeg',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
          4000),
      Product(
          'Apple Macbook Pro 2022',
          Image.asset(
            'assets/images/comps/macbook_pro.jpg',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
          6000),
      Product(
          'Wireless Mouse and Keyboard',
          Image.asset(
            'assets/images/comps/wireless_mouse_keyboard.jpeg',
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
          3500),
    ];
    return list;
  }

  showSnackbar(BuildContext context, String msg) {
    SnackBar snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.blue),
        softWrap: true,
      ),
      backgroundColor: Colors.amber,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
