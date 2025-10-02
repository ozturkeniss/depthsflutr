import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Rotation animation
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    
    // Scale animation
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    // Start rotation immediately
    _rotationController.repeat();
    
    // Wait 300ms then start scale animation
    await Future.delayed(const Duration(milliseconds: 300));
    _scaleController.forward();
    
    // Wait for splash to complete then navigate
    await Future.delayed(const Duration(milliseconds: 2500));
    
    if (mounted) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const MyHomePage(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000B1D),
              Color(0xFF001A3A),
              Color(0xFF002D5A),
              Color(0xFF001122),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Dragon Spinner
              AnimatedBuilder(
                animation: Listenable.merge([_rotationController, _scaleController]),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationController.value * 2 * 3.14159,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                            BoxShadow(
                              color: Colors.cyan.withOpacity(0.3),
                              blurRadius: 50,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/dragon_spinner.svg',
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 40),
              
              // App Title
              Text(
                'Explor Rer',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      color: Colors.cyan.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 15),
              
              // Subtitle
              Text(
                'explore the world',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.cyan.shade300,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1,
                ),
              ),
              
              const SizedBox(height: 60),
              
              // Loading dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLoadingDot(0),
                  const SizedBox(width: 8),
                  _buildLoadingDot(200),
                  const SizedBox(width: 8),
                  _buildLoadingDot(400),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingDot(int delay) {
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (context, child) {
        final animationValue = (_rotationController.value * 3 + delay / 1000) % 1;
        final opacity = (1 - (animationValue - 0.5).abs() * 2).clamp(0.0, 1.0);
        
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.cyan.withOpacity(opacity * 0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withOpacity(opacity * 0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
