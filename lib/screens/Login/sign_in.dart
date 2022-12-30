import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../screens/Home_page/Navigation bar.dart';
import '../../../screens/Home_page/home.dart';
import '../../../screens/Login/Forgot.dart';
import '../Home_page/firebase.dart';
import '../profile_page/profile_1.dart';
import 'Register_page.dart';
class signinn extends StatefulWidget {
  const signinn({Key? key}) : super(key: key);

  @override
  State<signinn> createState() => _signinnState();
}

class _signinnState extends State<signinn> {
  bool _visible = true;
   final _formkey = GlobalKey<FormState>();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  SharedPreferences ? logindata;
  bool ? newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Navbar1()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          alignment: Alignment.center,
                          width: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white24,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                            controller: email_controller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(5),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
                                icon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.black,
                                )),
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
                            onSaved: (value1) {
                              //email = value1!;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(

                          margin: EdgeInsets.only(left: 30, right: 30),
                          width: 450,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white24,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: password_controller,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _visible,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      show();
                                    },
                                    child: Icon((Icons.remove_red_eye_outlined),
                                      color: Colors.black,)),
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10),
                                hintText: " password",
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                )),
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
                                //  writedData();
                              } else {
                                return "Password should Contain at least 1 symbol,Uppercase or number";
                              }
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(50)),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => registerpage()));
                              },
                              child: Text("create a account?"),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                                },
                                child: Text(("ForgotPassword"),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),)
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: StadiumBorder()),
                              onPressed: () {
                                String email = email_controller.text;
                                String password = password_controller.text;
                                if (email != '' && password != '') {
                                  print('Successfull');
                                  logindata?.setBool('login', true);
                                  logindata?.setString('email', email);
                                  if (_formkey.currentState!.validate()) {
                                    // writedData();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Navbar1()));
                                  }
                                }
                              },
                              child: Text("LOG IN")),
                        ),
                        //   _signInButton()
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _signInButton() {
  //   return OutlinedButton(
  //     //splashColor: Colors.grey,
  //     onPressed: () {
  //       signInWithGoogle().then((result) {
  //         if (result != null) {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return HomePage();
  //               },
  //             ),
  //           );
  //         }
  //       });
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/images/google.png"), height: 35.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Google',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  void show() {
    setState(() {
      _visible = !_visible;
    });
  }
}