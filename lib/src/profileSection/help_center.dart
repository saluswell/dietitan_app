
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../res.dart';
import '../../common/utils/appcolors.dart';


class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  TextEditingController _searchSevicesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
            Navigator.maybePop(context);
                    },

                    child: SvgPicture.asset(
                      Res.backarrowicon,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  Text("Help Center",
                      style: TextStyle(
                          // fontFamily: 'Gilroy',
                          color: AppColors.blackcolor,
                          // decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Axiforma',
                          fontSize: 15)),
                  Text("     "),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: Row(
            //     children: [
            //       Container(
            //         child: RichText(
            //           textAlign: TextAlign.start,
            //           text: TextSpan(
            //               style: TextStyle(
            //                   //fontFamily: 'Gilroy',
            //                   color: AppColors.blackcolor,
            //                   fontWeight: FontWeight.bold,
            //                   fontFamily: 'Axiforma',
            //                   fontSize: 23),
            //               text: "Crowdvoice's Help Center"),
            //         ),
            //         width: 280,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: TextFieldWidget(
            //     hinttext: "Search for services",
            //     authcontroller: _searchSevicesController, validator: (String ) {  },
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                children: [
                  Container(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: TextStyle(
                              //fontFamily: 'Gilroy',
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Axiforma',
                              fontSize: 15),
                          text: "Frequently Asked Questions-FAQ"),
                    ),
                    width: 280,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                children: [
                  Container(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: TextStyle(
                              //fontFamily: 'Gilroy',
                              color:
                                  AppColors.lightdarktextcolor.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Axiforma',
                              fontSize: 11),
                          text:
                              "Below are the some of the Frequently Asked Question."),
                    ),
                    width: 290,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                backgroundColor: AppColors.whitecolor.withOpacity(0.3),
                //  collapsedBackgroundColor: AppColors.lightwhite.withOpacity(0.2),
                collapsedTextColor: AppColors.blackcolor,
                // leading: Icon(Icons.arrow_drop_down),
                title: Text(
                  "How to join event?",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Axiforma',
                  ),
                ),

                children: <Widget>[
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.lightwhitecolor.withOpacity(0.5)),
                    child: Text(
                      "When booking a sedan, you will receive a booking confirmation via email directly after the booking. This confirms your booking. You will receive.",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                backgroundColor: AppColors.whitecolor.withOpacity(0.3),
                collapsedBackgroundColor: AppColors.lightwhitecolor.withOpacity(0.2),
                collapsedTextColor: AppColors.blackcolor,
                // leading: Icon(Icons.arrow_drop_down),
                title: Text(
                  "How to crate an event?",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
                ),

                children: <Widget>[
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.lightwhitecolor.withOpacity(0.5)),
                    child: Text(
                      "When booking a sedan, you will receive a booking confirmation via email directly after the booking. This confirms your booking. You will receive.",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                backgroundColor: AppColors.whitecolor.withOpacity(0.3),
                //  collapsedBackgroundColor: AppColors.lightwhite.withOpacity(0.2),
                collapsedTextColor: AppColors.blackcolor,
                // leading: Icon(Icons.arrow_drop_down),
                title: Text(
                  "How to create a page?",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Axiforma',
                  ),
                ),

                children: <Widget>[
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.lightwhitecolor.withOpacity(0.5)),
                    child: Text(
                      "When booking a sedan, you will receive a booking confirmation via email directly after the booking. This confirms your booking. You will receive.",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                backgroundColor: AppColors.whitecolor.withOpacity(0.3),
                //  collapsedBackgroundColor: AppColors.lightwhite.withOpacity(0.2),
                collapsedTextColor: AppColors.blackcolor,
                // leading: Icon(Icons.arrow_drop_down),
                title: Text(
                  "How to join event?",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Axiforma',
                  ),
                ),

                children: <Widget>[
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.lightwhitecolor.withOpacity(0.5)),
                    child: Text(
                      "When booking a sedan, you will receive a booking confirmation via email directly after the booking. This confirms your booking. You will receive.",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ExpansionTile(
                backgroundColor: AppColors.whitecolor.withOpacity(0.3),
                //  collapsedBackgroundColor: AppColors.lightwhite.withOpacity(0.2),
                collapsedTextColor: AppColors.blackcolor,
                // leading: Icon(Icons.arrow_drop_down),
                title: Text(
                  "Whats does the status closed means?",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Axiforma',
                  ),
                ),

                children: <Widget>[
                  Container(
                    height: 70,
                    width: 300,
                    decoration: BoxDecoration(
                        color: AppColors.lightwhitecolor.withOpacity(0.5)),
                    child: Text(
                      "When booking a sedan, you will receive a booking confirmation via email directly after the booking. This confirms your booking. You will receive.",
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
