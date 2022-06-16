import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:yoga_training_app/constants/constants.dart';

import 'icon_widget.dart';

Widget buildSecurity(BuildContext context) {
  return SimpleSettingsTile(
    title: 'Security',
    subtitle: '',
    leading: const IconWidget(
      icon: Icons.security,
      color: iconColor,
    ),
    onTap: () {},
  );
}
