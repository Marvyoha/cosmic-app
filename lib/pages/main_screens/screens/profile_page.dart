import 'package:cosmic/constants/color_palette.dart';
import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:cosmic/pages/auth_screens/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../constants/font_styles.dart';
import '../../../constants/global_variables.dart';
import '../../../core/providers/serviceproviders.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);

    TextEditingController updatedNameController = TextEditingController();
    return MainScaffold(
        child: Column(
      children: [
        // APPBAR
        Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: const BorderRadius.all(
                Radius.circular(26),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 40,
                      minRadius: 30,
                      child: Icon(
                        Icons.chevron_left,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                GlobalVariables.spaceMedium(context, isWidth: true),
                Text(
                  'My Profile',
                  style: FontStyles.headerLarge,
                ),
                GlobalVariables.spaceMedium(context, isWidth: true),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 26,
                  child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.transparent,
                              child: AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: Container(
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(40)),
                                  height: 200,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'You really want to log out?',
                                          style: FontStyles.headerMedium,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GlobalVariables.spaceMedium(context,
                                                isWidth: true),
                                            GlobalVariables.spaceMedium(context,
                                                isWidth: true),
                                            TextButton(
                                                onPressed: () {
                                                  servicesProvider.signOut();
                                                  Navigator
                                                      .pushReplacementNamed(
                                                    context,
                                                    'login',
                                                  );
                                                },
                                                child: Text(
                                                  'Yes',
                                                  style: FontStyles.headerSmall
                                                      .copyWith(
                                                          color:
                                                              AppColors.error),
                                                )),
                                            const SizedBox(width: 6),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel',
                                                    style: FontStyles
                                                        .headerSmall
                                                        .copyWith(
                                                            color: AppColors
                                                                .accent)))
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: AppColors.error,
                      )),
                ),
              ],
            )),
        GlobalVariables.spaceLarge(context),
// BODY
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // MAIN PROFILE
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(26),
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: servicesProvider.getCurrentUserDoc(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Text(
                                    '${servicesProvider.currentUserDoc?['name']}',
                                    style: FontStyles.headerMedium,
                                  );
                                } else {
                                  return Text(
                                    'Loading.....',
                                    style: FontStyles.bodyMedium
                                        .copyWith(color: Colors.white),
                                  );
                                }
                              },
                            ),
                            Text(
                              'Space Adventurer',
                              style: FontStyles.bodyMedium,
                            )
                          ],
                        ),
                        GlobalVariables.spaceMedium(context),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return
                                          // THIS CONTAINER IS TO NOT ALLOW POPPING WHEN EMPTY SPACE IS PRESSED
                                          Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: AlertDialog(
                                          backgroundColor: Colors.transparent,
                                          content: Container(
                                            padding: const EdgeInsets.all(30),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            height: 200,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomTextField(
                                                    text: 'Update your name',
                                                    controller:
                                                        updatedNameController,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GlobalVariables
                                                          .spaceMedium(context,
                                                              isWidth: true),
                                                      GlobalVariables
                                                          .spaceMedium(context,
                                                              isWidth: true),
                                                      TextButton(
                                                          onPressed: () {
                                                            servicesProvider.updateUserDetails(
                                                                fullname:
                                                                    updatedNameController
                                                                        .text,
                                                                documentId:
                                                                    servicesProvider
                                                                        .docId);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Edit',
                                                            style: FontStyles
                                                                .headerSmall
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .accent),
                                                          )),
                                                      const SizedBox(width: 6),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Cancel',
                                                              style: FontStyles
                                                                  .headerSmall
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .active)))
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.active,
                                  size: 25,
                                )),
                            GlobalVariables.spaceMedium(context),
                          ],
                        )
                      ],
                    ),
                  )),

              // FAVOURITES STATS
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(26),
                  ),
                ),
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 40,
                      progressColor: AppColors.altColor,
                      animation: true,
                      percent: 0.6,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
