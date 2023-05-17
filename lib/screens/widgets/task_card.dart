import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/screens/update_task_screen.dart';
import 'package:todo/shared/networks/remot/firebase/firebase_finctions.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskCard extends StatelessWidget {
  TaskModel taskModel;
  TaskCard({required this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            FirebaseFunctions.deleteTasksFromFirestore(taskModel.id);
          },
          icon: Icons.delete,
          label: AppLocalizations.of(context)!.delete,
          backgroundColor: redColor,
          borderRadius: Provider.of<SettingsProvidr>(context).Language == 'en'
              ? const BorderRadius.only(
                  topLeft: Radius.circular(12), bottomLeft: Radius.circular(12))
              : BorderRadius.circular(0),
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.pushNamed(context, UpdateTask.routname,
                arguments: taskModel);
          },
          icon: Icons.edit,
          label: AppLocalizations.of(context)!.edit,
          backgroundColor: const Color.fromARGB(255, 54, 164, 46),
          borderRadius: Provider.of<SettingsProvidr>(context).Language == 'en'
              ? BorderRadius.circular(0)
              : const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
        )
      ]),
      child: Container(
        height: 110,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              color:
                  taskModel.state ? greenColor : Theme.of(context).primaryColor,
              width: 1,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    style: taskModel.state
                        ? Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: greenColor)
                        : Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    taskModel.details,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Spacer(),
            !taskModel.state
                ? InkWell(
                    onTap: () {
                      taskModel.state = true;
                      FirebaseFunctions.updateTasksFromFirestore(
                          taskModel.id, taskModel);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 35,
                        )),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10),
                    child: Text(
                      AppLocalizations.of(context)!.done,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: greenColor),
                      textAlign: TextAlign.center,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
