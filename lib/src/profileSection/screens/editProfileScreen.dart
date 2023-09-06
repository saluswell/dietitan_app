import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/appcolors.dart';
import '../../../common/widgets/button_widget.dart';
import '../../../common/widgets/cacheNetworkImageWidget.dart';
import '../../../common/widgets/textfield_widget.dart';
import '../../../res.dart';
import '../../authenticationsection/Models/userModel.dart';
import '../../authenticationsection/providers/authProvider.dart';
import '../../authenticationsection/services/userServices.dart';

class EditProfileScreen extends StatefulWidget {
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String firebaseimage;

  const EditProfileScreen(
      {Key? key,
      this.userId,
      this.userName,
      this.userEmail,
      required this.firebaseimage})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  UserServices userServices = UserServices();

  @override
  void initState() {
    ///We have to populate our text editing controllers with speicifid product details
    userNameController = TextEditingController(text: widget.userName);
    emailController = TextEditingController(text: widget.userEmail);

    //contactNumberController = TextEditingController(text: widget.userimage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, __) {
      return LoadingOverlay(
        isLoading: authProvider.isLoading,
        progressIndicator: const SpinKitPouringHourGlass(
          size: 30,
          color: AppColors.appcolor,
        ),
        child: Scaffold(
            body: StreamProvider.value(
                value: userServices
                    .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
                initialData: UserModel(),
                builder: (context, child) {
                  UserModel model = context.watch<UserModel>();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
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
                              const Text("Edit Profile",
                                  style: TextStyle(
                                      // fontFamily: 'Gilroy',
                                      color: AppColors.blackcolor,
                                      // decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Axiforma',
                                      fontSize: 15)),
                              Row(
                                children: [
                                  // SvgPicture.asset(
                                  //   Res.threedots,
                                  //   height: 23,
                                  //   width: 23,
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        // Container(
                        //     height: 110,
                        //     width: 110,
                        //     // child: SvgPicture.asset(
                        //     //   Res.invitefriendbanner,
                        //     //   fit: BoxFit.cover,
                        //     // ),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(17),
                        //       border: Border.all(width: 3, color: AppColors.appcolor),
                        //       //shape: BoxShape.circle,
                        //
                        //       image: DecorationImage(
                        //           fit: BoxFit.cover, image: AssetImage(Res.articelsImagepng)),
                        //     )),

                        // Container(
                        //     height: 110,
                        //     width: 110,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(17),
                        //       border: Border.all(width: 3, color: AppColors.appcolor),
                        //       //shape: BoxShape.circle,

                        //       image: DecorationImage(
                        //         fit: BoxFit.cover,
                        //         image: authProvider.profileImage == null
                        //             ? widget.firebaseimage==null
                        //                 ? const AssetImage(Res.articelsImagepng)
                        //                 : NetworkImage(widget.firebaseimage.toString())
                        //                     as ImageProvider
                        //             : FileImage(authProvider.profileImage!),
                        //       ),
                        //     )),

                        authProvider.profileImage == null
                            ? model.profilePicture == null
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(Res.articelsImagepng))
                                : CacheNetworkImageWidget(
                                    height: 100,
                                    width: 100,
                                    imgUrl: widget.firebaseimage.toString(),
                                    radius: 7)
                            : Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          FileImage(authProvider.profileImage!),
                                    ),
                                    border: Border.all(
                                        width: 3, color: AppColors.appcolor),
                                    borderRadius: BorderRadius.circular(11)),
                                height: 100,
                                width: 100,
                              ),

                        // CacheNetworkImageWidget(
                        //     height: 100,
                        //     width: 100,
                        //     imgUrl: widget.firebaseimage.toString(),
                        //     radius: 7),

                        //   Container(
                        // height: 100,
                        // width: 100,
                        // child: Image.file(authProvider.profileImage!)),

                        // Container(
                        //     height: 110,
                        //     width: 110,
                        //     // child: SvgPicture.asset(
                        //     //   Res.invitefriendbanner,
                        //     //   fit: BoxFit.cover,
                        //     // ),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(17),
                        //       border: Border.all(width: 3, color: AppColors.appcolor),
                        //       //shape: BoxShape.circle,

                        //       image: DecorationImage(
                        //         fit: BoxFit.cover,
                        //         image: authProvider.profileImage == null
                        //             ? widget.firebaseimage!.isEmpty
                        //                 ? AssetImage(Res.articelsImagepng)
                        //                 : NetworkImage(widget.firebaseimage.toString())
                        //                     as ImageProvider
                        //             : FileImage(authProvider.profileImage!)
                        //                 as ImageProvider,
                        //       ),
                        //     )),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 55),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: ((context) => SimpleDialog(
                                        title: const Text(
                                          "Select Docs",
                                          style: TextStyle(
                                              color: AppColors.whitecolor),
                                        ),
                                        children: [
                                          Row(
                                            children: [
                                              SimpleDialogOption(
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.image,
                                                      color:
                                                          AppColors.whitecolor,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Gallery",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .whitecolor),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  //
                                                  authProvider.pickProfileImage(
                                                      context,
                                                      ImageSource.gallery);
                                                  Navigator.pop(context);
                                                  //
                                                },
                                              ),
                                              SimpleDialogOption(
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.camera_alt,
                                                      color:
                                                          AppColors.whitecolor,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Camera",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .whitecolor),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () {
                                                  authProvider.pickProfileImage(
                                                      context,
                                                      ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      )));
                              // getImage(true);
                              // pushNewScreen(context,
                              //     withNavBar: false, screen: SignInScreen());
                            },
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.lightdarktextcolor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      Res.changeProfilephotosvg,
                                      height: 25,
                                      width: 25,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Text("Change Profile Photo",
                                        style: TextStyle(
                                            // fontFamily: 'Gilroy',
                                            color: AppColors.blackcolor,
                                            // decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Axiforma',
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("File should not be greater than 5 Mb",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.lightdarktextcolor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              controller: userNameController,
                              textFieldHeight: 55,
                              maxlines: 1,
                              toppadding: 18,
                              hintText: "UserName",
                              textInputType: TextInputType.emailAddress),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFieldWidget(
                              showSuffixIcon: false,
                              enabled: false,
                              controller: emailController,
                              textFieldHeight: 55,
                              maxlines: 1,
                              toppadding: 18,
                              hintText: "Email",
                              textInputType: TextInputType.emailAddress),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        CommonButtonWidget(
                            horizontalPadding: 8,
                            backgroundcolor: AppColors.appcolor,
                            text: "Update Profile",
                            textfont: 16,
                            onTap: () {
                              authProvider.updateProfile(
                                  widget.userId.toString(),
                                  userNameController.text);
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                })),
      );
    });
  }
}
