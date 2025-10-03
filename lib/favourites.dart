import 'dart:math';
import 'package:flutter/material.dart';
import 'components/header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();

  final List<String> _heartAssets = const [
    'assets/heart_glow_octopus.svg',
    'assets/heart_glow_dotted.svg',
    'assets/heart_glow_anchor.svg',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient aligned with main.dart
          Container(color: const Color(0xFF000916)),

          // Animated floating glowing hearts in the background
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return CustomPaint(
                  painter: _FloatingIconPainter(
                    progress: _controller.value,
                    assetCount: 12,
                  ),
                );
              },
            ),
          ),

          // Page content
          SafeArea(
            child: Column(
              children: [
                const Header(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          'Favourites',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.cyan.withOpacity(0.6),
                                blurRadius: 18,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Your saved places',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.cyan.shade300,
                            shadows: [
                              Shadow(
                                color: Colors.cyan.withOpacity(0.4),
                                blurRadius: 12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: ListView.separated(
                            itemCount: 6,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              return _FavouriteCard(index: index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FavouriteCard extends StatelessWidget {
  const _FavouriteCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.cyan.withOpacity(0.12),
            Colors.cyan.withOpacity(0.06),
          ],
        ),
        border: Border.all(color: Colors.cyan.withOpacity(0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.15),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          'assets/heart_glow_octopus.svg',
          width: 28,
          height: 28,
        ),
        title: Text(
          'Saved Place #${index + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          'A place you loved exploring',
          style: TextStyle(
            color: Colors.cyan.shade300,
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.cyan.shade300),
      ),
    );
  }
}

class _FloatingIconPainter extends CustomPainter {
  _FloatingIconPainter({required this.progress, this.assetCount = 10});

  final double progress;
  final int assetCount;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint glowPaint = Paint()
      ..color = Colors.cyan.withOpacity(0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 24);

    final Random random = Random(42);

    for (int i = 0; i < assetCount; i++) {
      final double t = (progress + i / assetCount) % 1.0;
      final double x = size.width * ((i * 73) % 100) / 100 + 40 * sin(2 * 3.1415 * t);
      final double y = size.height * t;

      final double r = 18 + (i % 3) * 6;

      canvas.drawCircle(Offset(x, y), r, glowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _FloatingIconPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.assetCount != assetCount;
  }
}

