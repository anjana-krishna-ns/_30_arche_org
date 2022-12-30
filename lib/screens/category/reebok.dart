import 'package:arche_org/screens/Home_page/detailPage/detail_ree_3.dart';
import 'package:arche_org/screens/Home_page/detailPage/detail_ree_4.dart';
import 'package:flutter/material.dart';
import '../Home_page/detailPage/detail_ree_1.dart';
import '../Home_page/detailPage/detail_ree_2.dart';
class Reebok_cat extends StatefulWidget {
  const Reebok_cat({Key? key}) : super(key: key);

  @override
  State<Reebok_cat> createState() => _Reebok_catState();
}

class _Reebok_catState extends State<Reebok_cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        actions: [
          Icon(Icons.arrow_back_rounded)
        ],
      ),
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Ree_1_detail()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/reebok_org.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Ree_2_detail()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/reebok_2_ex1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Ree_3_detail()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/reebok_3_org.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Ree_4_detail()));
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
          ],
        ),
      ),
    );
  }
}
