import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/shared/styles/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const DrawerMotion(), children: [
        SlidableAction(
          onPressed: (context) {},
          icon: Icons.delete,
          label: 'Delete',
          backgroundColor: redColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        SlidableAction(
          onPressed: (context) {},
          icon: Icons.edit,
          label: 'Edit',
          backgroundColor: const Color.fromARGB(255, 54, 164, 46),
        )
      ]),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              color: Theme.of(context).primaryColor,
              width: 1,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task Name',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Task desciption',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }
}
