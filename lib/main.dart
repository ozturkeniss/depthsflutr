import 'package:flutter/material.dart';
import 'components/header.dart';
import 'components/discover_card.dart';
import 'components/message_button.dart';
import 'components/profile_section.dart';
import 'components/content_list.dart';
import 'components/carousel_cards.dart';
import 'components/bottom_navigation.dart';
import 'components/sidebar.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DepthsFlutr',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
              home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSidebarOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background + content
          Container(
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
            child: SafeArea(
              child: Column(
                children: [
                  Header(onMenuTap: () => setState(() => isSidebarOpen = true)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Explor Rer',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Text(
                            'explore the world',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.cyan.shade300,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const Expanded(child: DiscoverCard()),
                              const MessageButton(),
                            ],
                          ),
                          const ProfileSection(),
                          const ContentList(),
                          const CarouselCards(),
                          const SizedBox(height: 20),
                          const BottomNavigation(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Sidebar layer
          Sidebar(
            isOpen: isSidebarOpen,
            onDismiss: () => setState(() => isSidebarOpen = false),
            leftMargin: 16,
            topMargin: 24,
            bottomMargin: 24,
            width: 300,
          ),
        ],
      ),
    );
  }
}
