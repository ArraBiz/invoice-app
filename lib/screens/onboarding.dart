import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:invoice/core/size_config.dart';
import 'package:invoice/core/theme.dart';
import 'package:invoice/screens/tabs.dart';
import 'package:invoice/widgets/onboarding/onboarding.dart';
import 'package:invoice/widgets/onboarding/ui/pages.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    MySize().init(context);
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme();
    return Scaffold(
        body: ABOnBoarding(
      pages: <PageViewModel>[
        PageViewModel(
          customAppTheme.bgLayer1,
          Padding(
            padding: EdgeInsets.all(MySize.size40!),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                    child: Image(
                        image: AssetImage('./assets/illustration/01.png'),
                        width: MySize.getScaledSizeHeight(400),
                        height: MySize.getScaledSizeHeight(320),
                        fit: BoxFit.cover)),
                SizedBox(height: 30.0),
                Text('CREATE',
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
                        fontWeight: 600)),
                SizedBox(height: 15.0),
                Text(
                  'Create estimates \& invoices on the go.',
                  style: themeData.textTheme.bodyText2!.merge(
                    TextStyle(
                        color:
                            themeData.colorScheme.onBackground.withAlpha(200),
                        letterSpacing: 0.1,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        PageViewModel(
          customAppTheme.bgLayer1,
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                    child: Image(
                  image: AssetImage('./assets/illustration/02.png'),
                  width: MySize.getScaledSizeWidth(400),
                  height: MySize.getScaledSizeHeight(320),
                  fit: BoxFit.cover,
                )),
                SizedBox(height: 30.0),
                Text(
                  'SHARE',
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
                      fontWeight: 600),
                ),
                SizedBox(height: 15.0),
                Text(
                    'Share estimates \& invoices on e-mail, whatsapp or store in device.',
                    style: themeData.textTheme.bodyText2!.merge(
                      TextStyle(
                          color:
                              themeData.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
        ),
        PageViewModel(
          customAppTheme.bgLayer1,
          Padding(
            padding: EdgeInsets.all(MySize.size40!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                    child: Image(
                  image: AssetImage('./assets/illustration/03.png'),
                  width: MySize.getScaledSizeWidth(400),
                  height: MySize.getScaledSizeHeight(320),
                  fit: BoxFit.cover,
                )),
                SizedBox(height: MySize.size30),
                Text('GENERATE',
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1!,
                        fontWeight: 600)),
                SizedBox(height: 15.0),
                Text('Generate reports with ease in PDF/CSV format.',
                    style: themeData.textTheme.bodyText2!.merge(
                      TextStyle(
                          color:
                              themeData.colorScheme.onBackground.withAlpha(200),
                          letterSpacing: 0.1,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
        ),
      ],
      unSelectedIndicatorColor: themeData.colorScheme.primary,
      selectedIndicatorColor: themeData.colorScheme.secondary,
      doneWidget: Material(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tabs()));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text("DONE".toUpperCase(),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                    color: themeData.colorScheme.primary, fontWeight: 700)),
          ),
        ),
      ),
      skipWidget: Material(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tabs()));
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text("Skip".toUpperCase(),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2!,
                    // color: themeData.colorScheme.secondary,
                    xMuted: true,
                    fontWeight: 700)),
          ),
        ),
      ),
    ));
  }
}
