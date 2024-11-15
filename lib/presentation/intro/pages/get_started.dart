import 'package:flutter/material.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/assets/app_images.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/intro_bg.png"))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}
