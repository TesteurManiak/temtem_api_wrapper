import 'package:example/pages/all_conditions.dart';
import 'package:example/pages/all_locations.dart';
import 'package:example/pages/all_rewards.dart';
import 'package:example/pages/all_temtems.dart';
import 'package:example/pages/all_types.dart';
import 'package:flutter/material.dart';
import 'package:temtem_api_wrapper/temtem_api_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'temtem_api_wrapper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'temtem_api_wrapper Demo'),
    );
  }
}

class TabItem {
  final String label;
  final Widget page;

  TabItem(this.label, this.page);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final _api = TemTemApi();

  late final List<TabItem> _items;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _items = <TabItem>[
      TabItem('Temtems', AllTemtems(_api)),
      TabItem('Rewards', AllRewards(_api)),
      TabItem('Types', AllTypes(_api)),
      TabItem('Conditions', AllConditions(_api)),
      TabItem('Locations', AllLocations(_api))
    ];
    _tabController = TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: _items.map<Tab>((e) => Tab(text: e.label)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _items.map<Widget>((e) => e.page).toList(),
      ),
    );
  }
}
