import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SvgPicture.asset(
        'assets/message_icon.svg',
        width: 24,
        height: 24,
      ),
    );
  }
}
