// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:just_app/screens/details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:just_app/screens/fashions.dart';
import 'package:just_app/screens/login.dart';
import 'package:just_app/screens/orders.dart';
import 'package:just_app/screens/phones.dart';
import 'package:just_app/utils/utils.dart';
import 'package:just_app/widgets/cart_widget.dart';
import 'package:just_app/widgets/featured_widget.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/colors.dart';
import 'comps.dart';

//The main home tab

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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
  Widget build(BuildContext context) {
    List fashion = Utils().populateFashions();
    List phones = Utils().populatePhones();
    List picks = Utils().populatePicks();

    return Scaffold(
        backgroundColor: MyColors.primaryColor,
        drawer: navigationDrawer(),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: MyColors.primaryColor,
            title: const Text('Grid',
                style: TextStyle(fontFamily: 'Lobster', fontSize: 40)),
            actions: [MyCart(cart: cart)]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                color: MyColors.blueColor,
                child: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'Lobster',
                    color: MyColors.redColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: Marquee(
                  backwardAnimation: Curves.easeInBack,
                  directionMarguee: DirectionMarguee.oneDirection,
                  direction: Axis.horizontal,
                  child: Container(
                    color: MyColors.yellowColor,
                    padding: EdgeInsets.all(1.h),
                    child: Row(children: [
                      const Icon(
                        Icons.phone_android,
                        color: MyColors.blueColor,
                      ),
                      Text(
                        'Phones and Accessories',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryColor),
                      ),
                      const Icon(
                        Icons.shop,
                        color: Colors.green,
                      ),
                      Text(
                        'Fashion',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const Icon(
                        Icons.set_meal,
                        color: Colors.pink,
                      ),
                      Text(
                        'Dishes',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryColor),
                      ),
                      const Icon(
                        Icons.computer,
                        color: Colors.red,
                      ),
                      Text(
                        'Computer and Accessories',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: MyColors.whiteColor),
                      ),
                      const Icon(
                        Icons.electrical_services,
                        color: Colors.purple,
                      ),
                      Text(
                        'Other Electrical Appliances',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryColor),
                      ),
                    ]),
                  ),
                ),
              ),
              Container(
                  width: 100.w,
                  height: 5.h,
                  color: MyColors.blueColor,
                  child: Center(
                    child: Text(
                      'Selected For You',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 15.sp,
                          color: MyColors.whiteColor,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          reverse: true,
                          viewportFraction: 1.5,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          scrollDirection: Axis.horizontal),
                      items: picks.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              child: SizedBox(
                                width: 90.w,
                                child: Stack(
                                  fit: StackFit.loose,
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(i.img),
                                    Container(
                                      color: MyColors.whiteColor,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Text(
                                        'GHs: ${i.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: MyColors.blackColor,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsPage(item: i)));
                              },
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Featured(
                  cart: cart,
                  title: "Phone",
                  onViewTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Phones()));
                  },
                  item: phones),
              Featured(
                  cart: cart,
                  title: "Fashion",
                  onViewTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Fashions()));
                  },
                  item: fashion),
              SizedBox(
                width: 100.w,
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
      backgroundColor: MyColors.primaryColor,
      child: Column(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: MyColors.whiteColor),
              child: SizedBox(
                width: 100.w,
                child: Text(
                  ' Categories',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.yellowColor,
                      fontFamily: 'Lobster'),
                ),
              )),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Fashions()));
            },
            title: Text(
              ' Fashion',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Lobster',
                color: MyColors.whiteColor,
              ),
            ),
            leading: const Icon(
              Icons.shop,
              color: MyColors.yellowColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Computers()));
            },
            title: Text(
              'Computers',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Lobster',
                color: MyColors.whiteColor,
              ),
            ),
            leading: const Icon(
              Icons.computer,
              color: MyColors.yellowColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Phones()));
            },
            title: Text(
              'Phones And Accessories',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Lobster',
                color: MyColors.whiteColor,
              ),
            ),
            leading:
                const Icon(Icons.phone_android, color: MyColors.yellowColor),
          ),
          Divider(
            color: MyColors.whiteColor,
            thickness: 1.w,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Orders()));
            },
            title: Text(
              'My Orders',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Lobster',
                color: MyColors.whiteColor,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Lobster',
                color: MyColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
