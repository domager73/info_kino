import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      const Text(''),
      const Text(''),
    ];

    void onSelectTab(int index) {
      if (_selectedTab == index) return;
      setState(() {
        _selectedTab = index;
      });
    }

    return WillPopScope(
      child: Scaffold(
        body: widgetOptions[_selectedTab],
        bottomNavigationBar: ClipRRect(
          child: BottomNavigationBar(
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedTab,
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(Icons.search),
                  label: AppLocalizations.of(context)!.search
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.people),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
            selectedLabelStyle: AppTypography.font14black,
            selectedItemColor: Theme.of(context).cardColor,
            onTap: onSelectTab,
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
