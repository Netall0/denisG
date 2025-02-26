import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profff/home/widget/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();
  bool firstPage = false;
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              lastPage = (index == 2);
            },
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2, // Множитель расширения активной линии
                    dotWidth: 24, // Ширина неактивной линии
                    dotHeight: 4, // Высота линий
                    spacing: 8, // Расстояние между линиями
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                ElevatedButton(
                    onPressed: () => lastPage
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()))
                        : _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                    child: Text('next'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
