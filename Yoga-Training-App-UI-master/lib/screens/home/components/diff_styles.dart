import 'package:flutter/material.dart';
import 'package:yoga_training_app/constants/constants.dart';
import 'package:yoga_training_app/data/data.dart';
import 'package:yoga_training_app/models/style.dart';
import 'package:yoga_training_app/screens/yogas/see_all.dart';
import 'package:yoga_training_app/screens/yogas/yoga_screen.dart';
import 'package:camera/camera.dart';

class DiffStyles extends StatelessWidget {

  final List<CameraDescription> cameras;

  DiffStyles(this.cameras);

  _buildStyles(BuildContext context, int index,List<CameraDescription> cameras) {
    Size size = MediaQuery.of(context).size;
    Style style = styles[index];

    return InkWell(
      onTap:() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>Yoga_ScreenPage(style: style,cameras: cameras,),
              ),
            ) ,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
            child: Container(
              margin:
                  EdgeInsets.only(top: appPadding * 3, bottom: appPadding * 2),
              width: size.width * 0.4,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topRight: Radius.circular(200.0)),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.3),
                        blurRadius: 20.0,
                        offset: Offset(5, 15))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2,
                        right: appPadding * 3,
                        top: appPadding),
                    child: Text(
                      style.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'TitilliumWeb'
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: appPadding / 2,
                        right: appPadding / 2,
                        bottom: appPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: black.withOpacity(0.3),
                                  fontFamily: 'TitilliumWeb'),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              child: Image(
                width: size.width * 0.3,
                height: size.height * 0.2,
                image: AssetImage(style.imageUrl),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For Beginners',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  fontFamily: 'Montserrat'
                ),
              ),
              GestureDetector(
                onTap: ()  => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => See_all(cameras),
              ),
            ),
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800, color: primary,fontFamily: 'Montserrat'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: appPadding / 2),
          child: Container(
            height: size.height * 0.33,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildStyles(context, index,cameras);
                }),
          ),
        )
      ],
    );
  }
}
