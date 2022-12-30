import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body:  Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                  ),
                  onPressed: () {
              }, child: Text('Buy Now'))

                // InkWell(
                //   onTap: () {
                //   },
                //   child:Text('Buy Now')
                // ),
            ],
          ),
        ),
      ),
    );
  }
}