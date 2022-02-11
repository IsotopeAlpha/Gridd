import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'cart.dart';

class Checkout extends StatefulWidget {
  final List cart;

  const Checkout({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _CheckoutState createState() => _CheckoutState(cart);
}

enum payment_method { cash, online }

class _CheckoutState extends State<Checkout> {
  _CheckoutState(List cart);

  int total = 0;
  late Box box1;
  // ignore: prefer_typing_uninitialized_variables
  var items;

  @override
  void initState() {
    super.initState();
    setState(() {
      total = calculateTotal();
      box1 = Hive.box('UserDetails');
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var item = widget.cart;
    items = item;
    payment_method pay = payment_method.cash;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Cart(
                          cart: widget.cart,
                        )));
          },
        ),
        backgroundColor: Colors.blueGrey,
        title: const Text('Checkout', style: TextStyle(fontFamily: 'Lobster')),
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
                        item.length.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Items',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: 'Lobster'),
                    ),
                    Text(
                      'Prices',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.amber,
                          fontFamily: 'Lobster'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 10,
            ),
            Container(
                color: Colors.blueGrey,
                width: width,
                height: 300,
                child: Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item[index].name,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
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
                        color: Colors.amber,
                        child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'GHs ' + item[index].price.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey,
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
            Container(
              color: Colors.grey[50],
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                    flex: 6,
                    child: Text(
                      'Total:',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontFamily: 'Lobster'),
                    )),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 20),
                      child: Text(
                        'GHs: ' + total.toString(),
                        style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontFamily: 'Lobster'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.grey[50],
              height: 10,
            ),
            Container(
              width: width,
              color: Colors.blueGrey,
              child: const Text(
                'Payment Method',
                style: TextStyle(
                    fontFamily: 'Lobster', fontSize: 26, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text(
                'Pay On Delivery',
                style: TextStyle(fontSize: 18),
              ),
              leading: Radio(
                splashRadius: 10,
                value: payment_method.cash,
                groupValue: pay,
                onChanged: (payment_method? value) {
                  setState(() {
                    pay = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Pay Online',
                style: TextStyle(fontSize: 18),
              ),
              leading: Radio(
                splashRadius: 4,
                value: payment_method.online,
                groupValue: pay,
                onChanged: (payment_method? value) {
                  setState(() {
                    pay = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        onPressed: () {
          showAlertDialog(context);
        },
        label: Row(
          children: const [
            Icon(Icons.double_arrow_sharp),
            Text(
              'Order',
              style: TextStyle(fontFamily: 'Lobster', fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog done = AlertDialog(
      title: const Center(
          child: Text(
        'Place Order',
        style:
            TextStyle(fontFamily: 'Lobster', fontSize: 30, color: Colors.amber),
      )),
      backgroundColor: Colors.blueGrey,
      content: Row(
        children: const [
          Icon(
            Icons.done_outline,
            size: 40,
            color: Colors.green,
          ),
          Text(
            'Order Placed Successfully',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Orders()));
          },
          child: const Text('Ok'),
        ),
      ],
    );
    AlertDialog alert = AlertDialog(
      title: const Center(
          child: Text(
        'Place Order',
        style:
            TextStyle(fontFamily: 'Lobster', fontSize: 30, color: Colors.amber),
      )),
      backgroundColor: Colors.blueGrey,
      content: const Text(
        'Finish placing order?',
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
                      'Review',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            ElevatedButton(
              onPressed: () {
                Hive.box('UserDetails').put('Orders', items);
                Hive.box('UserDetails').put('OrdersLength', items.length);

                // ignore: avoid_print
                print('Orders:  ${Hive.box('UserDetails').get('Orders')}');
                // ignore: avoid_print
                print(
                    'Orders length: ${Hive.box('UserDetails').get('OrdersLength')}');
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return done;
                    });
              },
              child: Row(
                children: const [
                  Text('Place Order'),
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

  calculateTotal() {
    int total = 0;
    for (int i = 0; i < widget.cart.length; i++) {
      total = widget.cart[i].price + total;
    }
    return total;
  }
}
