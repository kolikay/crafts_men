// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/utils/image_storage_methods.dart';
import 'package:craftsmen/constants/utils/pick_image.dart';
import 'package:craftsmen/constants/utils/progress_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _fullnameCont = TextEditingController();
  final _usernameCont = TextEditingController();
  final _phone = TextEditingController();
  final _gender = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _address = TextEditingController();
  Uint8List? _image;
  String? photo;

  bottomSheet(BuildContext context, WidgetRef ref) async {
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
                          Uint8List im =
                              await PickImage.pickImage(ImageSource.camera);
                          setState(() {
                            _image = im;
                          });
                          
                          Navigator.pop(context);
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
                          Uint8List im =
                              await PickImage.pickImage(ImageSource.gallery);
                          Navigator.pop(context);
                          setState(() {
                            _image = im;
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
  Widget build(BuildContext context) {
    User currentUser = FirebaseAuth.instance.currentUser!;
    final authViewModel = ref.watch(authViewModelProvider);

    getInputedData(String? photoUrl) {
      final body = {
        "ID": currentUser.uid,
        "email": _email.text.trim(),
        "Full Name": _fullnameCont.text.trim(),
        "User Name": _usernameCont.text.trim(),
        'Phone Number': _phone.text.trim(),
        "Gender": _gender.text.trim(),
        "address": _address.text.trim(),
        'Reviews': [],
        'Profile Pic': photoUrl,
      };
      return body;
    }

    //user data update notifire
    final userInfoProvider = ref.watch(userProvider);
    final user = userInfoProvider.userApiData;

    _email.text = user.email ?? '';
    _fullnameCont.text = user.fullName ?? '';
    _usernameCont.text = user.userName ?? '';
    _phone.text = user.phoneNumber ?? '';
    _gender.text = user.gender ?? '';
    photo = user.profilePic;
    _address.text = user.address ?? 'No 27, Kenneth Street, Ikoyi,Lagos state';

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
                    if (onEdit) {
                      String photoUrl = await StorageMethods()
                          .uploadImageTostorage(
                              'UserProfilePicx', _image!, false);

                      await userInfoProvider
                          .updateLoggedinUserDetails(getInputedData(photoUrl));
                    }
                    setState(() {
                      onEdit = !onEdit;
                    });
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
                        photo != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(photo!),
                              )
                            :  const CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    AssetImage('lib/assets/profileImage.jpeg'),
                              ),
                        // setPhoto(),
                        onEdit
                            ? Positioned(
                                top: 35.h,
                                left: 35.w,
                                child: IconButton(
                                  color: Colors.white,
                                  iconSize: 40.w,
                                  icon: const Icon(
                                    Icons.camera_alt,
                                  ),
                                  onPressed: () {
                                    bottomSheet(context, ref);
                                  },
                                ),
                              )
                            : const SizedBox(),
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
                            enable: onEdit,
                            controller: _fullnameCont,
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
                            enable: onEdit,
                            controller: _usernameCont,
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
                            enable: onEdit,
                            controller: _email,
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
                            enable: onEdit,
                            controller: _gender,
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
                            enable: onEdit,
                            controller: _address,
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
                            enable: onEdit,
                            controller: _phone,
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
                              ? ProfileFormField(
                                  enable: onEdit,
                                  controller: _password,
                                  obcureText: false,
                                  keyBoardType: TextInputType.text,
                                  isPassword: false,
                                  isReadOnly: !onEdit,
                                  labelText: 'Password',
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 24.h,
                          ),
                          onEdit
                              ? ProfileFormField(
                                  controller: _password,
                                  obcureText: false,
                                  keyBoardType: TextInputType.text,
                                  isPassword: false,
                                  isReadOnly: !onEdit,
                                  labelText: 'Confirm Password',
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: authViewModel.loading
                    ? const Center(
                        child: ProgressDialog(
                          message: 'Loading....',
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ));
  }
}
