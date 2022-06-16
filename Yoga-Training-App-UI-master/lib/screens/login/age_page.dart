import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/svg.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_training_app/constants/pallette.dart';
import 'package:camera/camera.dart';

import 'login_screen.dart';
//import '../screens/dashboard_page.dart';
//import '../screens/home_page.dart';
//import '../utils/database.dart';

/// Displays the `AgePage`.
///
/// Allows user to choose any one of the age ranges. Also, uploads
/// to the database when the user proceeds from this page.
///
/// *Connected pages:*
///
/// - `DashboardPage` (forward)
/// - `GenderPage` (previous)
///
/// *Params:*
///
/// - [userName]
/// - [gender]
///
class AgePage extends StatefulWidget {

    final List<CameraDescription> cameras;
    int _selectedAgeGroup;
  AgePage(this.cameras, this._selectedAgeGroup);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  //Database _database = Database();

  late String errorString;
  bool _isStoring = false;

  List<String> _ageGroupList = ['< 20', '20 - 34', '35+'];
  List<bool> _selectedList = [false, false, false];

  AppBar appBar = AppBar(
    centerTitle: true,
    title: Text(
      '',
      style: TextStyle(color: Colors.deepOrangeAccent[700], fontSize: 30),
    ),
    backgroundColor: Color(0xFFfeafb6),
    elevation: 0,
  );

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }



  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Palette.ageBackground);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.ageBackground,
      appBar: appBar,
      body: Container(
        // Color(0xFFffe6e1), --> color for the other cover
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                bottom: screenSize.height / 80,
              ),
              child: Text(
                'QUOTE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.width / 30,
                  color: Colors.black26,
                  fontFamily: 'LexendTera'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenSize.width / 15,
                right: screenSize.width / 15,
                bottom: screenSize.height / 50,
              ),
              child: Text(
                'The yoga pose you avoid the most you need the most.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenSize.width / 25,
                  color: Color(0xFF734435),
                  fontFamily: 'GoogleSans'
                ),
              ),
            ),
            Flexible(
              child: SvgPicture.asset(
                'assets/images/intro_3.svg',
                width: screenSize.width,
                semanticsLabel: 'Cover Image',
              ),
            ),
            SizedBox(height: screenSize.height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedList = [true, false, false];
                      widget._selectedAgeGroup = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFf1919c),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        width: 3,
                        color: _selectedList[0]
                            ? Color(0xFFed576a)
                            : Color(0xFFf1919c),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        _ageGroupList[0],
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedList = [false, true, false];
                      widget._selectedAgeGroup = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFf1919c),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        width: 3,
                        color: _selectedList[1]
                            ? Color(0xFFed576a)
                            : Color(0xFFf1919c),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        _ageGroupList[1],
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedList = [false, false, true];
                      widget._selectedAgeGroup = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFf1919c),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        width: 3,
                        color: _selectedList[2]
                            ? Color(0xFFed576a)
                            : Color(0xFFf1919c),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 16.0,
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        _ageGroupList[2],
                        style: TextStyle(
                          fontFamily: 'GoogleSans',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height / 20),
            _isStoring
                ? CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xFFed576a)),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.check_circle,
                      size: screenSize.width / 10,
                      color: widget._selectedAgeGroup != null
                          ? Color(0xFFed576a)
                          : Colors.black12,
                    ),
                    onPressed: widget._selectedAgeGroup != null
                        ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(widget.cameras),
                            ),
                          )
                          
                        : null,
                  ),
          ],
        ),
      ),
    );
  }
}