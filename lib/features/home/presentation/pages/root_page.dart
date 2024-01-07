import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import 'pages.dart';

class RootPage extends StatefulWidget {
  final int currentTab;
  const RootPage({super.key, required this.currentTab});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text('This Page')),
    const Center(child: Text('This Page')),
    const Center(child: Text('This Page')),
    const Center(child: Text('This Page')),
  ];

  @override
  void initState() {
    _selectedIndex = widget.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: Assets.icons.home.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            icon: Assets.icons.home.svg(),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Assets.icons.favourite.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            icon: Assets.icons.favourite.svg(),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            activeIcon: Assets.icons.scan.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            icon: Assets.icons.scan.svg(),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            activeIcon: Assets.icons.history.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            icon: Assets.icons.history.svg(),
            label: 'History',
          ),
          BottomNavigationBarItem(
            activeIcon: Assets.icons.profile.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
            icon: Assets.icons.profile.svg(),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
