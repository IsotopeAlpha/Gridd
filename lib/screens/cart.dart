import 'package:flutter/material.dart';
import 'package:just_app/screens/checkout.dart';
import 'package:just_app/screens/tab_manager.dart';
import 'package:just_app/utils/utils.dart';

class Cart extends StatefulWidget {
  final List cart;

  const Cart({Key? key, required this.cart}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _CartState createState() => _CartState(cart);
}

class _CartState extends State<Cart> with ChangeNotifier {
  _CartState(cart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            dispose();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const TabsManager()));
          },
        ),
        title: const Text('Cart', style: TextStyle(fontFamily: 'Lobster')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
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
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: const Icon(
                Icons.remove_shopping_cart,
                size: 30,
              ),
              onTap: () {
                setState(() {
                  widget.cart.length = 0;
                  notifyListeners();
                });
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blueGrey,
        child: widget.cart.isEmpty
            ? const Center(
                child: Text(
                  'Cart Empty',
                  style: TextStyle(
                      fontFamily: 'Lobster', color: Colors.white, fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: widget.cart.length,
                itemBuilder: (context, index) {
                  var item = widget.cart[index];
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: Card(
                      color: Colors.amber,
                      elevation: 4,
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: item.img,
                        ),
                        title: Text(item.name),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              widget.cart.remove(item);
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
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        onPressed: () {
          if (widget.cart.isEmpty) {
            Utils().showSnackbar(
                context, 'Add at least one item to cart to checkout');
          } else {
            showAlertDialog(context);
          }
        },
        label: Row(
          children: const [
            Icon(Icons.double_arrow_sharp),
            Text(
              'Checkout',
              style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Center(
          child: Text(
        'Checkout',
        style:
            TextStyle(fontFamily: 'Lobster', fontSize: 30, color: Colors.amber),
      )),
      backgroundColor: Colors.blueGrey,
      content: const Text(
        'Proceed to Payment?',
        style: TextStyle(fontSize: 20, color: Colors.white),
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
                    Icon(Icons.arrow_back_ios),
                    Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Checkout(cart: widget.cart)));
              },
              child: Row(
                children: const [
                  Text('Proceed to Payment'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
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
