import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/settings_provider.dart';
import 'package:todo/screens/widgets/showLanguagesheetWidget.dart';
import 'package:todo/screens/widgets/showThemSheetWidget.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Provider.of<SettingsProvidr>(context).Language == 'en'
                ? 'language'
                : 'اللغه',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: InkWell(
              onTap: () {
                showLanguageSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Provider.of<SettingsProvidr>(context).Language == 'en'
                        ? 'English'
                        : 'عربي',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Text(
            'Themeing',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: InkWell(
              onTap: () {
                showThemeSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Theme.of(context).colorScheme.brightness == Brightness.light
                        ? 'Light mood'
                        : 'Dark mood',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowLanguageSheet();
      },
    );
  }

  void showThemeSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ShowThemeSheet();
      },
    );
  }
}
