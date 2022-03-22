import 'package:app_demo/jsfunction/jsFunction.dart';
import 'package:app_demo/page/loading.screen.dart';
import 'package:app_demo/viewmodel/init_screen.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:stacked/stacked.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    // setIsFirstTime();
    slides.add(
      Slide(
        pathImage: "assets/images/13.png",
        backgroundColor: Colors.white,
        heightImage: 400,
        marginDescription: EdgeInsets.symmetric(vertical: 5.0),
        widgetDescription: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('All-in-One Advertising Platform',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text(
                  'Allow miles wound place the leave had. To sitting subject no improve studied limited',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))
            ],
          ),
        ),
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        pathImage: "assets/images/14.png",
        // foregroundImageFit: BoxFit.cover,
        backgroundColor: Colors.white,
        heightImage: 400,
        marginDescription: EdgeInsets.symmetric(vertical: 5.0),
        widgetDescription: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(' Business Manager',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text(
                  "Manage ad accounts, Pages, and the people who work on them — all in one place. It's free",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))
            ],
          ),
        ),
        onCenterItemPress: () {},
      ),
    );
    slides.add(
      Slide(
        pathImage: "assets/images/15.png",
        // foregroundImageFit: BoxFit.cover,
        backgroundColor: Colors.white,
        heightImage: 400,
        marginDescription: EdgeInsets.symmetric(vertical: 5.0),
        widgetDescription: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Pages Manager',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text(
                  "View insights, create, schedule, and manage posts and stories",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))
            ],
          ),
        ),
        onCenterItemPress: () {},
      ),
    );
    super.initState();
  }

  void setIsFirstTime() async {
    var isFirst = await storage.read(key: "isFirst");
    if (isFirst == null || isFirst == "false") {
      await storage.write(key: "isFirst", value: "true");
    }
  }

  void onDonePress() {
    // Do what you want
    setIsFirstTime();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoaddingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitScreenViewModel>.reactive(
      onModelReady: (model) {
        model.checkLogin();
      },
      builder:
          (BuildContext context, InitScreenViewModel model, Widget? child) {
        return IntroSlider(
          // List slides
          slides: slides,
          doneButtonStyle: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(color: Colors.black)),
            // shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            // overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
          ),
          onDonePress: onDonePress,
          onSkipPress: onDonePress,
        );
      },
      viewModelBuilder: () => InitScreenViewModel(),
    );
  }
}
