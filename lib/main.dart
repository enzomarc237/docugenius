import 'package:docugenius/ai_assistant_panel.dart';
import 'package:docugenius/overview_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'DocuGenius',
      theme: MacosThemeData.light().copyWith(
        primaryColor: const Color(0xFF3B82F6),
      ),
      darkTheme: MacosThemeData.dark().copyWith(
        primaryColor: const Color(0xFF3B82F6),
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 250,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/logo.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text('DocuGenius'),
                  ],
                ),
                const SizedBox(height: 20),
                SidebarItems(
                  currentIndex: _pageIndex,
                  onChanged: (index) {
                    setState(() => _pageIndex = index);
                  },
                  selectedColor: const Color(0xFF3B82F6),
                  items: const [
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.square_grid_2x2),
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
                      leading: MacosIcon(CupertinoIcons.person_2),
                      label: Text('Team'),
                    ),
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.book),
                      label: Text('Learning'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        bottom: const Padding(
          padding: EdgeInsets.all(8.0),
          child: MacosListTile(
            leading: MacosIcon(CupertinoIcons.settings),
            title: Text('Settings'),
          ),
        ),
      ),
      child: MacosScaffold(
        toolBar: ToolBar(
          title: const Text('Overview'),
          actions: [
            CustomToolbarItem(
              inToolbarBuilder: (context) => const MacosSearchField(),
            ),
            CustomToolbarItem(
              inToolbarBuilder: (context) => const SizedBox(width: 20),
            ),
            CustomToolbarItem(
              inToolbarBuilder: (context) => ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAx99WJORnw8KB-CPMeHTS4rpukQgv_8UMZ2m402SKwJt_fqM7SEBNth4oLklVLJburXk26QAmz9_sBMuWvg786u4qB-aqLNukbIYQTtWRJrTGeSC1lNeVkiXzlcNl4PODDl2rOKmUTmZUjepDu7_DeT_9uXDOl4P9Pmn_UJGTjDwtLaSl37LZ-vjp35Ek6KucZvT-zDowbes4P6rWTSVQOIN7Z8JGbbh24bBclnFtpFQGfPSyfAkyIfNz5Lam_0MKGG-8dBPcH7NvE',
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          ],
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return IndexedStack(
                index: _pageIndex,
                children: const [
                  OverviewPage(),
                  Center(child: Text('Search')),
                  Center(child: Text('Docs')),
                  Center(child: Text('Projects')),
                  Center(child: Text('Team')),
                  Center(child: Text('Learning')),
                ],
              );
            },
          ),
          ResizablePane(
            minSize: 250,
            startSize: 300,
            resizableSide: ResizableSide.left,
            builder: (_, __) {
              return const AiAssistantPanel();
            },
          ),
        ],
      ),
    );
  }
}
