import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result({super.key});

  @override
  Widget build(BuildContext context) {
 return Container(  decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('lib/core/utils/appImages/images/background.png'),
              fit:
                  BoxFit.cover, // Optional: You can set the image fit as needed
            ),
          ),
   child: const Center(
        child: Text('my account'),
      ),
 );  }
}