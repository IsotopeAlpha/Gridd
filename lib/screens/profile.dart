import 'package:flutter/material.dart';
import 'package:just_app/screens/orders.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String gender = 'Male';
  String name = "Israel Gayina";
  String username = 'Isotope';
  String id = '10902930';
  String phone = '+233594891672';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  child: const Text('Orders'),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Orders()));
                  },
                ),
              ),
              Stack(
                children: [
                  const SizedBox(height: 100),
                  ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: (AssetImage('assets/images/pic.jpg'))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width,
                height: 20,
              ),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 26, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: width,
                height: 10,
              ),
              Center(
                child: Text(
                  username,
                  style: const TextStyle(fontSize: 26, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: width,
                height: 10,
              ),
              SizedBox(
                width: width * 0.95,
                child: const Text(
                  'Customer ID',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: width * 0.9,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    label: Text(
                      id,
                      style: const TextStyle(color: Colors.black),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: 10,
              ),
              SizedBox(
                width: width * 0.95,
                child: const Text(
                  'Phone Number',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              SizedBox(
                width: width * 0.9,
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    label: Text(
                      phone,
                      style: const TextStyle(color: Colors.black),
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                  ),
                ),
              ),
              SizedBox(
                width: width,
                height: 10,
              ),
              SizedBox(
                width: width * 0.95,
                child: const Text(
                  'Gender',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RadioListTile(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = 'Male';
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Female'),
                    value: 'female',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = 'female';
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
