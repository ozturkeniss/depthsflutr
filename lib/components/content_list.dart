import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContentList extends StatelessWidget {
  const ContentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildContentItem('assets/explore_icon.svg', 'Explore'),
                const SizedBox(width: 16),
                _buildContentItem('assets/abstract1.svg', 'Discover'),
                const SizedBox(width: 16),
                _buildContentItem('assets/abstract2.svg', 'Connect'),
                const SizedBox(width: 16),
                _buildContentItem('assets/abstract3.svg', 'Create'),
                const SizedBox(width: 16),
                _buildContentItem('assets/abstract4.svg', 'Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentItem(String assetPath, String title) {
    return Container(
      width: 70,
      height: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
          ),
          const SizedBox(height: 6),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: Colors.cyan.shade300,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
