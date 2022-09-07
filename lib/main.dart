import 'package:flutter/material.dart';

enum Item {
  first(
    label: 'First',
    color: Colors.red,
  ),
  second(
    label: 'Second',
    color: Colors.green,
  ),
  third(
    label: 'Third',
    color: Colors.blue,
  ),
  fourth(
    label: 'Fourth',
    color: Colors.yellow,
  ),
  ;

  const Item({
    required this.label,
    required this.color,
  });
  final String label;
  final Color color;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: Item.values.map((item) => _Body(item: item)).toList(),
      ),
      bottomNavigationBar: _NavigationBar(
        index: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.label),
      ),
      body: ColoredBox(
        color: item.color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.label),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    required this.index,
    required this.onTap,
  });

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      items: Item.values
          .map(
            (tabItem) => BottomNavigationBarItem(
              icon: const SizedBox(),
              label: tabItem.label,
            ),
          )
          .toList(),
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
    );
  }
}
