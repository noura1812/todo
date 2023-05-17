import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/homescreen_providers.dart';
import 'package:todo/screens/tabs/hometab.dart';
import 'package:todo/screens/tabs/settings_tab.dart';
import 'package:todo/screens/widgets/show_add_task_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = 'homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [const HomwTabe(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeScreenProider>(context);
    var methodprovider = Provider.of<HomeScreenProider>(context, listen: false);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: tabs[provider.index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          showAddTaskSheet();
        },
        shape: StadiumBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.secondary, width: 3),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
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
        return const ShowAddTaskBottomSheet();
      },
    );
  }
}
