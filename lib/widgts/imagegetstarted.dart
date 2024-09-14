import 'package:flutter/material.dart';

class Imagegetstarted extends StatelessWidget {
  const Imagegetstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 50),
      child: Row(
        children: [
          ColumnImage(),
          ColumnImage(),
        ],
      ),
    );
  }
}

class ColumnImage extends StatelessWidget {
  const ColumnImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 10 , vertical: 5 ),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(image: AssetImage('assets/images/man.png'))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
              child: Container(
              height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(image: AssetImage('assets/images/woman.png'))
                ),
              ),
            )
          ],
        );
  }
}