import 'package:arche_org/screens/Login/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Home_page/firebase.dart';
class My_profile extends StatefulWidget {
  @override
  _My_profileState createState() => _My_profileState();
}
class _My_profileState extends State<My_profile> {
  String dummy = "xxxx";
  SharedPreferences ? logindata;
  String ?email;
  String ? name;
  String? phone ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata?.getString('email')!;
      name = logindata?.getString('name')!;
      phone = logindata?.getString('phone')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
          children: [
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(30)),
               // CircleAvatar(backgroundColor: Colors.black,radius: 60),

                //
                // Text(
                //   'Welcome  $email \n $name \n $phone',
                //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                // ),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'NAME : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    (name == null)
                        ? Text("$dummy")
                        : Text(
                      name!,
                      style: (TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'EMAIL :$email ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    (email == null)
                        ? Text("$dummy")
                        : Text(
                      email!,
                      style: (TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10,),
                  Text('PHONE :$phone')
                ],)
              ],
            ),
          ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  logindata!.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => signinn()));
                },
                child: Text(('LogOut'),)
            )
          ],
        ),
      ),
    );
  }
}
