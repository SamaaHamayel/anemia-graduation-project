import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: double.infinity),
        height: 340,
        child: Column(
          children: [
            SmoothPageIndicator(controller: controller,
             count: 3,
             effect: ExpandingDotsEffect(
              spacing: 16,
              dotColor: Color(0xFFD9D9D9),
              activeDotColor:  Color(0xFF2BA3B4),

             ),
             onDotClicked: (index) => controller.animateToPage(
              index, duration: Duration(milliseconds: 500)
              , curve: Curves.easeIn),
             ),
             Text("title"),
             Text("description"),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: ()=> controller.jumpToPage(2),
                     child: Text("SKIP")),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: 
                    Duration(milliseconds: 500),
                     curve: Curves.bounceInOut),
                     child: Text("Next"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
