import 'package:flutter/material.dart';

class ShowAddTaskBottomSheet extends StatelessWidget {
  const ShowAddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Task title';
                }
                return null;
              },
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                  label: const Text('Task Title'),
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(
              height: 28,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Descriptio';
                }
                return null;
              },
              onSaved: (newValue) {},
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                  label: const Text('Task Description'),
                  labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Select time',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                chooseTaskDate(context);
              },
              child: Text(
                '12/12/2022',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Add Task',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void chooseTaskDate(context) {
    showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              dialogBackgroundColor: Theme.of(context).colorScheme.secondary,
              primaryColor: Theme.of(context).primaryColor,
              colorScheme: ColorScheme.light(
                  primary: Theme.of(context).primaryColor,
                  onSurface: Theme.of(context).colorScheme.onSurface,
                  background: Theme.of(context).colorScheme.secondary),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 3)));
  }
}
