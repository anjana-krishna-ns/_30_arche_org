import 'package:arche_org/screens/Home_page/detailPage/detail_air_2.dart';
import 'package:arche_org/screens/Home_page/detailPage/detail_air_3.dart';
import 'package:flutter/material.dart';
import '../Home_page/detailPage/detail_air_1.dart';
import '../Home_page/detailPage/detail_air_4.dart';

class Air_cat extends StatefulWidget {
  const Air_cat({Key? key}) : super(key: key);

  @override
  State<Air_cat> createState() => _Air_catState();
}

class _Air_catState extends State<Air_cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        backgroundColor: Colors.black26,
      ),
      body: SafeArea(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
          scrollDirection: Axis.vertical,
          primary: false,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DetailAir1()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/air_org.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DetailAir3()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/air_3_org.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DetailAir2()));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/air1_org.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => DetailPage5()));
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
          ],
        ),
      ),
    );
  }
}
