import 'package:flutter/material.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '6 May Friday',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            const Text(
              '22/11',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/lightrain.png',
                  width: 30,
                ),
                const Text(
                  'Showers',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
