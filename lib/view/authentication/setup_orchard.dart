import 'package:flutter/material.dart';
import '../authentication/authentication_success.dart';
import '/../constants/constants.dart';
import 'package:flutter_svg/svg.dart';

import '/../reusable_widgets/edittext_with_label_and_icon.dart';

class SetUpOrchardScreen extends StatefulWidget {
  const SetUpOrchardScreen({Key? key}) : super(key: key);

  @override
  State<SetUpOrchardScreen> createState() => _SetUpOrchardScreenState();
}

class _SetUpOrchardScreenState extends State<SetUpOrchardScreen> {
  @override
  Widget build(BuildContext context) {
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
                const EditTextLabel(
                    labelName: 'Enter orchard name',
                    hintText: 'Orchard name',
                    icon: null),
                const EditTextLabel(
                    labelName: 'Establishment date',
                    hintText: 'Orchard establishment date',
                    icon: null),
                const EditTextLabel(
                    labelName: 'Select location from map',
                    hintText: 'Location',
                    icon: Icons.map),
                const EditTextLabel(
                    labelName: 'Orchard Stage',
                    hintText: 'Orchard stage',
                    icon: Icons.arrow_drop_down_sharp),
                const EditTextLabel(
                    labelName: 'Orchard Yield',
                    hintText: 'Average yield per plant last year',
                    icon: Icons.arrow_drop_down_sharp),
                const EditTextLabel(
                    labelName: 'Orchard Size',
                    hintText: 'Orchard size',
                    icon: Icons.arrow_drop_down_sharp),
                const EditTextLabel(
                    labelName: 'Number of plants',
                    hintText: 'Number of plants',
                    icon: Icons.arrow_drop_down_sharp),
                const EditTextLabel(
                    labelName: 'Age of plants',
                    hintText: 'Age of plants',
                    icon: null),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Text(
                    'Note: Age is auto detected based on establishment date and density',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationSuccess(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
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
    );
  }
}
