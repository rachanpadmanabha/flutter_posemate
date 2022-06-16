import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/settings_widgets/user_info.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Aleyna ESER',
      subtitle: '+900000000000',
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(profile),
      ),
      child: SettingsScreen(
        title: 'Status',
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          buildStatus(),
          const SizedBox(
            height: 16,
          ),
          buildAbout(),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
