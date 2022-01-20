import 'package:flutter/material.dart';
import 'package:intro_ui/pages/home_page.dart';
import 'package:intro_ui/utils/string_utils.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _selectIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, HomePage.id);
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          )
        ],
      ),
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
          )
        ],
      ),
    );
  }

  Widget _pages(String image, String title, String content) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.only(bottom: 80, right: 40, left: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 250,
            width: 250,
            image: AssetImage(image),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
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
          color: Colors.green, borderRadius: BorderRadius.circular(5)),
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
