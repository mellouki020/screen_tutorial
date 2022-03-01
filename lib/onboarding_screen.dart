import 'package:flutter/material.dart';
import 'package:screens_tutorial/intro_screens/intro_page_1.dart';
import 'package:screens_tutorial/intro_screens/intro_page_2.dart';
import 'package:screens_tutorial/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_page.dart';

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // controller to keep track of which page we' re on
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           PageView(
              controller: _controller,
              onPageChanged: (index){
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ],
           ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            //skip
              GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                  },
                child: Text('skip'),
              ),

              //dot indicator
              SmoothPageIndicator(controller: _controller, count: 3),
              //next or done
              onLastPage ?
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                    return HomePage();
                    },
                   ),
                  );
                },
                child: Text('done'),
              ):
              GestureDetector(
                onTap: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: Text('next'),
              ),
              ],
           ),
          ),
        ],
      ),
    );
  }
}




