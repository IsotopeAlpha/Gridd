import 'package:flutter/material.dart';
import 'package:just_app/models/authentication_helper.dart';
import 'package:just_app/models/user.dart';
import 'package:just_app/screens/register.dart';
import 'package:just_app/screens/tab_manager.dart';
import 'package:just_app/utils/utils.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> implements LoginCallBack {
  late String username;
  late String password;
  final _formKey = GlobalKey<FormState>();
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    LoginResponse _response = LoginResponse(this);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: width * 0.8,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Username Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        username = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                        label: const Text('Username'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
                Container(
                  height: 100,
                  width: width * 0.8,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: hidden,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Password Required';
                      } else if (value.length < 5) {
                        return 'Password must be greater that 5 characters';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      suffixIcon: hidden
                          ? GestureDetector(
                              child: const Icon(Icons.visibility),
                              onTap: () {
                                setState(() {
                                  hidden = false;
                                });
                              },
                            )
                          : GestureDetector(
                              child: const Icon(Icons.visibility_off),
                              onTap: () {
                                setState(() {
                                  hidden = true;
                                });
                              },
                            ),
                      label: const Text('Password'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Utils().showProgress(context);
                      _response.doLogin(username, password);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text('Login'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: const Text(
                    'Register Instead',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String error) {}

  @override
  void onLoginSuccess(User user) {
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const TabsManager()));
  }
}
