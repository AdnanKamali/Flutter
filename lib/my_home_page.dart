import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'about_me.dart';
import 'my_use_colors.dart';

// height > 750 => error
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  Widget svgTitle(
      {required String assetName,
      required String title,
      required BuildContext context,
      BoxConstraints? constraints,
      TextStyle style = const TextStyle(fontSize: 20, color: Colors.white),
      Color color = Colors.white,
      double width = 45,
      double height = 55}) {
    return FittedBox(
      alignment: Alignment.topCenter,
      fit: BoxFit.fitHeight,
      child: SizedBox(
        width: MediaQuery.of(context).size.height / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: SvgPicture.asset(
                assetName,
                color: color,
              ),
            ),
            Text(
              title,
              style: style,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, contrains) {
        final deviceHeight = MediaQuery.of(context).size.height;
        final deviceWidth = MediaQuery.of(context).size.width;
        final fontSize = contrains.maxHeight * 0.03;
        final maxHeight = deviceHeight > 750 || deviceWidth < 120
            ? contrains.maxHeight * 0.95
            : contrains.maxHeight;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: maxHeight * 0.05,
            ),
            Center(
              child: Text(
                "Flutter Developer",
                style: TextStyle(
                  color: flutterDevColor,
                  fontSize: fontSize,
                ),
              ),
            ),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            Hero(
              tag: "AdnanTag",
              child: CircleAvatar(
                backgroundImage: const AssetImage("assets/images/adnan.jpg"),
                radius: maxHeight * 0.095,
              ),
            ),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            Text(
              "Adnan Kamali",
              style: TextStyle(fontSize: fontSize, color: adnanColor),
            ),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: aboutMeBtnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutMeScreen(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "About Me",
                  style: TextStyle(fontSize: fontSize, color: aboutMeTextColor),
                ),
              ),
            ),
            SizedBox(
              height: maxHeight * 0.04,
            ),
            svgTitle(
              context: context,
              style:
                  TextStyle(fontSize: maxHeight * 0.025, color: Colors.white),
              assetName: "assets/images/github.svg",
              title: "http://github.com/adnankamali",
            ),
            svgTitle(
              context: context,
              style:
                  TextStyle(fontSize: maxHeight * 0.025, color: Colors.white),
              assetName: "assets/images/email.svg",
              title: "Adnankamali1246@gmail.com",
            ),
            svgTitle(
              context: context,
              style:
                  TextStyle(fontSize: maxHeight * 0.025, color: Colors.white),
              assetName: "assets/images/phone.svg",
              title: "+98 917 952 1462",
            ),
            svgTitle(
              context: context,
              style:
                  TextStyle(fontSize: maxHeight * 0.025, color: Colors.white),
              assetName: "assets/images/location.svg",
              title: "Hormozgan, BandarAbbas",
            )
          ],
        );
      }),
    );
  }
}
