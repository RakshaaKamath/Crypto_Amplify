import 'package:flutter/material.dart';
import 'package:crypto/View/navBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key}) ;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/image/1.gif'),
                Column(
                  children: [
                    Text('MAD project!',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rajest Raksha Sameer',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth*0.14),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
                      }
                      ,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFBC700),
                            borderRadius: BorderRadius.circular(50)
                        ),

                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.05,
                            vertical: myHeight * 0.013),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Explore!',
                              style : TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),)
                          ],
                        ),
                      ),
                    )
                )],
            ),

          ),
        ));
  }
}
