import 'package:flutter/material.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/data/data.dart';
import 'package:yoga_training_app/models/style.dart';
import 'package:yoga_training_app/page/profile_page.dart';
import 'package:yoga_training_app/screens/yogas/yoga_screen.dart';
import 'package:camera/camera.dart';

class See_all  extends StatelessWidget{

  final List<CameraDescription> cameras;

  See_all(this.cameras);
  Widget _buildSeeall(BuildContext context, int index, List<CameraDescription> cameras) {
    Size size = MediaQuery.of(context).size;
    Style style = styles[index];

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeIn,
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.3),
                  blurRadius: 30.0,
                  offset: Offset(10, 15))
            ]),
        child: Material(
          borderRadius:BorderRadius.circular(30.0) ,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>Yoga_ScreenPage(style: style,cameras:cameras),
              ),
            ) ,
            child: Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: AssetImage(style.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    //width: size.width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: appPadding / 2, top: appPadding / 1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,fontFamily: 'TitilliumWeb'
                              
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.folder_open_rounded,
                                color: black.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                style.students,
                                style: TextStyle(
                                    color: black.withOpacity(0.3), fontSize: 16,fontFamily: 'TitilliumWeb'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: black.withOpacity(0.3),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                style.time.toString() + ' min',
                                style: TextStyle(
                                    color: black.withOpacity(0.3), fontSize: 16,fontFamily: 'TitilliumWeb'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      body: Padding(
        padding: const EdgeInsets.only(top: appPadding * 2.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: appPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'styles',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                            fontFamily: 'LexendTera'
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: styles.length,
                    itemBuilder: (context, index) {
                      return _buildSeeall(context, index,cameras);
                    },
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
