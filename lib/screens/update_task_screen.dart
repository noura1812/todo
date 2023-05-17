import 'package:flutter/material.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/shared/networks/remot/firebase/firebase_finctions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateTask extends StatefulWidget {
  static const String routname = 'updatescreen';

  const UpdateTask({super.key});

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  var formKey = GlobalKey<FormState>();

  var taskTitleController = TextEditingController();

  var taskDetailsController = TextEditingController();
  int bilds = 0;
  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    bilds == 0 ? taskDetailsController.text = task.details : null;
    bilds == 0 ? taskTitleController.text = task.title : null;
    bilds == 0
        ? selectedDate = DateTime.fromMillisecondsSinceEpoch(task.date)
        : null;

    bilds++;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.update_task,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: taskTitleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Task title';
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                    label: Text(
                      AppLocalizations.of(context)!.task_title,
                    ),
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
                controller: taskDetailsController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Descriptio';
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                    label: Text(
                      AppLocalizations.of(context)!.task_details,
                    ),
                    labelStyle:
                        Theme.of(context).textTheme.bodySmall!.copyWith(),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context)!.select_time,
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
                  selectedDate.toString().substring(0, 10),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TaskModel taskModel = TaskModel(
                          title: taskTitleController.text,
                          details: taskDetailsController.text,
                          date: selectedDate.millisecondsSinceEpoch,
                          id: task.id,
                          state: task.state);
                      FirebaseFunctions.updateTasksFromFirestore(
                          task.id, taskModel);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.update,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void chooseTaskDate(context) async {
    DateTime? chosenDate = await showDatePicker(
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
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 3)));
    if (chosenDate != null) {
      selectedDate = DateUtils.dateOnly(chosenDate);
      setState(() {});
    }
  }
}
