import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:saluswell_dietitan_app_updated/src/payementSection/services/paymentServices.dart';

import '../../../common/helperFunctions/navigatorHelper.dart';
import '../../../common/utils/appcolors.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../../../common/utils/themes.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../res.dart';
import '../../apppointmentsSection/models/appointmetntNewModel.dart';
import '../../apppointmentsSection/providers/available_time_slots.dart';
import '../../apppointmentsSection/screens/availableTimeSlots.dart';
import '../../apppointmentsSection/services/appointmentServices.dart';
import '../../apppointmentsSection/widgets/upcomingWidget.dart';
import '../../authenticationsection/Models/userModel.dart';
import '../../authenticationsection/services/userServices.dart';
import '../../notificationSection/screens/notificationListScreen.dart';
import '../../payementSection/models/paymentModel.dart';
import '../../payementSection/screens/revenue_payments.dart';
import '../provider/bottom_navbar_provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserServices userServices = UserServices();
  AppointmentServices appointmentServices = AppointmentServices();
  PaymentServices paymentServices = PaymentServices();

  @override
  void initState() {
    _initFcm();
    super.initState();
  }

  Future<void> _initFcm() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseMessaging.instance.subscribeToTopic('USERS');
    FirebaseMessaging.instance.getToken().then((token) {
      FirebaseFirestore.instance.collection('deviceTokens').doc(uid).set(
        {
          'deviceTokens': token,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: StreamProvider.value(
            value: userServices
                .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
            initialData: UserModel(),
            builder: (context, child) {
              UserModel model = context.watch<UserModel>();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        model.profilePicture == null
                            ? Consumer<BottomNavProvider>(
                                builder: (context, bottomNavProvider, __) {
                                return InkWell(
                                  onTap: () {
                                    bottomNavProvider.updateCurrentScreen(4);
                                  },
                                  child: Container(
                                    height: 37,
                                    width: 37,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                Res.articelsImagepng)),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                  ),
                                );
                              })
                            : Consumer<BottomNavProvider>(
                                builder: (context, bottomNavProvider, __) {
                                return InkWell(
                                  onTap: () {
                                    bottomNavProvider.updateCurrentScreen(4);
                                  },
                                  child: Row(
                                    children: [
                                      CacheNetworkImageWidget(
                                        height: 37,
                                        width: 37,
                                        imgUrl: model.profilePicture.toString(),
                                        radius: 7,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        // InkWell(
                        //   onTap: () {
                        //     toNext(context: context, widget: MyProfileScreen());
                        //   },
                        //   child: Image.asset(
                        //     Res.articelsImagepng,
                        //     height: 37,
                        //     width: 37,
                        //   ),
                        // ),
                        Row(
                          children: [
                            Consumer<TimeSlotProvider>(
                                builder: (context, timeslotProvider, __) {
                              return IconButton(
                                  onPressed: () {
                                    // timeslotProvider.fetchDietitianAvailability(
                                    //     "xyJ34m3EMCcgOIFq1u2nVZlPjP72");
                                    toNext(
                                        context: context,
                                        widget: AvailableTimeSlots(
                                          userID: model.userId.toString(),
                                        ));
                                    // toNext(
                                    //     context: context,
                                    //     widget: CalendarScreen());
                                  },
                                  icon: const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 26,
                                    color: AppColors.appcolor,
                                  ));
                            }),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                toNext(
                                    context: context,
                                    widget: const NotificaionsListScreen());
                              },
                              child: SvgPicture.asset(
                                Res.notificationbell,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            "Hi ",
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 15,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            model.userType.toString().toUpperCase(),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 15,
                                color: AppColors.appcolor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            model.userName.toString().toUpperCase(),
                            style: fontW5S12(context)!.copyWith(
                                fontSize: 15,
                                color: AppColors.blackcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Promoting good health",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 24,
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "and preventing disease.",
                        style: fontW5S12(context)!.copyWith(
                            fontSize: 24,
                            color: AppColors.appcolor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 158,
                            width: 150,
                            decoration: BoxDecoration(
                              color: AppColors.lightwhitecolor,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StreamProvider.value(
                                      value: appointmentServices
                                          .streamAllAppointments(
                                              FirebaseUtils.progress),
                                      initialData: [AppointmentModelNew()],
                                      builder: (context, child) {
                                        List<AppointmentModelNew>
                                            appointmentList = context.watch<
                                                List<AppointmentModelNew>>();
                                        return appointmentList.isEmpty
                                            ? const Text("0",
                                                style: TextStyle(
                                                    // fontFamily: 'Gilroy',
                                                    color: AppColors.blackcolor,
                                                    // decoration: TextDecoration.underline,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Axiforma',
                                                    fontSize: 17))
                                            : appointmentList[0]
                                                        .appointmentId ==
                                                    null
                                                ? const SpinKitPouringHourGlass(
                                                    size: 30,
                                                    color: AppColors.appcolor,
                                                  )
                                                : Text(
                                                    appointmentList.isEmpty
                                                        ? "0"
                                                        : appointmentList.length
                                                            .toString(),
                                                    style: fontW5S12(context)!
                                                        .copyWith(
                                                            fontSize: 26,
                                                            color: AppColors
                                                                .appcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  );
                                      }),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "Upcoming",
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 14,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Appointments",
                                    style: fontW5S12(context)!.copyWith(
                                        fontSize: 14,
                                        color: AppColors.blackcolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Consumer<BottomNavProvider>(builder:
                                      (context, bottomNavProvider, __) {
                                    return InkWell(
                                      onTap: () {
                                        bottomNavProvider
                                            .updateCurrentScreen(1);
                                      },
                                      child: Container(
                                        height: 38,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: AppColors.appcolor,
                                            borderRadius:
                                                BorderRadius.circular(9)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "View All",
                                              style: fontW5S12(context)!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color:
                                                          AppColors.whitecolor,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            SvgPicture.asset(
                                                Res.arrownextsimple)
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        StreamProvider.value(
                            value: paymentServices.streamsPaymentsList(),
                            initialData: [PaymentModel()],
                            builder: (context, child) {
                              List<PaymentModel> paymentsList =
                                  context.watch<List<PaymentModel>>();
                              // Use fold to calculate the total amount

                              return paymentsList.isEmpty
                                  ? const Center(
                                      child: Padding(
                                      padding: EdgeInsets.only(top: 220),
                                      child: Text("No Revenue History Found!",
                                          style: TextStyle(
                                              // fontFamily: 'Gilroy',
                                              color: AppColors.blackcolor,
                                              // decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Axiforma',
                                              fontSize: 13)),
                                    ))
                                  : paymentsList[0].paymentId == null
                                      ? const SpinKitPouringHourGlass(
                                          size: 30,
                                          color: AppColors.appcolor,
                                        )
                                      : Expanded(
                                          flex: 5,
                                          child: Container(
                                            height: 158,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: AppColors.lightwhitecolor,
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "\$" +
                                                        paymentServices
                                                            .calculateTotalRevenue(
                                                                paymentsList)
                                                            .toString(),
                                                    style: fontW5S12(context)!
                                                        .copyWith(
                                                            fontSize: 26,
                                                            color: AppColors
                                                                .appcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    "Revenue",
                                                    style: fontW5S12(context)!
                                                        .copyWith(
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .blackcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      toNext(
                                                          context: context,
                                                          widget:
                                                              RevenueListPaymentsScreen());
                                                    },
                                                    child: Container(
                                                      height: 38,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .whitecolor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(9)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Show Stats",
                                                            style: fontW5S12(
                                                                    context)!
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    color: AppColors
                                                                        .blackcolor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                          const SizedBox(
                                                            width: 6,
                                                          ),
                                                          SvgPicture.asset(
                                                            Res.arrownextsimple,
                                                            color: AppColors
                                                                .blackcolor,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your Upcoming Appointments",
                          style: fontW5S12(context)!.copyWith(
                              fontSize: 16,
                              color: AppColors.blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                        Consumer<BottomNavProvider>(
                            builder: (context, bottomNavProvider, __) {
                          return InkWell(
                            onTap: () {
                              bottomNavProvider.updateCurrentScreen(1);
                            },
                            child: Text(
                              "View All",
                              style: fontW5S12(context)!.copyWith(
                                  fontSize: 15,
                                  color: AppColors.appcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamProvider.value(
                        value: appointmentServices
                            .streamAllAppointments(FirebaseUtils.progress),
                        initialData: [AppointmentModelNew()],
                        builder: (context, child) {
                          List<AppointmentModelNew> appointmentList =
                              context.watch<List<AppointmentModelNew>>();
                          return appointmentList.isEmpty
                              ? const Center(
                                  child: Padding(
                                  padding: EdgeInsets.only(top: 130),
                                  child: Text("No Upcoming Appointments found!",
                                      style: TextStyle(
                                          // fontFamily: 'Gilroy',
                                          color: AppColors.blackcolor,
                                          // decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Axiforma',
                                          fontSize: 13)),
                                ))
                              : appointmentList[0].appointmentId == null
                                  ? const SpinKitPouringHourGlass(
                                      size: 30,
                                      color: AppColors.appcolor,
                                    )
                                  : Expanded(
                                      flex: 4,
                                      child: ListView.builder(
                                          itemCount: appointmentList.length,
                                          shrinkWrap: true,
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          itemBuilder: ((context, index) {
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 12),
                                              child: InkWell(
                                                onTap: () {},
                                                child: UpcomingWidget(
                                                  appointmentModel:
                                                      appointmentList[index],
                                                ),
                                              ),
                                            );
                                          })),
                                    );
                        })
                    // StreamProvider.value(
                    //     value: appointmentServices
                    //         .streamAllAppointments(FirebaseUtils.progress),
                    //     initialData: [AppointmentModel()],
                    //     builder: (context, child) {
                    //       List<AppointmentModel> appointmentList =
                    //           context.watch<List<AppointmentModel>>();
                    //       return appointmentList.isEmpty
                    //           ? const Center(
                    //               child: Padding(
                    //               padding: EdgeInsets.only(top: 220),
                    //               child: Text(
                    //                   "No Upcoming Appointments found! Book Now",
                    //                   style: TextStyle(
                    //                       // fontFamily: 'Gilroy',
                    //                       color: AppColors.blackcolor,
                    //                       // decoration: TextDecoration.underline,
                    //                       fontWeight: FontWeight.w700,
                    //                       fontFamily: 'Axiforma',
                    //                       fontSize: 13)),
                    //             ))
                    //           : appointmentList[0].appointmentId == null
                    //               ? const SpinKitPouringHourGlass(
                    //                   size: 30,
                    //                   color: AppColors.appcolor,
                    //                 )
                    //               : Expanded(
                    //                   child: ListView.builder(
                    //                       itemCount: 12,
                    //                       shrinkWrap: true,
                    //                       padding:  EdgeInsets.only(),
                    //                       itemBuilder: ((context, index) {
                    //                         return  Padding(
                    //                           padding:
                    //                               EdgeInsets.only(bottom: 12),
                    //                           child:
                    //                               UpcomingAppointmentsTileWidget(
                    //                             appointmentModel: appointmentList[index],
                    //                           ),
                    //                         );
                    //                       })),
                    //                 );
                    //     })
                  ],
                ),
              );
            }));
  }
}
