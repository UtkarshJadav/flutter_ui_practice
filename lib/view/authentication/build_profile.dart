import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/models/success_common_model.dart';
import 'package:flutter_demo/state/login_provider.dart';
import 'package:flutter_demo/utils/helpers/shared_pref_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../utils/common/constants.dart';
import '/../constants/constants.dart';
import '/../reusable_widgets/edittext_with_label_and_icon.dart';
import '../../models/results.dart';
import '../authentication/setup_orchard.dart';

class BuildProfile extends ConsumerWidget {
  final ImagePicker _picker = ImagePicker();
  DateTime? _selectedDate;
  TextEditingController dobController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  BuildProfile({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    ref.read(prefProvider).set(SharedPref.loggedIn, true);
    XFile? file = ref.watch(profilePic.state).state;
    return Scaffold(
      backgroundColor: colorNavyBlue,
      appBar: AppBar(
        backgroundColor: colorNavyBlue,
        elevation: 0,
        title: const Text(
          'Let’s build your profile',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0,
                              MediaQuery.of(context).size.height * 0.02),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border:
                                  Border.all(color: Colors.grey, width: 1.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: file == null
                                  ? SvgPicture.asset(
                                      'assets/images/ic_profile.svg')
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(17),
                                      child: Image.file(File(file.path),
                                          fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Select Photo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,
                                          color: Colors.black),
                                    ),
                                    InkWell(
                                      child: const Text(
                                        'Gallery',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                      onTap: () {
                                        _onImageButtonPressed(
                                            ImageSource.gallery, ref,
                                            context: context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    InkWell(
                                      child: const Text(
                                        'Camera',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                            color: Colors.black),
                                      ),
                                      onTap: () {
                                        _onImageButtonPressed(
                                            ImageSource.camera, ref,
                                            context: context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.asset(
                              'assets/images/upload_profile.svg'),
                        ),
                      ),
                    ],
                  ),
                  EditTextLabel(
                    controller: firstNameController,
                    labelName: 'First name',
                    hintText: 'First name',
                    icon: Icons.account_circle_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                  ),
                  EditTextLabel(
                    controller: lastNameController,
                    labelName: 'Last name',
                    hintText: 'Last name',
                    icon: Icons.account_circle_rounded,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                  ),
                  EditTextLabel(
                    controller: emailController,
                    labelName: 'Email',
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty || !RegExp(RegexConstants.emailValidator).hasMatch(value)) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: EditTextLabel(
                      controller: dobController,
                      labelName: 'Date Of Birth',
                      hintText: 'Date Of Birth',
                      isEnable: false,
                      icon: Icons.calendar_today_rounded,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select Date of Birth';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 22),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SetUpOrchardScreen(),
                          ),
                        );
                        if (_formKey.currentState!.validate()) {
                          if (file != null) {
                            ref.read(loginProvider.notifier).buildProfile(
                                ref.read,
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                dobController.text, onSuccess: (res) {
                              var result =
                                  Results(create: () => SuccessResponse())
                                      .fromJson(jsonDecode(res.data));

                              print(result.data?.message ?? '');

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                       SetUpOrchardScreen(),
                                ),
                              );
                            }, onError: (error) {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Please select profile picture"),
                                    duration: Duration(seconds: 1)));
                          }
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source, WidgetRef ref,
      {required BuildContext context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 300,
        maxHeight: 300,
      );

      ref.read(profilePic.state).state = pickedFile;
    } catch (e) {
      ref.read(profileError.state).state = e;
    }
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                  primary: Colors.green.shade300,
                  onPrimary: Colors.black,
                  surface: colorNavyBlue,
                  onSurface: Colors.white),
              dialogBackgroundColor: colorNavyBlue.withRed(1),
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dobController
        ..text = DateFormat('yyyy-MM-dd').format(_selectedDate ?? DateTime.now())
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dobController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
