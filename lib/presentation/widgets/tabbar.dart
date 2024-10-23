import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController tabController;
  final List<Widget> tabViews;

  const Tabbar(
      {super.key,
      required this.tabs,
      required this.tabController,
      required this.tabViews});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            child: TabBar(
              controller: tabController,
              tabs: tabs,
              dividerColor: Colors.transparent,
              indicatorColor: saffron,
              labelColor: saffron,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
