import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String dummy = "";
  SharedPreferences? logindata;
  String? usernumber;
  String?name;
  String?email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      usernumber = logindata?.getString('usernumber');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Padding(padding: EdgeInsets.all(30)),
                SizedBox(height: 40),
                //   Text("Number :",style: GoogleFonts.poppins( fontSize: 15,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.black54)
                // ),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'NAME : ',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    (name == null)
                        ? Text("$dummy")
                        : Text(
                      name!,
                      style: (GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'EMAIL : ',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    (email == null)
                        ? Text("$dummy")
                        : Text(
                      email!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Phone number : ',
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    (usernumber == null)
                        ? Text("$dummy")
                        : Text(
                      "$usernumber",
                      style: (GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                // SizedBox(height: 40),
                // ElevatedButton(
                //   onPressed: () {
                //     signOutGoogle();
                //     Navigator.of(context).pushAndRemoveUntil(
                //         MaterialPageRoute(builder: (context) {
                //           return Barnew();
                //         }), ModalRoute.withName('/'));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text(
                //       'Back',
                //       style: TextStyle(fontSize: 25, color: Colors.white),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}