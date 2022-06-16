import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:yoga_training_app/screens/home/home_screen.dart';
import 'package:yoga_training_app/screens/settings/account_page.dart';
import 'package:yoga_training_app/screens/settings/header_page.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/screens/settings/user_page.dart';
import 'package:yoga_training_app/settings_widgets/delete.dart';
import 'package:yoga_training_app/settings_widgets/feedback.dart';
import 'package:yoga_training_app/settings_widgets/logout.dart';
import 'package:yoga_training_app/settings_widgets/reportbug.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'dart:math' as math;
import 'package:yoga_training_app/screens/home/components/custom_app_bar.dart';
import 'package:yoga_training_app/page/profile_page.dart';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/screens/login/login_screen.dart';
 import 'package:yoga_training_app/settings_widgets/icon_widget.dart';

class SettingsPage extends StatefulWidget {

  final List<CameraDescription> cameras;

  const SettingsPage({Key? key, required this.cameras}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SideMenu(
      key: _endSideMenuKey,
      inverse: true, // end side menu
      background: Colors.green[700],
      type: SideMenuType.slideNRotate,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(),
        type: SideMenuType.slideNRotate,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,
          child: Scaffold(
            appBar: AppBar(
                title: const Text(
                  "Settings",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'LexendTera'),
                ),
                backgroundColor: primary,
                elevation: 50.0,
                leading: Transform(
                  transform: Matrix4.rotationY(math.pi),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: const Icon(
                      Icons.sort_rounded,
                      size: 30.0,
                      color: black,
                    ),
                    onPressed: () => toggleMenu(),
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.light
                ),
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(padding),
                children: [
                  HeaderPage(),
                  const SizedBox(
                    height: 16,
                  ),
                  SettingsGroup(title: 'General Settings', children: <Widget>[
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    //DarkMode(),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    AccountPage(),
                    const SizedBox(
                      height: 16,
                    ),
                    buildLogout(context),
                    const SizedBox(
                      height: 16,
                    ),
                    buildDeleteAccount(),
                    const SizedBox(
                      height: 16,
                    ),
                    buildReportBug(context),
                    const SizedBox(
                      height: 16,
                    ),
                    buildSendFeedback(context),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/propic.jpeg',
                  ),
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Hello, K P Rachan",
                  style: TextStyle(color: Colors.white,fontFamily: 'LexendTera'),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(cameras:widget.cameras,),
              ),
            ),
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home",style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Montserrat'),),
            //textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(widget.cameras),
              ),
            ),
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile",style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Montserrat'),),
            //textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.insert_invitation,
                size: 20.0, color: Colors.white),
            title: const Text("Invite",style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Montserrat'),),
            // textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.info, size: 20.0, color: Colors.white),
            title: const Text("About Us",style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Montserrat'),),
            // textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.rate_review, size: 20.0, color: Colors.white),
            title: const Text("Rate Us",style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Montserrat'),),
            // textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              toggleMenu(false);
            },
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings",style: TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'Montserrat'),),
            // textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }



Widget buildLogout(BuildContext context) {
  
  return SimpleSettingsTile(
      title: 'Logout',
      subtitle: '',
      leading: const IconWidget( icon: Icons.logout , color: iconColor,),
      onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(widget.cameras),
              ),
            ),);
}
}
