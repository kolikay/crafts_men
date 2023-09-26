import 'package:craftsmen/constants/const/app_state_constants.dart';
import 'package:craftsmen/constants/const/color.dart';
import 'package:craftsmen/constants/reusesable_widgets/normal_text.dart';
import 'package:craftsmen/constants/reusesable_widgets/profleFormFields.dart';
import 'package:craftsmen/constants/reusesable_widgets/reusaable_textformfield.dart';
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
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _address = TextEditingController();

  bottomSheet(BuildContext context, WidgetRef ref) async {
    final profileViewModel = ref.watch(profileViewModelProvider);
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
                        onPressed: () {
                          profileViewModel.pickImage(ImageSource.camera);
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
                        onPressed: () {
                          profileViewModel.pickImage(ImageSource.gallery);
                          Navigator.pop(context);
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
    //profile picture update notifire
    // final profileViewModel = ref.watch(profileViewModelProvider);

    //user data update notifire
    // final userApiData = ref.watch(userProvider);

    // _email.text = userApiData.email ?? '';
    // _fullnameCont.text = userApiData.fullname ?? '';
    // _usernameCont.text = userApiData.username ?? '';

    _email.text = 'kolikay2gmail.com';
    _fullnameCont.text = 'kolawole fabusuyi';
    _usernameCont.text = 'kolikay';
    _phone.text = "08062842978";
    _address.text = 'No 27, Kenneth Street, Ikoyi,Lagos state';

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
                  onPressed: () {
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
          child: SizedBox(
            height: 821.h,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Stack(
                  children: [
                    // ClipOval(child: Image.file(image!, width: 100.w, height: 100.h, fit: BoxFit.cover,), )
                    // profileViewModel.image != null
                    //     ?
                    Container(
                      height: 130.h,
                      width: 130.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('lib/assets/logoTrans.png'),
                        ),
                      ),
                    ),
                    // : Container(
                    //     height: 130.h,
                    //     width: 130.w,
                    //     decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage(
                    //           'lib/assets/homepageimage.png',
                    //         ),
                    //       ),
                    //     ),
                    //   ),
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
                        labelText: 'phone Number',
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
        ));
  }
}
