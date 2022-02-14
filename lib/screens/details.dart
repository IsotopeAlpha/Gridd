import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:just_app/screens/tab_manager.dart';
import 'cart.dart';

//Shows the deatails of the products when the product gets clicked on on the homepage.

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.title, this.item, required this.cart})
      : super(key: key);

  final String title;
  // ignore: prefer_typing_uninitialized_variables
  var item;
  final List cart;

  @override
  // ignore: no_logic_in_create_state
  _DetailsState createState() => _DetailsState(title, item, cart);
}

class _DetailsState extends State<DetailsPage> with ChangeNotifier {
  _DetailsState(String title, var item, List cart);

  bool onclick = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const TabsManager()));
            },
          ),
          title:
              Text(widget.title, style: const TextStyle(fontFamily: 'Lobster')),
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        size: 35,
                      ),
                      if (widget.cart.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.yellow,
                            foregroundColor: Colors.blue,
                            child: Text(
                              widget.cart.length.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Cart(
                                  cart: widget.cart,
                                )));
                  },
                )),
          ]),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.7,
                height: 300,
                child: widget.item.img,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.item.name,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Price: ',
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                      children: [
                    TextSpan(
                      text: 'GHs ' + widget.item.price.toString(),
                      style:
                          const TextStyle(fontSize: 24, color: Colors.blueGrey),
                    ),
                  ])),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {
                      setState(() {
                        widget.cart.add(widget.item);
                        notifyListeners();
                      });
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.blueGrey,
                        ),
                        Text('Add to Cart'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: onclick == false
                        ? const Icon(
                            Icons.favorite_border,
                            color: Colors.blueGrey,
                            size: 40,
                          )
                        : const Icon(Icons.favorite,
                            color: Colors.blueGrey, size: 40),
                    onTap: () {
                      setState(() {
                        onclick = true;
                        notifyListeners();
                        Hive.box('UserDetails').put('Favorites', (widget.item));
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        onclick = false;
                        notifyListeners();
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
