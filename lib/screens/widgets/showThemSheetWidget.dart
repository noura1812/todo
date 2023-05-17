import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/settings_provider.dart';

class ShowThemeSheet extends StatelessWidget {
  const ShowThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var methods = Provider.of<SettingsProvidr>(context, listen: false);
    var provider = Provider.of<SettingsProvidr>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            methods.changeTeme('dark');
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text('Darth mood',
                    style: provider.Theme != 'light'
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Theme.of(context).primaryColor)
                        : Theme.of(context).textTheme.bodyLarge),
                Spacer(),
                provider.Theme == 'dark'
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.onSurface,
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
            methods.changeTeme('light');
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text('Light mood',
                    style: provider.Theme == 'light'
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Theme.of(context).primaryColor)
                        : Theme.of(context).textTheme.bodyLarge),
                Spacer(),
                provider.Theme == 'light'
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
