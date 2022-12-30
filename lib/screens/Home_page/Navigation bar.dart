import 'package:arche_org/screens/Cart/cart_screen.dart';
import 'package:arche_org/screens/Home_page/banner.dart';
import 'package:arche_org/screens/Login/sign_in.dart';
import 'package:arche_org/screens/profile_page/profile_1.dart';
import 'package:flutter/material.dart';
import 'package:moony_nav_bar/moony_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Wish_list/wishPage.dart';
import 'home.dart';
class Navbar1 extends StatefulWidget {
  const Navbar1({Key? key}) : super(key: key);

  @override
  State<Navbar1> createState() => _Navbar1State();
}
class _Navbar1State extends State<Navbar1> {
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
  Widget _screen1 = HomePage();
  Widget _screen2 = Banner_();
  Widget _screen3 = My_profile();
  Widget _screen4 = CartPage();
  int selectedIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
     onWillPop: () async => false,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Text(
              ('Arche'),
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Wish()));
                  },
                  icon: Icon(Icons.favorite)),
              Padding(padding: EdgeInsets.all(5)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  },
                  icon: Icon(Icons.shopping_cart_rounded)),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Text('Home',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      softWrap: true),
                ),
                Container(
                  child: Text(
                    'Welcome \n $name\n $email \n $phone',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                  ),
                ),
                ListTile(
                  title: const Text('My account'),
                  leading: Icon((Icons.person), size: 20, color: Colors.black54),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => My_profile()));
                  },
                ),
                ListTile(
                  title: const Text('My cart'),
                  leading: Icon((Icons.shopping_cart_outlined),
                      size: 20, color: Colors.black54),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  },
                ),
                ListTile(
                  leading: Icon((Icons.favorite), size: 20, color: Colors.black54),
                  title: const Text('My wishlist'),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Wish()));
                  },
                ),
                ListTile(
                  title: const Text('My orders'),
                  leading: Icon(
                    (Icons.shopping_bag),
                    size: 20,
                    color: Colors.black54,
                  ),
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => CartPage()));
                  }, //look this<3
                ),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  width: 70,
                   child:TextButton(
                       style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                       ),
                          onPressed: () {
                          logindata!.setBool('login', true);
                         Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => signinn()));
                        },
                         child: Text(('LogOut'),style: TextStyle(color: Colors.black ),)

                   ),
                )
              ],
            ),
          ),
          body: getBody(),
          bottomNavigationBar: MoonyNavigationBar(
            items: <NavigationBarItem>[
              NavigationBarItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(0);
                  }),
              NavigationBarItem(
                  icon: Icons.category_outlined,
                  activeIcon: Icons.category,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(1);
                  }),

              NavigationBarItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(2);
                  }),
              NavigationBarItem(
                  icon: Icons.shopping_cart_outlined,
                  activeIcon: Icons.shopping_cart,
                  color: Colors.black,
                  onTap: () {
                    onTapHandler(3);
                  }),
            ],
            style: MoonyNavStyle(
             //
              indicatorPosition: IndicatorPosition.TOP,
              indicatorType: IndicatorType.POINT,
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        ),

      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._screen1;
    } else if (this.selectedIndex == 1) {
      return this._screen2;
    } else if (this.selectedIndex == 2) {
      return this._screen3;
    }
    return this._screen4;
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
  cleatText() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
