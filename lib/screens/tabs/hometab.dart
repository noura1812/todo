import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/screens/widgets/task_card.dart';
import 'package:todo/shared/networks/remot/firebase/firebase_finctions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomwTabe extends StatefulWidget {
  const HomwTabe({super.key});

  @override
  State<HomwTabe> createState() => _HomwTabeState();
}

class _HomwTabeState extends State<HomwTabe> {
  DateTime selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvidr>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          DatePicker(
            locale: provider.Language,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Theme.of(context).primaryColor,
            selectedTextColor: Colors.white,
            dateTextStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).primaryColor),
            dayTextStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).primaryColor),
            monthTextStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).primaryColor),
            height: 100,
            onDateChange: (date) {
              // New date selected
              setState(() {
                selectedValue = date;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text(AppLocalizations.of(context)!.error),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.try_again),
                        onPressed: () {},
                      )
                    ],
                  ),
                );
              }
              List<TaskModel> tasksList =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              if (tasksList.isEmpty) {
                return Center(
                  child: Text(AppLocalizations.of(context)!.no_taskes),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: TaskCard(taskModel: tasksList[index]),
                    );
                  },
                ),
              );
            },
            stream: FirebaseFunctions.getTaskesFromFirestore(selectedValue),
          )
        ],
      ),
    );
  }
}
