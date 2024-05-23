import 'package:flutter/material.dart';
import 'package:netstorere/screen/login/login_screen.dart';

class WelPage1 extends StatefulWidget {
  const WelPage1({super.key});

  @override
  _WelPage1State createState() => _WelPage1State();
}

class _WelPage1State extends State<WelPage1> {
  final List<String> images = [
    'image/welcome/Wel1.jpg',
    'image/welcome/Wel2.jpg',
    'image/welcome/Wel3.jpg',
    'image/welcome/Wel4.jpg',
    'image/welcome/Wel5.jpg',
    'image/welcome/Wel6.jpg',
    'image/welcome/Wel7.jpg',
    'image/welcome/Wel8.jpg',
  ];

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
        _pageController.animateToPage(currentIndex,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LogScreen()),
        ).then((_) {
          currentIndex = 0;
          _pageController = PageController(initialPage: currentIndex);
        });
      }
    });
  }

  void skipToNewPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LogScreen()),
    ).then((_) {
      currentIndex = 0;
      _pageController = PageController(initialPage: currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: images.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color.fromARGB(0, 255, 193, 7),
              height: 55,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: skipToNewPage,
                      child: Container(
                        height: 55,
                        color: const Color.fromARGB(0, 255, 255, 255),
                        child: const Center(
                            child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: nextPage,
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 46, 152, 227),
                              Color.fromARGB(255, 113, 44, 231),
                            ],
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
