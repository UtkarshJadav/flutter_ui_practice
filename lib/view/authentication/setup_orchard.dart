import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '/../constants/constants.dart';
import '/../reusable_widgets/edittext_with_label_and_icon.dart';
import '../authentication/authentication_success.dart';
import 'google_map_screen.dart';

class SetUpOrchardScreen extends ConsumerWidget {
  SetUpOrchardScreen({Key? key}) : super(key: key);
  TextEditingController orchardNameController = TextEditingController();
  TextEditingController estabController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController orchardStageController = TextEditingController();
  TextEditingController orchardYieldController = TextEditingController();
  TextEditingController orchardSizeController = TextEditingController();
  TextEditingController numPlantsController = TextEditingController();
  TextEditingController ageOfPlantController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: colorNavyBlue,
      appBar: AppBar(
        backgroundColor: colorNavyBlue,
        elevation: 0,
        title: const Text(
          'Setup your orchard',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.white),
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.15,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/info.svg'),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Select Orchard & update details to get more personalized result to your test',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  EditTextLabel(
                    controller: orchardNameController,
                    labelName: 'Enter orchard name',
                    hintText: 'Orchard name',
                    icon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter orchard Name';
                      }
                      return null;
                    },
                  ),
                  EditTextLabel(
                    controller: estabController,
                    labelName: 'Establishment date',
                    hintText: 'Orchard establishment date',
                    icon: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter establishment date';
                      }
                      return null;
                    },
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MapScreen(),
                        ),
                      );
                    },
                    child: EditTextLabel(
                        controller: locationController,
                        labelName: 'Select location from map',
                        hintText: 'Location',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select location from map';
                          }
                          return null;
                        },
                        isEnable: false,
                        icon: Icons.map),
                  ),
                  EditTextLabel(
                      controller: orchardStageController,
                      labelName: 'Orchard Stage',
                      hintText: 'Orchard stage',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select orchard stage';
                        }
                        return null;
                      },
                      icon: Icons.arrow_drop_down_sharp),
                  EditTextLabel(
                      controller: orchardYieldController,
                      labelName: 'Orchard Yield',
                      hintText: 'Average yield per plant last year',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select orchard yield';
                        }
                        return null;
                      },
                      icon: Icons.arrow_drop_down_sharp),
                  EditTextLabel(
                      controller: orchardSizeController,
                      labelName: 'Orchard Size',
                      hintText: 'Orchard size',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select orchard size';
                        }
                        return null;
                      },
                      icon: Icons.arrow_drop_down_sharp),
                  EditTextLabel(
                      controller: numPlantsController,
                      labelName: 'Number of plants',
                      hintText: 'Number of plants',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select number of plants';
                        }
                        return null;
                      },
                      icon: Icons.arrow_drop_down_sharp),
                  EditTextLabel(
                      controller: ageOfPlantController,
                      labelName: 'Age of plants',
                      hintText: 'Age of plants',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter age of plant';
                        }
                        return null;
                      },
                      icon: null),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    child: Text(
                      'Note: Age is auto detected based on establishment date and density',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthenticationSuccess(),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 22),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Add Orchard',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
