import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with TickerProviderStateMixin{

  late TabController _tabController;

  static const List<Tab> tabsList = <Tab>[
    Tab(text: 'Zeroth',icon: Icon(Icons.looks_one)),
    Tab(text: 'First',icon: Icon(Icons.looks_two)),
    Tab(text: 'Second',icon: Icon(Icons.looks_3)),
  ];

  List<Container> list = <Container>[
    Container(alignment: Alignment.center,child: Text('page 1')),
    Container(alignment: Alignment.center,child: Text('page 2')),
    Container(alignment: Alignment.center,child: Text('page 3')),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
        if (!_tabController.indexIsChanging) {
          print(_tabController.index);
        }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabsList
        ),
      ),
      body: TabBarView(

        controller: _tabController,
        children: list
      ),
    );
  }
}
