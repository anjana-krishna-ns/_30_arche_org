import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Home_page/detailPage/detail_1.dart';

class converse extends StatefulWidget {
  const converse({Key? key}) : super(key: key);

  @override
  State<converse> createState() => _converseState();
}

class _converseState extends State<converse> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16
            ),
            scrollDirection: Axis.vertical,
            primary: false,
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ))),
              Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:  Icon(Icons.arrow_back,color: Colors.black,))),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org7.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org2.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org3.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org4.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org5.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage1()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/org6.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ]
        ),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.black,
      //         ),
      //         child: Text('Home', style: TextStyle(color: Colors.white,),
      //             softWrap: true),
      //       ), ListTile(
      //         title: const Text('My account'),
      //         leading: Icon((Icons.person), size: 20, color: Colors.black),
      //         onTap: () {},
      //       ),
      //
      //       ListTile(
      //         title: const Text('My cart'),
      //         leading: Icon((Icons.shopping_cart_outlined), size: 20,
      //             color: Colors.black),
      //
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: Icon((Icons.favorite), size: 20, color: Colors.black),
      //         title: const Text('My wishlist'),
      //         onTap: () {
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (_) => CartPage()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('My orders'),
      //         leading: Icon(
      //           (Icons.shopping_bag), size: 20, color: Colors.black,),
      //         onTap: () {
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (_) => CartPage()));
      //         }, //look this<3
      //       ), ListTile(
      //         title: const Text('log out'),
      //         leading: Icon((Icons.logout), size: 20, color: Colors.black,),
      //         onTap: () {
      //           Navigator.push(
      //               context, MaterialPageRoute(builder: (_) => signinn()));
      //         }, //look this<3
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

}
