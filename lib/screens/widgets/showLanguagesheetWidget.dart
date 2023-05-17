import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/settings_provider.dart';

class ShowLanguageSheet extends StatelessWidget {
  const ShowLanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var methods = Provider.of<SettingsProvidr>(context, listen: false);
    var provider = Provider.of<SettingsProvidr>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            methods.chaneLanguage('en');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('English',
                    style: provider.Language != 'ar'
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Theme.of(context).primaryColor)
                        : Theme.of(context).textTheme.bodyLarge),
                const Spacer(),
                provider.Language == 'en'
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).primaryColor,
                      )
                    : Container()
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2,
          height: 2,
          color: Theme.of(context).primaryColor,
        ),
        InkWell(
          onTap: () {
            methods.chaneLanguage('ar');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('عربي',
                    style: provider.Language == 'ar'
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Theme.of(context).primaryColor)
                        : Theme.of(context).textTheme.bodyLarge),
                Spacer(),
                provider.Language == 'ar'
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).primaryColor,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
