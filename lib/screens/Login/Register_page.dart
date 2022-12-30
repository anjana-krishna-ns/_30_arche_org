import 'dart:convert';
import 'package:arche_org/screens/Login/sign_in.dart';
import 'package:arche_org/screens/profile_page/profile_1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Home_page/Navigation bar.dart';

class registerpage extends StatefulWidget {
  @override
  _registerpageState createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  bool _visible = true;
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final name_controller = TextEditingController();
  final phone_controller = TextEditingController();
  final confirmPassword_controller = TextEditingController();
  SharedPreferences? logindata;
  bool? newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata!.getBool('Register') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => My_profile()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email_controller.dispose();
    password_controller.dispose();
    name_controller.dispose();
    phone_controller.dispose();
    confirmPassword_controller.dispose();
    super.dispose();
  }

  final _form = GlobalKey<FormState>();
  String? name, phone, email, password, confirmPassword;

  void writeData() async {
    _form.currentState?.save();
    var url = "https://arche-close-default-rtdb.firebaseio.com/" + "lol.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: _form,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Container(
                            child: Text(('Sign In'),
                              style: TextStyle(fontWeight: FontWeight.bold),)),
                      Padding(padding: EdgeInsets.all(10)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white24,
                          ),
                          width: 450,
                          margin: EdgeInsets.only(
                              right: 30, left: 30, bottom: 5, top: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.name,
                            controller: name_controller,
                          autofocus: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                                icon: Icon(
                                  (Icons.person),
                                  color: Colors.black54,
                                ),
                                hintText: "Enter name" ,hintStyle: TextStyle(color: Colors.black54)),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return "Enter Valid Name";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value1) {
                              name = value1!;
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        controller: phone_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              (Icons.phone),
                              color: Colors.black54,
                            ),
                            hintText: "Enter Phone Number"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid number';
                          }
                          if (value!.isEmpty ||
                              !RegExp(
                                 // r'^(?:[+0]9)?[0-9]{10}$')
                                  r'^[0-9]+$')
                                  .hasMatch(value)) {
                            return "Enter Valid number";
                          }
                          if (value.length < 10 || value.length > 10) {
                            return 'The number must be 10 digit';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value3) {
                          phone = value3!;
                        },
                      ),
                    ),
                    Container(
                      width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        controller: email_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon((Icons.mail),color: Colors.black54), hintText: "Enter Email"),
                        validator: (valuemail) {
                          if (valuemail!.isEmpty) {
                            return 'feild cant be empty';
                          }
                          if (!RegExp(
                              r"^[a-z]+[0-9]+(?!.*(?:\+{2,}|\-{2,}|\.{2, }))(?:[\.+\-]{0,1}[a-z0-9])*@gmail.com$")
                              .hasMatch(valuemail!)) {
                            return 'invalid email';
                          }
                          return null;
                        },
                        onSaved: (value4) {
                          email = value4!;
                        },

                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      width: 450,
                      margin: EdgeInsets.only(
                          right: 30, left: 30, bottom: 5, top: 5),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _visible,
                        controller: password_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                        show();
                                        },
                              child: Icon((Icons.remove_red_eye_outlined),color: Colors.black54,)),
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.black54,
                            ),
                            hintText: "Enter password"),
                        validator: (valuepassword) {
                          if (valuepassword!.isEmpty) {
                            return 'Enter your password';
                          }
                          if (valuepassword.length < 6) {
                            return 'Password must be more than 6 Letters';
                          }
                          if (valuepassword.length > 12) {
                            return 'Password must not be more than 12 Letters';
                          }
                          if (RegExp(
                              r'^(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$')

                              .hasMatch(valuepassword)) {
                            return null;
                          } else {
                            return "Password should Contain at least 1 symbol,Uppercase or number";
                          }
                        },
                        onSaved: (value5) {
                          password = value5!;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white24,
                      ),
                      width: 450,
                      margin: EdgeInsets.only(right: 30, left: 30),
                      child: TextFormField(
                        cursorColor:Colors.black,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _visible,
                        controller: confirmPassword_controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,

                            suffixIcon: GestureDetector(
                                onTap: () {
                                  show();
                                },
                                child: Icon((Icons.remove_red_eye_outlined),color: Colors.black54,)),
                            icon: Icon(
                              Icons.lock_outline,
                              color: Colors.black54,
                            ),
                            hintText: "Enter Confirm Password"),
                        validator: (valuepassword) {
                          if (valuepassword!.isEmpty) return 'Empty';
                          if (valuepassword != password_controller.text)
                            return 'Not Match';
                          return null;
                        },

                        onSaved: (value6) {
                          confirmPassword = value6!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black26,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          String email = email_controller.text;
                          String name = name_controller.text;
                          String phone = phone_controller.text;
                          String password = password_controller.text;
                          if (email != '' && password != '') {
                            print('Successfull');
                            logindata?.setBool('login', false);
                            logindata?.setString('email', email);
                            logindata?.setString('name', name);
                            logindata?.setString('phone', phone);
                          }
                          if (_form.currentState!.validate()) {
                            writeData();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Navbar1()));
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  Padding(padding: EdgeInsets.all(10)),
                  // TextButton(
                  //     style: ElevatedButton.styleFrom(
                  //     //     backgroundColor: Colors.black45,
                  //     ),                      onPressed: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => signinn(),));
                  // },
                  //   child: Text(('Log In'),style: TextStyle(color: Colors.black ),))
                  ],
                ),
              ),
            ),
        )
    );
  }
  void show() {
    setState(() {
      _visible = !_visible;
    });}
}
