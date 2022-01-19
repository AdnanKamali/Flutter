import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'my_use_colors.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen>
    with SingleTickerProviderStateMixin {
  final String myInfoEn =
      "Hi I am Adnan Kamali and I am 19 years old. I started programming with Python at the age of 17 and I realized that I am interested in mobile programming, so I continued with Flutter and I am still learning this great framework and I am progressing.";

  final _controller = ScrollController();

  Widget builerProgress(String title, double percent, TextStyle style) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: deviceHeight * 0.025,
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: deviceHeight * 0.025, left: deviceWidth * 0.11),
          child: Row(
            children: [
              Text(
                "$title :",
                style: style,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: deviceHeight * 0.05),
          child: LinearPercentIndicator(
            progressColor: Colors.blue,
            backgroundColor: Colors.blue.withOpacity(0.5),
            percent: percent,
            width: deviceWidth * 0.765,
            lineHeight: 10,
            animation: true,
            animationDuration: 1500,
          ),
        )
      ],
    );
  }

  bool isEnglish = true;
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgScreenColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "About Me",
          style: TextStyle(fontSize: 30, color: aboutMeTextColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: aboutMeTextColor,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, contrains) {
        final deviceHeight = MediaQuery.of(context).size.height;
        final deviceWidth = MediaQuery.of(context).size.width;
        final fontSize = contrains.maxHeight * 0.043;
        final maxHeight = contrains.maxHeight;
        final maxWidth = contrains.maxWidth;
        return SingleChildScrollView(
          controller: _controller,
          // physics: isExpand ? null : const NeverScrollableScrollPhysics(),
          child: SafeArea(
            child: SizedBox(
              height: isExpand
                  ? MediaQuery.of(context).size.height > 750
                      ? maxHeight * 1.4
                      : maxHeight * 1.5
                  : deviceHeight - MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  Positioned(
                    top: deviceHeight * 0.175,
                    bottom: 0,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                left: maxWidth * 0.1,
                                right: maxWidth * 0.1,
                                top: maxHeight * 0.1,
                                bottom: deviceHeight * 0.012,
                              ),
                              child: Text(
                                myInfoEn,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height > 750
                                            ? maxHeight * 0.035
                                            : maxHeight * 0.045),
                              )),
                          isExpand
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: maxHeight * 0.045,
                                    ),
                                    builerProgress("Flutter", 0.60,
                                        TextStyle(fontSize: fontSize)),
                                    builerProgress("Dart", 0.70,
                                        TextStyle(fontSize: fontSize)),
                                    builerProgress("English", 0.30,
                                        TextStyle(fontSize: fontSize)),
                                    builerProgress("Flask", 0.40,
                                        TextStyle(fontSize: fontSize)),
                                  ],
                                )
                              : IconButton(
                                  onPressed: () async {
                                    setState(() {
                                      isExpand = true;
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 10));
                                    _controller.animateTo(
                                        _controller.position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.fastOutSlowIn);
                                  },
                                  icon: const Icon(Icons.expand_more),
                                )
                        ],
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: bgAboutMeContentColor),
                      height: maxHeight * 1.2,
                      width: deviceWidth,
                    ),
                  ),
                  Positioned(
                    top: maxHeight * 0.035,
                    left: maxWidth * 0.035,
                    child: Hero(
                      tag: "AdnanTag",
                      child: CircleAvatar(
                        backgroundImage:
                            const AssetImage("assets/images/adnan.jpg"),
                        radius: maxHeight * 0.095,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
