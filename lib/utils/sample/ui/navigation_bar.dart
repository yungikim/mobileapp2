import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NavSample extends StatefulWidget {
  const NavSample({super.key});

  @override
  State<NavSample> createState() => _NavSampleState();
}

class _NavSampleState extends State<NavSample> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.search_off_rounded),
            label: "Searcg",
            selectedIcon: Icon(
              Icons.search_off_rounded,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Setting",
            selectedIcon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
        animationDuration: const Duration(microseconds: 500),
      ),
      appBar: AppBar(
        title: Text("NavigationBar"),
      ),
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            Home(),
            Search(),
            Setting()
          ],
        ),
      ),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      body: Center(

        child: Column(
          children: [
            Text("Home"),
            Lottie.asset("asset/lottie/animation1.json", height: height),
          ],
        ),

      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Search"),
            Lottie.asset("asset/lottie/animation_search.json", height: height),
          ],
        ),
      ),
    );
  }
}


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Setting"),
            Lottie.asset("asset/lottie/animation_settings.json", height: height),
          ],
        ),
      ),
    );
  }
}

