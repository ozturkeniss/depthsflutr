import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../ocean_depths_page.dart';
import '../space_journey_page.dart';
import '../forest_path_page.dart';
import '../mountain_peak_page.dart';

class CarouselCards extends StatefulWidget {
  const CarouselCards({super.key});

  @override
  State<CarouselCards> createState() => _CarouselCardsState();
}

class _CarouselCardsState extends State<CarouselCards>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _cards = [
    {
      'title': 'Ocean Depths',
      'subtitle': 'Explore the deep blue',
      'icon': 'assets/abstract1.svg',
      'color': [0xFF00FFFF, 0xFF00BFFF],
    },
    {
      'title': 'Space Journey',
      'subtitle': 'Reach for the stars',
      'icon': 'assets/abstract2.svg',
      'color': [0xFF8A2BE2, 0xFF4B0082],
    },
    {
      'title': 'Forest Path',
      'subtitle': 'Walk through nature',
      'icon': 'assets/abstract3.svg',
      'color': [0xFF32CD32, 0xFF228B22],
    },
    {
      'title': 'Mountain Peak',
      'subtitle': 'Climb to the top',
      'icon': 'assets/abstract4.svg',
      'color': [0xFFFF6347, 0xFFDC143C],
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    
    // Auto scroll
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _nextCard();
        _animationController.reset();
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  void _nextCard() {
    if (_currentIndex < _cards.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToPage(BuildContext context, int cardIndex) {
    Widget page;
    switch (cardIndex) {
      case 0:
        page = const OceanDepthsPage();
        break;
      case 1:
        page = const SpaceJourneyPage();
        break;
      case 2:
        page = const ForestPathPage();
        break;
      case 3:
        page = const MountainPeakPage();
        break;
      default:
        page = const OceanDepthsPage();
    }
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Collections',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index % _cards.length;
                });
              },
              itemBuilder: (context, index) {
                final cardIndex = index % _cards.length;
                final card = _cards[cardIndex];
                final isActive = index == _currentIndex;
                
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    children: [
                      // Main Card
                      GestureDetector(
                        onTap: () => _navigateToPage(context, cardIndex),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(card['color'][0]).withOpacity(0.3),
                                Color(card['color'][1]).withOpacity(0.2),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.cyan.withOpacity(isActive ? 0.4 : 0.2),
                              width: isActive ? 2 : 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.cyan.withOpacity(isActive ? 0.2 : 0.1),
                                blurRadius: isActive ? 15 : 8,
                                spreadRadius: isActive ? 2 : 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  card['icon'],
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  card['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  card['subtitle'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.cyan.shade300,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.cyan.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.cyan.withOpacity(0.4),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                      color: Colors.cyan.shade300,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Reflection
                      Positioned(
                        bottom: -20,
                        left: 8,
                        right: 8,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(3.14159),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(card['color'][0]).withOpacity(0.1),
                                  Colors.transparent,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _cards.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentIndex
                      ? Colors.cyan.shade300
                      : Colors.cyan.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
