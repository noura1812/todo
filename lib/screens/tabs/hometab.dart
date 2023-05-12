import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo/screens/widgets/task_card.dart';

class HomwTabe extends StatefulWidget {
  const HomwTabe({super.key});

  @override
  State<HomwTabe> createState() => _HomwTabeState();
}

class _HomwTabeState extends State<HomwTabe> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          DatePicker(
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
                _selectedValue = date;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(10),
                  child: TaskCard(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
