import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:yoga_training_app/constants/constants.dart';

import 'icon_widget.dart';

Widget buildReportBug(BuildContext context) {
  return SimpleSettingsTile(
    title: 'Report A Bug',
    subtitle: '',
    leading: const IconWidget(
      icon: Icons.bug_report,
      color: iconColor,
    ),
    onTap: () {},
  );
}
