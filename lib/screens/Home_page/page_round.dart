import 'package:flutter/material.dart';
class Round extends StatefulWidget {
  const Round({Key? key}) : super(key: key);

  @override
  State<Round> createState() => _RoundState();
}

class _RoundState extends State<Round> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(3)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text("Black"),
              ),
            ),
            Container(
              // margin: EdgeInsets.all(100),
             // CircleAvatar(backgroundColor: Colors.green),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/org6.png')
                )
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.greenAccent,image: DecorationImage(
                image: AssetImage('assets/images/org7.png')
              )
              ),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
