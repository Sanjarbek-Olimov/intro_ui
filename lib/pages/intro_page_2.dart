import 'package:flutter/material.dart';
import 'package:intro_ui/utils/string_utils.dart';

import 'home_page.dart';

class IntroPage2 extends StatefulWidget {
  static const String id = "intro_page_2";
  const IntroPage2({Key? key}) : super(key: key);

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  int _selectIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                _selectIndex = index;
              });
            },
            controller: _pageController,
            children: [
              _pages("assets/images/image_1.png", Strings.stepOneTitle,
                  Strings.stepOneContent),
              _pages("assets/images/image_2.png", Strings.stepTwoTitle,
                  Strings.stepTwoContent),
              _pages("assets/images/image_3.png", Strings.stepThreeTitle,
                  Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.8, bottom: MediaQuery.of(context).size.height*0.05),
            child:  MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, HomePage.id);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                    color: Color.fromRGBO(255, 120, 120, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            )
          )
        ],
      ),
    );
  }
  Widget _pages(String image, String title, String content) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color.fromRGBO(255, 120, 120, 1), fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Image(
            height: 250,
            width: 250,
            image: AssetImage(image),
          ),


        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 120, 120, 1), borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (_selectIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
