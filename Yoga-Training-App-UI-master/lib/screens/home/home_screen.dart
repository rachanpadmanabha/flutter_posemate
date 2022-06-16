import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:yoga_training_app/constants/pallette.dart';
import 'package:yoga_training_app/page/profile_page.dart';
import 'dart:math' as math;
import 'package:yoga_training_app/screens/settings/settings_page.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/screens/home/components/courses.dart';
import 'package:yoga_training_app/screens/home/components/diff_styles.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:yoga_training_app/screens/yogas/see_all.dart';
import 'package:camera/camera.dart';

class HomeScreen extends StatefulWidget {


  final List<CameraDescription> cameras;

  const HomeScreen( {Key? key,required this.cameras }) : super(key: key);


  //HomeScreen({required this.cameras});
  //HomeScreen({required Key key,required this.cameras}): super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selsctedIconIndex = 1;
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


  navmenu([int ind = 0]){
    switch (ind) {
      case 0: return Text("case 1");
        
        break;
      case 1:  return DiffStyles(widget.cameras);
                  //Courses();
        //break;
      case 2:return Text("Case 3");
      break;
      default:return Padding(padding: EdgeInsets.all(0.0),);
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue[100]!);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
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
            backgroundColor: Colors.white,
            extendBody: false,
            body: Padding(
              padding: const EdgeInsets.only(top: appPadding * 2.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Transform(
                              transform: Matrix4.rotationY(math.pi),
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.sort_rounded,
                                  size: 30.0,
                                ),
                                onPressed: () => toggleMenu(),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              'PoseMate',
                              style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,fontFamily: 'LexendTera'),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(widget.cameras),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(appPadding / 8),
                            child: Container(
                              decoration: new BoxDecoration(
                                color: primary,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(appPadding / 20),
                                child: Container(
                                  decoration: new BoxDecoration(
                                    color: white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(appPadding / 8),
                                    child: Center(
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'assets/images/propic.jpeg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // DiffStyles(widget.cameras),
                  // Courses(),
                  navmenu(1),
                  Courses(1),
                ],
              ),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              index: selsctedIconIndex,
              buttonBackgroundColor: primary,
              height: 60.0,
              color: white,
              onTap: (index) {
                setState(() {
                  selsctedIconIndex = index;
                });
              },
              animationDuration: Duration(
                milliseconds: 200,
              ),
              items: <Widget>[
                IconButton(
                  icon: Icon(Icons.insert_chart_outlined,
                  size: 30,
                  color: selsctedIconIndex == 0 ? white : black,),
                  onPressed:() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>ProfilePage(widget.cameras),
              ),
            ) ,
                ),
                IconButton(
                  icon: Icon(Icons.home_outlined,
                  size: 30,
                  color: selsctedIconIndex == 1 ? white : black,),
                  onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>HomeScreen(cameras: widget.cameras),
              ),
            ),
                ),
                IconButton(
                  icon: Icon(Icons.auto_graph_outlined,
                  size: 30,
                  color: selsctedIconIndex == 2 ? white : black,),
                  onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>SettingsPage(cameras: widget.cameras),
              ),
            ),
                ),
                // Icon(
                //   Icons.favorite_border_outlined,
                //   size: 30,
                //   color: selsctedIconIndex == 3 ? white : black,
                // ),
                // Icon(
                //   Icons.person_outline,
                //   size: 30,
                //   color: selsctedIconIndex == 4 ? white : black,
                // ),
              ],
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
            onTap: () {
              toggleMenu(false);
            },
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
            title: const Text("Profile", style: TextStyle(
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
                builder: (context) => SettingsPage(cameras: widget.cameras),
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
