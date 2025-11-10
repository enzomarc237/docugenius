import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macos_ui/macos_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'DocuGenius',
      theme: MacosThemeData.dark(),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 240,
        builder: (context, scrollController) {
          return SidebarItems(
            currentIndex: _currentIndex,
            onChanged: (index) => setState(() => _currentIndex = index),
            items: const [
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.home),
                label: Text('Overview'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.search),
                label: Text('Search'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.doc),
                label: Text('Docs'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.folder),
                label: Text('Projects'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.group),
                label: Text('Team'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.book),
                label: Text('Learning'),
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.settings),
                label: Text('Settings'),
              ),
            ],
          );
        },
      ),
      child: ContentArea(
        builder: (context, scrollController) {
          return Column(
            children: [
              const TopToolbar(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24.0),
                        child: const MainContent(),
                      ),
                    ),
                    const RightSidebar(),
                  ],
                ),
              ),
            ],
          );
        },
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
      decoration: BoxDecoration(
        color: MacosTheme.of(context).canvasColor,
        border: Border(
          bottom: BorderSide(color: MacosTheme.of(context).dividerColor),
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
          const Spacer(),
          const MacosSearchField(
            placeholder: 'Ask across your docs, APIs, and codebase…',
          ),
          const Spacer(),
          MacosIconButton(
            icon: const MacosIcon(CupertinoIcons.person),
            onPressed: () {},
          ),
          MacosIconButton(
            icon: const MacosIcon(CupertinoIcons.square_grid_2x2),
            onPressed: () {},
          ),
          MacosIconButton(
            icon: const MacosIcon(CupertinoIcons.settings),
            onPressed: () {},
          ),
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
        const SizedBox(height: 24),
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
          color: MacosTheme.of(context).canvasColor,
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
      color: MacosTheme.of(context).canvasColor,
      child: const Center(
        child: Text('AI Assistant thread'),
      ),
    );
  }
}
