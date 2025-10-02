import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.cyan.shade300, Colors.blue.shade600],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          
          const SizedBox(width: 20),
          
          // Action Buttons
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton('assets/abstract1.svg'),
                _buildActionButton('assets/abstract2.svg'),
                _buildActionButton('assets/abstract3.svg'),
                _buildActionButton('assets/abstract4.svg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String assetPath) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
