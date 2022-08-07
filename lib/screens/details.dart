// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:just_app/utils/utils.dart';
import '../utils/colors.dart';
import '../widgets/cart_widget.dart';
import 'package:sizer/sizer.dart';

//Shows the deatails of the products when the product gets clicked on on the homepage.

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.item}) : super(key: key);
  var item;

  @override
  // ignore: no_logic_in_create_state, library_private_types_in_public_api
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<DetailsPage> with ChangeNotifier {
  bool onclick = false;

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
    DetailsState().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors.primaryColor,
          leading: const BackButton(),
          title: Text(widget.item.name,
              style: const TextStyle(fontFamily: 'Lobster')),
          actions: [MyCart(cart: cart)]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(2.h),
              height: 40.h,
              child: Image.asset(
                widget.item.img,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              widget.item.name,
              style: const TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 2.h,
            ),
            RichText(
                text: TextSpan(
                    text: 'Price: ',
                    style:
                        TextStyle(fontSize: 12.sp, color: MyColors.blackColor),
                    children: [
                  TextSpan(
                    text: 'GHs ${widget.item.price}',
                    style: TextStyle(
                        fontSize: 15.sp, color: MyColors.primaryColor),
                  ),
                ])),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyColors.yellowColor)),
                  onPressed: () {
                    setState(() {
                      cart.add(widget.item);
                      Hive.box('UserDetails').put('cart', widget.item);
                      notifyListeners();
                    });
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: MyColors.primaryColor,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(color: MyColors.blackColor),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: onclick == false
                      ? const Icon(
                          Icons.favorite_border,
                          color: MyColors.primaryColor,
                          size: 40,
                        )
                      : const Icon(Icons.favorite,
                          color: MyColors.primaryColor, size: 40),
                  onTap: () {
                    if (onclick == false) {
                      setState(() {
                        onclick = true;
                        Utils().showSnackbar(context, "Added to favorites");
                        //Hive.box('UserDetails').put('Favorites', (widget.item));
                      });
                    } else {
                      setState(() {
                        onclick = false;
                        Utils().showSnackbar(context, "Removed from favorites");
                        //Hive.box('UserDetails').put('Favorites', (widget.item));
                      });
                    }
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
    );
  }
}
