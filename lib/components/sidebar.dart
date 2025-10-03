import 'package:flutter/material.dart';
import '../main.dart';
import '../settings.dart';
import '../login.dart';
import '../ocean_depths_page.dart';
import '../space_journey_page.dart';
import '../forest_path_page.dart';
import '../mountain_peak_page.dart';

/// Sidebar widget to be placed inside a page-level Stack.
///
/// Features:
/// - Opens from the left with slide + fade animation
/// - Not full-height: configurable top/bottom margins
/// - Left side margin (gap from the screen edge)
/// - Tap outside to dismiss via [onDismiss]
///
/// Usage example (inside a Scaffold body):
///
/// Stack(
///   children: [
///     // Your page content
///     Sidebar(
///       isOpen: isSidebarOpen,
///       onDismiss: () => setState(() => isSidebarOpen = false),
///       leftMargin: 16,
///       topMargin: 24,
///       bottomMargin: 24,
///       width: 300,
///       child: YourMenuContent(),
///     ),
///   ],
/// )
class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.isOpen,
    required this.onDismiss,
    this.child,
    this.width = 300,
    this.leftMargin = 16,
    this.topMargin = 96,
    this.bottomMargin = 96,
    this.panelColor,
    this.elevation = 16,
    this.borderRadius = 20,
    this.animationDuration = const Duration(milliseconds: 280),
    this.animationCurve = Curves.easeOutCubic,
  });

  final bool isOpen;
  final VoidCallback onDismiss;
  final Widget? child;

  /// Fixed width of the sidebar panel.
  final double width;

  /// Gaps from screen edges.
  final double leftMargin;
  final double topMargin;
  final double bottomMargin;

  /// Panel visual styles.
  final Color? panelColor;
  final double elevation;
  final double borderRadius;

  /// Animation config.
  final Duration animationDuration;
  final Curve animationCurve;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenHeight = media.size.height;

    // Backdrop (click outside to close)
    final backdrop = IgnorePointer(
      ignoring: !isOpen,
      child: AnimatedOpacity(
        opacity: isOpen ? 1.0 : 0.0,
        duration: animationDuration,
        curve: animationCurve,
        child: GestureDetector(
          onTap: onDismiss,
          behavior: HitTestBehavior.opaque,
          child: Container(
            color: Colors.black.withOpacity(0.35),
          ),
        ),
      ),
    );

    // Panel
    // Respect device safe area (status bar / camera cutout / gesture area)
    final panelTop = media.padding.top + topMargin;
    final panelBottom = media.padding.bottom + bottomMargin;
    final panelLeft = leftMargin;
    final double panelHeight = (screenHeight - panelTop - panelBottom).clamp(0.0, screenHeight);

    final Color effectivePanelColor = panelColor ?? Colors.transparent;

    final panel = AnimatedPositioned(
      duration: animationDuration,
      curve: animationCurve,
      top: panelTop,
      bottom: panelBottom,
      left: isOpen ? panelLeft : -width - 40,
      width: width,
      child: AnimatedOpacity(
        duration: animationDuration,
        curve: animationCurve,
        opacity: isOpen ? 1.0 : 0.0,
        child: Material(
          color: effectivePanelColor,
          elevation: elevation,
          borderRadius: BorderRadius.circular(borderRadius),
          clipBehavior: Clip.antiAlias,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xF0000B1D),
                  Color(0xE0001A3A),
                  Color(0xD0002D5A),
                  Color(0xF0001122),
                ],
                stops: [0.0, 0.3, 0.7, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withOpacity(0.15),
                  blurRadius: 30,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
              border: Border.all(
                color: Colors.cyan.withOpacity(0.15),
                width: 1,
              ),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: width,
                maxWidth: width,
                minHeight: panelHeight,
                maxHeight: panelHeight,
              ),
              child: child ?? _DefaultSidebarContent(),
            ),
          ),
        ),
      ),
    );

    // The widget is meant to live inside a Stack; we return a positioned stack layer.
    return Positioned.fill(
      child: Stack(
        children: [
          backdrop,
          panel,
        ],
      ),
    );
  }
}

class _DefaultSidebarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      child: SafeArea(
        left: false,
        top: false, // we already provide top margin outside
        bottom: false, // bottom margin outside
        right: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu',
                style: textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Divider(height: 1, color: Colors.cyan.withOpacity(0.2)),
              const SizedBox(height: 12),
              // Primary navigation (placed first as requested)
              _SidebarNavItem(
                label: 'Home',
                icon: Icons.home,
                builder: (context) => const MyHomePage(),
              ),
              _SidebarNavItem(
                label: 'Login',
                icon: Icons.login,
                builder: (context) => const LoginPage(),
              ),
              _SidebarNavItem(
                label: 'Settings',
                icon: Icons.settings,
                builder: (context) => const SettingsPage(),
              ),
              const SizedBox(height: 12),
              Divider(height: 1, color: Colors.cyan.withOpacity(0.15)),
              const SizedBox(height: 12),
              _SidebarSquareNavItem(
                label: 'Ocean Depths',
                icon: Icons.water,
                builder: (context) => const OceanDepthsPage(),
              ),
              _SidebarSquareNavItem(
                label: 'Space Journey',
                icon: Icons.travel_explore,
                builder: (context) => const SpaceJourneyPage(),
              ),
              _SidebarSquareNavItem(
                label: 'Forest Path',
                icon: Icons.park,
                builder: (context) => const ForestPathPage(),
              ),
              _SidebarSquareNavItem(
                label: 'Mountain Peak',
                icon: Icons.terrain,
                builder: (context) => const MountainPeakPage(),
              ),
              const Spacer(),
              Opacity(
                opacity: 0.6,
                child: Text(
                  'v1.0.0',
                  style: textTheme.bodySmall?.copyWith(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarSquareNavItem extends StatelessWidget {
  const _SidebarSquareNavItem({
    required this.label,
    required this.icon,
    required this.builder,
  });

  final String label;
  final IconData icon;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = Colors.cyan.shade300;
    final Color textColor = Colors.white.withOpacity(0.9);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: builder),
          );
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0x3300FFFF),
                Color(0x2200BFFF),
              ],
            ),
            border: Border.all(color: Colors.cyan.withOpacity(0.35), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withOpacity(0.12),
                blurRadius: 12,
                spreadRadius: 1,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: [
              Icon(icon, size: 22, color: iconColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarNavItem extends StatelessWidget {
  const _SidebarNavItem({
    required this.label,
    required this.icon,
    required this.builder,
  });

  final String label;
  final IconData icon;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white.withOpacity(0.92);
    final Color iconColor = Colors.cyan.shade300;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: builder),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
        child: Row(
          children: [
            Icon(icon, size: 22, color: iconColor),
            const SizedBox(width: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}


