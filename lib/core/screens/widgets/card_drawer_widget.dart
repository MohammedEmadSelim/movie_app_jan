import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardDrawerWidget extends StatelessWidget {
  const CardDrawerWidget({super.key, required this.cardText, required this.cardIcon});
  final String cardText;
  final Icon cardIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 80,
        child: Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                cardIcon,
                Gap(10),
                Text(
                  cardText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
