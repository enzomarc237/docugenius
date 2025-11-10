import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DocuGenius',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050814),
        primaryColor: const Color(0xFF3B82F6),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3B82F6),
          secondary: Color(0xFF8B5CF6),
          surface: Color(0xFF0B1020),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopToolbar(),
          Expanded(
            child: Row(
              children: [
                const LeftSidebar(),
                const VerticalDivider(width: 1, color: Color(0xFF1F2937)),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    child: const MainContent(),
                  ),
                ),
                const VerticalDivider(width: 1, color: Color(0xFF1F2937)),
                const RightSidebar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopToolbar extends StatelessWidget {
  const TopToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(
        color: Color(0xFF0B1020),
        border: Border(
          bottom: BorderSide(color: Color(0xFF1F2937)),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/docugenius_icon.svg',
            height: 24,
          ),
          const SizedBox(width: 8),
          const Text(
            'DocuGenius',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 48),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ask across your docs, APIs, and codebase…',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 48),
          const Icon(Icons.person_outline),
          const SizedBox(width: 24),
          const Icon(Icons.space_dashboard_outlined),
          const SizedBox(width: 24),
          const Icon(Icons.settings_outlined),
        ],
      ),
    );
  }
}

class LeftSidebar extends StatelessWidget {
  const LeftSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(24.0),
      color: const Color(0xFF0B1020),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SidebarItem(icon: Icons.dashboard_outlined, text: 'Overview'),
          SidebarItem(icon: Icons.search, text: 'Search'),
          SidebarItem(icon: Icons.description_outlined, text: 'Docs'),
          SidebarItem(icon: Icons.folder_outlined, text: 'Projects'),
          SidebarItem(icon: Icons.people_outline, text: 'Team'),
          SidebarItem(icon: Icons.school_outlined, text: 'Learning'),
          SidebarItem(icon: Icons.settings_outlined, text: 'Settings'),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  const SidebarItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome back',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: const [
            InfoCard(title: 'Recent Questions'),
            SizedBox(width: 24),
            InfoCard(title: 'Suggested Docs'),
            SizedBox(width: 24),
            InfoCard(title: 'Active Integrations'),
          ],
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF0B1020),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(24.0),
      color: const Color(0xFF0B1020),
      child: const Center(
        child: Text('AI Assistant thread'),
      ),
    );
  }
}
