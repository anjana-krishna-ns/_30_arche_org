import 'package:arche_org/screens/Cart/cart_screen.dart';
import 'package:arche_org/screens/Home_page/banner.dart';
import 'package:arche_org/screens/Home_page/detailPage/detail_ree_4.dart';
import 'package:arche_org/screens/Home_page/home.dart';
import 'package:arche_org/screens/Login/Register_page.dart';
import 'package:arche_org/screens/Login/sign_in.dart';
import 'package:arche_org/screens/Wish_list/wishPage.dart';
import 'package:arche_org/screens/category/air_.dart';
import 'package:arche_org/screens/category/reebok.dart';
import 'package:arche_org/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'google_map/G_map.dart';
import 'google_map/Get_Address_From_Coordinates.dart';
import 'google_map/getUserCurrentLocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Georgia',
      ),
      debugShowCheckedModeBanner: false,
      //  home: registerpage(),
      //home: Counterr(),
     //home: Air_cat(),
      home: Convert_Lat_Long(),
      // home:signinn (),
    //  home: Ree_4_detail(),
        //home:Banner_ (),
      // home: MyDashboard(),
    );
  }
}
