import 'package:flutter/material.dart';
import 'package:rinja/screens/explore/explore.dart';
import 'package:rinja/screens/favorites/favorites.dart';
import 'package:rinja/screens/home/home.dart';
import 'package:rinja/screens/more/more_options.dart';
import 'package:rinja/services/system.dart';

const List<Widget> pages = <Widget>[
  HomeScreen(),
  ExploreScreen(),
  FavoriteScreen(),
  MoreScreen(),
];

const List<String> pageTitles = <String>[
  'RINJA Species ID',
  'Explore',
  'Favorites',
  'More Options',
];

class NavigationProperties {
  const NavigationProperties({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final Icon icon;
  final Icon selectedIcon;
}

const List<NavigationProperties> navigationProperties = <NavigationProperties>[
  NavigationProperties(
    label: 'Home',
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
  ),
  NavigationProperties(
    label: 'Explore',
    icon: Icon(Icons.search_outlined),
    selectedIcon: Icon(Icons.search_rounded),
  ),
  NavigationProperties(
    label: 'Favorites',
    icon: Icon(Icons.favorite_outline),
    selectedIcon: Icon(Icons.favorite_rounded),
  ),
  NavigationProperties(
    label: 'More',
    icon: Icon(Icons.menu_outlined),
    selectedIcon: Icon(Icons.menu_rounded),
  ),
];

class RinjaNavbar extends StatelessWidget {
  const RinjaNavbar({
    super.key,
    required this.screenType,
    required this.selectedIndex,
    required this.onNavigationSelected,
  });

  final ScreenType screenType;
  final int selectedIndex;
  final void Function(int) onNavigationSelected;

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = screenType == ScreenType.small;
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onNavigationSelected,
      labelBehavior: isSmallScreen
          ? NavigationDestinationLabelBehavior.alwaysHide
          : NavigationDestinationLabelBehavior.alwaysShow,
      indicatorColor: Theme.of(context).colorScheme.secondary.withAlpha(120),
      destinations: navigationProperties
          .map((NavigationProperties nav) => NavigationDestination(
                icon: nav.icon,
                selectedIcon: nav.selectedIcon,
                label: nav.label,
                tooltip: isSmallScreen ? nav.label : null,
              ))
          .toList(),
    );
  }
}
