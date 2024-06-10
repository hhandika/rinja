import 'package:rinja/screens/home/components/chapters.dart';
import 'package:rinja/screens/home/components/welcome.dart';
import 'package:rinja/screens/shared/components.dart';
import 'package:rinja/screens/shared/navigation.dart';
import 'package:rinja/services/chapters.dart';
import 'package:rinja/services/system.dart';
import 'package:flutter/material.dart';

class RinjaHome extends StatefulWidget {
  const RinjaHome({super.key});

  @override
  State<RinjaHome> createState() => _RinjaHomeState();
}

class _RinjaHomeState extends State<RinjaHome> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = getScreenType(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(pageTitles[_selectedIndex]),
          actions: _getActions(),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(child: pages[_selectedIndex]),
        ),
        bottomNavigationBar: RinjaNavbar(
          selectedIndex: _selectedIndex,
          onNavigationSelected: (index) =>
              setState(() => _selectedIndex = index),
          screenType: screenType,
        ));
  }

  List<Widget> _getActions() {
    if (_selectedIndex == 1 || _selectedIndex == 2) {
      return [
        IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {}),
        IconButton(
            icon: Icon(Icons.adaptive.more_outlined),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                showDragHandle: true,
                builder: (BuildContext context) {
                  return SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.list_alt_outlined),
                              title: const Text('List View'),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.grid_view_outlined),
                              title: const Text('Grid View'),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ));
                },
              );
            }),
      ];
    } else {
      return [];
    }
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: ListView(
        shrinkWrap: true,
        children: [
          const WelcomeContainer(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My chapters',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
          const Packs(
            packs: dummyPackList,
          ),
          SharedTiles(
            title: 'Explore chapters',
            icon: Icons.search_outlined,
            onTap: () {},
          ),
          const SizedBox(height: 16),
          SharedTiles(
            title: 'FAQ',
            icon: Icons.help_outline,
            onTap: () {},
          ),
          SharedTiles(
            title: 'Contribute',
            icon: Icons.people_outline,
            onTap: () {},
          ),
          SharedTiles(
            title: 'Donate',
            icon: Icons.attach_money_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class Packs extends StatelessWidget {
  const Packs({super.key, required this.packs});

  final List<BookChapter> packs;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SizedBox(
          height: 168,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: packs.length,
            itemBuilder: (context, index) {
              return ChapterContainer(
                  isSelected: index == 0, pack: packs[index]);
            },
          ),
        ));
  }
}
