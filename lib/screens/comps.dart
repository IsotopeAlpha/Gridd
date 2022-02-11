import 'package:flutter/material.dart';
import 'package:just_app/screens/tab_manager.dart';
import 'package:just_app/utils/utils.dart';

import 'cart.dart';
import 'details.dart';

class Computers extends StatefulWidget {
  const Computers({Key? key, required this.cart}) : super(key: key);

  final List cart;

  @override
  _ComputersState createState() => _ComputersState();
}

class _ComputersState extends State<Computers> with ChangeNotifier {
  late List _comps;

  @override
  void initState() {
    super.initState();
    _comps = Utils().populateComps();
  }

  @override
  Widget build(BuildContext context) {
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
          title: const Text('Computers And Accessories',
              style: TextStyle(fontFamily: 'Lobster')),
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
        width: width,
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: _comps.length,
            itemBuilder: (context, index) {
              var item = _comps[index];
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            item.img,
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              color: Colors.white,
                              width: 30,
                              height: 30,
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                onTap: () {
                                  setState(() {
                                    widget.cart.add(item);
                                    notifyListeners();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 100,
                            height: 40,
                            child: Card(
                              elevation: 3,
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  'GHs ' + item.price.toString(),
                                  style: const TextStyle(
                                      backgroundColor: Colors.amber,
                                      color: Colors.blue,
                                      fontSize: 18),
                                ),
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
                            builder: (context) => DetailsPage(
                                title: item.name,
                                item: item,
                                cart: widget.cart)));
                  },
                ),
              );
            }),
      ),
    );
  }
}
