import 'package:flutter/material.dart';
import 'package:just_app/screens/cart.dart';
import 'package:just_app/screens/details.dart';
import 'package:just_app/screens/dishes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:just_app/screens/fashions.dart';
import 'package:just_app/screens/phones.dart';
import 'package:just_app/utils/utils.dart';
import 'package:marquee_widget/marquee_widget.dart';

import 'comps.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.cart}) : super(key: key);

  final List? cart;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List fashion = Utils().populateFashions();
    List phones = Utils().populatePhones();
    List picks = Utils().populatePicks();
    List dishes = Utils().populateDishes();
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        drawer: navigationDrawer(),
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('Grid',
                style: TextStyle(fontFamily: 'Lobster', fontSize: 40)),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart,
                          size: 45,
                        ),
                        if (widget.cart!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.yellow,
                              foregroundColor: Colors.blue,
                              child: Text(
                                widget.cart!.length.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cart(
                                    cart: widget.cart!,
                                  )));
                    },
                  )),
            ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: width,
                  color: Colors.blue,
                  child: const Text(
                    'Trending',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 24,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: width,
                height: 70,
                child: Marquee(
                  backwardAnimation: Curves.easeInBack,
                  directionMarguee: DirectionMarguee.oneDirection,
                  direction: Axis.horizontal,
                  child: Container(
                    color: Colors.amber,
                    child: Row(children: const [
                      Icon(
                        Icons.phone_android,
                        color: Colors.blue,
                      ),
                      Text(
                        'Phones and Accessories',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Icon(
                        Icons.shop,
                        color: Colors.green,
                      ),
                      Text(
                        'Fashion',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.set_meal,
                        color: Colors.pink,
                      ),
                      Text(
                        'Dishes',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      Icon(
                        Icons.computer,
                        color: Colors.red,
                      ),
                      Text(
                        'Computer and Accessories',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.electrical_services,
                        color: Colors.purple,
                      ),
                      Text(
                        'Other Electrical Appliances',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                    ]),
                  ),
                ),
              ),
              Container(
                  width: width,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Selected For You',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 24,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                width: width,
                height: 200,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          reverse: true,
                          viewportFraction: 1.5,
                          enableInfiniteScroll: true,
                          height: 200.0,
                          autoPlay: true,
                          scrollDirection: Axis.horizontal),
                      items: picks.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              child: SizedBox(
                                width: width * 0.8,
                                child: Stack(
                                  fit: StackFit.loose,
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: width,
                                      height: 200,
                                      child: i.img,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 100,
                                        height: 40,
                                        child: Card(
                                          elevation: 3,
                                          color: Colors.amber,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Center(
                                            child: Text(
                                              'GHs ' + i.price.toString(),
                                              style: const TextStyle(
                                                  backgroundColor: Colors.amber,
                                                  color: Colors.blueGrey,
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
                                            title: i.name,
                                            item: i,
                                            cart: widget.cart!)));
                              },
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                  width: width,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dishes',
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 18,
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Dishes(cart: widget.cart!)));
                        },
                      ),
                    ],
                  )),
              SizedBox(
                width: width,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    var item = dishes[index];
                    return GestureDetector(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  item.img,
                                  Center(
                                    child: Text(item.name),
                                  ),
                                ],
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
                                    cart: widget.cart!)));
                      },
                    );
                  },
                ),
              ),
              Container(
                  width: width,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fashion',
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 18,
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Fashions(cart: widget.cart!)));
                        },
                      ),
                    ],
                  )),
              SizedBox(
                width: width,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    var item = fashion[index];
                    return GestureDetector(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  item.img,
                                  Center(
                                    child: Text(item.name),
                                  ),
                                ],
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
                                cart: widget.cart!),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                  width: width,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Phones and Accessories',
                        style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 18,
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Phones(cart: widget.cart!),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
              SizedBox(
                width: width,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    var item = phones[index];
                    return GestureDetector(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  item.img,
                                  Center(
                                    child: Text(item.name),
                                  ),
                                ],
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
                                cart: widget.cart!),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                width: width,
                child: Wrap(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                        ),
                        Text(
                          '#We dey for you',
                          style: TextStyle(fontFamily: 'Lobster'),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.yellow,
                        ),
                        Text(
                          '#We dey all the regions',
                          style: TextStyle(fontFamily: 'Lobster'),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                        ),
                        Text(
                          '#We dey Ghana',
                          style: TextStyle(fontFamily: 'Lobster'),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: Colors.blue,
                        ),
                        Text(
                          '#We dey Worldwide',
                          style: TextStyle(fontFamily: 'Lobster'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  navigationDrawer() {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/back.jpeg',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                  const Text(
                    ' Categories',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontFamily: 'Lobster'),
                  ),
                ],
              )),
          Container(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: const [
                    Icon(Icons.shop, color: Colors.amber, size: 40),
                    Text(
                      ' Fashion',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Fashions(cart: widget.cart!)));
                },
              ),
            ),
          ),
          Container(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: const [
                    Icon(Icons.set_meal, color: Colors.amber, size: 40),
                    Text(
                      ' Dishes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dishes(cart: widget.cart!)));
                },
              ),
            ),
          ),
          Container(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: const [
                    Icon(Icons.phone_android, color: Colors.amber, size: 40),
                    Text(
                      ' Phones and Accessories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Phones(cart: widget.cart!)));
                },
              ),
            ),
          ),
          Container(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Row(
                  children: const [
                    Icon(Icons.computer, color: Colors.amber, size: 40),
                    Text(
                      ' Computer and Accessories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lobster',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Computers(cart: widget.cart!)));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
