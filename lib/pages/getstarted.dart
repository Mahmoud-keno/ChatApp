import 'package:chat/pages/loginpage.dart';
import 'package:chat/widgts/imagegetstarted.dart';
import 'package:flutter/material.dart';

class Getstarted extends StatelessWidget {
  const Getstarted({super.key});
  static String id = 'GetStarted';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: const Imagegetstarted(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const Text(
              'Enjoy the new experience of\n chatting with global friends',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Text(
              'Connect people around the world for free',
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 15, color: Color(0xff7A7A7A)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Loginpage.id);
                },
                child: const Text('Get started')),
          )
        ],
      ),
    );
  }
}
