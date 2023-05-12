import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/homescreen_providers.dart';
import 'package:todo/screens/tabs/hometab.dart';
import 'package:todo/screens/tabs/settingsTab.dart';
import 'package:todo/screens/widgets/show_add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = 'homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [HomwTabe(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProider>(context);
    var methodprovider = Provider.of<HomeScreenProider>(context, listen: false);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: tabs[provider.index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskSheet();
        },
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white, width: 3),
        ),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconSize: 25,
            currentIndex: provider.index,
            onTap: (value) {
              methodprovider.changeIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: ''),
            ]),
      ),
    );
  }

  void showAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ShowAddTaskBottomSheet();
      },
    );
  }
}
