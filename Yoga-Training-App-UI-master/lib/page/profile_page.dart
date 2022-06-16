import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_training_app/models/user.dart';
import 'package:yoga_training_app/screens/settings/settings_page.dart';
import 'package:yoga_training_app/utils/user_preferences.dart';
import 'package:yoga_training_app/profile_widgets/appbar_widget.dart';
import 'package:yoga_training_app/profile_widgets/button_widget.dart';
import 'package:yoga_training_app/profile_widgets/numbers_widget.dart';
import 'package:yoga_training_app/profile_widgets/profile_widget.dart';
import 'package:flutter/services.dart';
import 'package:yoga_training_app/screens/home/home_screen.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'dart:math' as math;
import 'package:camera/camera.dart';

class ProfilePage extends StatefulWidget {

  final List<CameraDescription> cameras;

  ProfilePage(this.cameras);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState;
      if (_state!.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState;
      if (_state!.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
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
                  "Profile",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.w600, fontSize: 18,fontFamily: 'LexendTera'),
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
                      color:black
                    ),
                    onPressed: () => toggleMenu(),
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle.light),
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: ProfileWidget(
                    imagePath: user.imagePath,
                    onClicked: () async {},
                  ),
                ),
                const SizedBox(height: 24),
                buildName(user),
                // const SizedBox(height: 24),
                // Center(child: buildUpgradeButton()),
                const SizedBox(height: 24),
                // NumbersWidget(),
                // const SizedBox(height: 48),
                buildAbout(user),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontFamily: 'Montserrat'),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey,fontFamily: 'Montserrat'),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4,fontFamily: 'TitilliumWeb'),
            ),
          ],
        ),
      );

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
            onTap: () {toggleMenu(false);},
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(cameras: widget.cameras,),
              ),
            ),
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
}
