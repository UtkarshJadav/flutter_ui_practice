import 'package:flutter/material.dart';
import '../authentication/login_screen.dart';
import 'package:flutter_demo/models/walk_thorough_model.dart';
import '/../constants/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorNavyBlue,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Hero(
                tag: 'logo',
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ic_splash.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                ),
              ),
              child: Center(
                child: PageView.builder(
                  pageSnapping: true,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              pageViewItems[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              pageViewItems[index].subTitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: pageViewItems.length, // Can be null
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: primaryGreen,
                child: const Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(
                    () {
                      currentIndex < 2
                          ? pageController.animateToPage(++currentIndex,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.bounceInOut)
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                dotsCount: pageViewItems.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(12.0),
                  activeSize: const Size(30.0, 12.0),
                  activeColor: colorNavyBlue,
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<WalkThroughModel> pageViewItems = [
  WalkThroughModel(
      title: 'Welcome to FarmIt',
      subTitle:
          'Empowering farmers with information tools & Technologies at fingertips'),
  WalkThroughModel(
      title: 'Smart Suggestions',
      subTitle:
          'Empowering farmers with information tools & Technologies at fingertips'),
  WalkThroughModel(
      title: 'Watch, Learn & Grow',
      subTitle:
          'Empowering farmers with information tools & Technologies at fingertips')
];
