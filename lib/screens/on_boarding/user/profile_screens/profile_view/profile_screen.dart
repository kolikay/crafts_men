// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/utils/image_storage_methods.dart';
import 'package:craftsmen/constants/utils/pick_image.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:craftsmen/models/models.dart';
import 'package:craftsmen/screens/auth/auth_view_models/auth_view_model.dart';
import 'package:craftsmen/screens/change_password/email_password_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'profileScrren';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool readOnly = true;
  bool onEdit = false;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? fullName;
  String? userName;
  String? phoneNumber;
  String? gender;
  String? address;
  String? photo;
  String? photoUrl;
  bool loading = false;

  bottomSheet(
    BuildContext context,
  ) async {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          height: 150.h,
          child: Column(
            children: [
              NormalText(
                text: 'Choose Profile Picture',
                fontWeight: FontWeight.w700,
                size: 20.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        color: kMainColor,
                        iconSize: 50.w,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          Uint8List im =
                              await PickImage.pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                          String? image = await StorageMethods()
                              .uploadImageTostorage(
                                  'UserProfilePicx', im, false);
                          setState(() {
                            photo = image;
                            loading = false;
                          });
                        },
                        icon: const Icon(Icons.add_a_photo_rounded),
                      ),
                      NormalText(text: 'Camera')
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        color: kMainColor,
                        iconSize: 50.w,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          Uint8List im =
                              await PickImage.pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                          String? image = await StorageMethods()
                              .uploadImageTostorage(
                                  'UserProfilePicx', im, false);
                          setState(() {
                            photo = image;
                            loading = false;
                          });
                        },
                        icon: const Icon(Icons.image),
                      ),
                      NormalText(
                        text: 'Galary',
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    final userInfoProvider = ref.watch(userProvider);
    final user = userInfoProvider.userApiData;
    getApiData(user);
    super.didChangeDependencies();
  }

  getApiData(UserModel user) async {
    email = user.email ?? '';
    fullName = user.fullName ?? '';
    userName = user.userName ?? '';
    phoneNumber = user.phoneNumber ?? '';
    gender = user.gender ?? '';
    photoUrl = user.profilePic ?? '';

    address = user.address ??
        'No 27, Kenneth Street, Ikoyi,Lagos state (Test Address)';
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = ref.watch(authViewModelProvider);
    final userInfoProvider = ref.watch(userProvider);

    getInputedData() {
      final body = {
        "email": email,
        "Full Name": fullName,
        "User Name": userName,
        'Phone Number': phoneNumber,
        "Gender": gender,
        "address": address,
        'Reviews': [],
      };
      return body;
    }

    Widget getProfileImage() {
      if (photo != null && photoUrl != null) {
        return CircleAvatar(radius: 64, backgroundImage: NetworkImage(photo!));
      }
      if (photoUrl != null) {
        return CircleAvatar(
          radius: 64,
          backgroundImage: NetworkImage(photoUrl!),
        );
      }

      return const CircleAvatar(
        radius: 64,
        backgroundImage: AssetImage('lib/assets/profileImage.jpeg'),
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: AppBar(
            title: Padding(
              padding: EdgeInsets.only(
                top: 10.0.h,
              ),
              child: NormalText(
                text: 'Profile',
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            toolbarHeight: 103.h,
            backgroundColor: kMainColor,
            leading: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10.0.h,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: !onEdit
                      ? Icon(
                          Icons.arrow_back_ios,
                          size: 20.w,
                        )
                      : Icon(Icons.close, size: 20.w),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
                child: IconButton(
                  onPressed: () async {
                    AuthViewModel.instance.setLoading(true);
                    if (onEdit) {
                      await userInfoProvider
                          .updateLoggedinUserDetails(getInputedData());
                    }

                    setState(() {
                      onEdit = !onEdit;
                    });
                    AuthViewModel.instance.setLoading(false);
                  },
                  icon: onEdit
                      ? Icon(Icons.save, size: 30.w)
                      : Icon(Icons.edit, size: 30.w),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: 821.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Stack(
                      children: [
                        !loading
                            ? getProfileImage()
                            : const CircularProgressIndicator(
                                color: Colors.blueAccent,
                              ),
                        Positioned(
                          bottom: -10.h,
                          left: 85.w,
                          child: IconButton(
                            color: kMainColor,
                            iconSize: 30.w,
                            icon: const Icon(
                              Icons.camera_alt,
                            ),
                            onPressed: () {
                              bottomSheet(context);
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          ProfileFormField(
                            initialValue: fullName,
                            onChanged: (val) {
                              setState(() {
                                fullName = val;
                              });
                            },
                            enable: onEdit,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Full Name',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ProfileFormField(
                            initialValue: userName,
                            onChanged: (val) {
                              setState(() {
                                userName = val;
                              });
                            },
                            enable: onEdit,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Username',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ProfileFormField(
                            initialValue: email,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            enable: onEdit,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Email',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ProfileFormField(
                            initialValue: gender,
                            onChanged: (val) {
                              setState(() {
                                gender = val;
                              });
                            },
                            enable: onEdit,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: true,
                            labelText: 'Gender',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ProfileFormField(
                            initialValue: address,
                            onChanged: (val) {
                              setState(() {
                                address = val;
                              });
                            },
                            enable: onEdit,
                            obcureText: false,
                            keyBoardType: TextInputType.text,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Address',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          ProfileFormField(
                            initialValue: phoneNumber,
                            onChanged: (val) {
                              setState(() {
                                phoneNumber = val;
                              });
                            },
                            enable: onEdit,
                            obcureText: false,
                            keyBoardType: TextInputType.number,
                            isPassword: false,
                            isReadOnly: !onEdit,
                            labelText: 'Phone Number',
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          onEdit
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, EmailPasswordChangeScreen.id);
                                  },
                                  child: NormalText(
                                    size: 18,
                                    fontWeight: FontWeight.w600,
                                    text: 'Change Password',
                                    color: kMainColor,
                                  ))
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              authViewModel.loading
                  ? const Center(
                      child: ProgressDialog(
                        message: 'Loading....',
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ));
  }
}
