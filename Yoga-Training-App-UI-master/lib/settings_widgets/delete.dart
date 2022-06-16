import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:yoga_training_app/constants/constants.dart';

import 'icon_widget.dart';

Widget buildDeleteAccount() {
  return SimpleSettingsTile(
    title: 'Delete Account',
    subtitle: '',
    leading: const IconWidget(
      icon: Icons.delete,
      color: iconColor,
    ),
    onTap: () {},
  );
}
