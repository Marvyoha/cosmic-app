import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/color_palette.dart';
import '../../../constants/font_styles.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/widgets/image_button.dart';
import '../../../constants/widgets/main_scaffold.dart.dart';
import '../../../core/providers/serviceproviders.dart';
import '../widgets/auth_button.dart';
import '../widgets/customtextfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);

    void signUpLogic() {
      if (passwordController.text == confirmPasswordController.text) {
        // Create User
        servicesProvider.signUp(emailController.text, passwordController.text);

        // Add user details in the database  (cloud firestore)
        servicesProvider.storeUserDetails(
            email: emailController.text, fullname: nameController.text);
        servicesProvider.signOut();
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.white,
            content: Center(
              child: Text(
                'Password does not match',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      }
    }

    return MainScaffold(
      notMainPage: true,
      child: Column(
        children: [
          GlobalVariables.spaceSmall(context),
          GlobalVariables.spaceSmall(context),
          Image.asset(GlobalVariables.logo),
          GlobalVariables.spaceMedium(context),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: GlobalVariables.darkTranslusent,
                width: GlobalVariables.sizeWidth(context),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalVariables.spaceSmall(context),
                      Text('Sign up',
                          textAlign: TextAlign.center,
                          style: FontStyles.headerLarge),
                      GlobalVariables.spaceMedium(context),

                      CustomTextField(
                          text: 'Full Name', controller: nameController),

                      GlobalVariables.spaceMedium(context),

                      CustomTextField(
                          text: 'E-mail', controller: emailController),

                      GlobalVariables.spaceMedium(context),

                      CustomTextField(
                          obscureText: true,
                          text: 'Password',
                          controller: passwordController),

                      GlobalVariables.spaceMedium(context),

                      CustomTextField(
                          obscureText: true,
                          text: 'Confirm Password',
                          controller: confirmPasswordController),

                      GlobalVariables.spaceSmall(context),

                      // SIGN IN BUTTON
                      AuthButton(text: 'Sign up', onPressed: signUpLogic),
                      GlobalVariables.spaceMedium(context),

                      // 'OR SIGN IN USING'
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text('or sign in using',
                                textAlign: TextAlign.center,
                                style: FontStyles.bodyMedium),
                            const SizedBox(width: 5),
                            const SizedBox(
                              width: 100,
                              child: Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GlobalVariables.spaceSmall(context),
                      GlobalVariables.spaceSmall(context),

                      Center(
                          child: ImageButton(
                        image: GlobalVariables.googleLogo,
                        onTap: () {},
                      )),
                      GlobalVariables.spaceSmall(context),
                      GlobalVariables.spaceSmall(context),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Do you have an account? ',
                                    style: FontStyles.bodyMedium),
                                TextSpan(
                                    text: 'Sign in',
                                    style: FontStyles.bodyMedium.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.accent)),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
