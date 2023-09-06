import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';


import '../../../res.dart';
import '../../common/utils/appcolors.dart';
import '../../common/utils/themes.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 3,
        backgroundColor: AppColors.whitecolor,
        title: Text("Privacy Policy",
            style: TextStyle(
              // fontFamily: 'Gilroy',
                color: AppColors.blackcolor,
                // decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700,
                fontFamily: 'Axiforma',
                fontSize: 14)),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.blackcolor,
            )),
      ),
      body: Stack(
        children: [
          WebView(
            gestureNavigationEnabled: true,
            allowsInlineMediaPlayback: true,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
            zoomEnabled: true,
            initialUrl:
            'https://docs.google.com/document/d/1j-4NyPP1KosvMqag8-CJbrHRtZoI9UF6GRoo0aJK5Zk/edit',
          ),
          if (loadingPercentage < 100)
          // LinearProgressIndicator(
          //   minHeight: 5,
          //   color: AppColors.greencolor,
          //   value: loadingPercentage / 100.0,
          // ),
            Center(
              child: CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: loadingPercentage / 100.0,
                center: new Text(loadingPercentage.toString() + "%"),
                progressColor: AppColors.appcolor,
              ),
            )
        ],
      ),
    );
  }
}
