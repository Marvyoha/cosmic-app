import 'package:flutter/material.dart';

import '../../../constants/color_palette.dart';
import '../../../constants/font_styles.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/widgets/image_button.dart';
import '../../../constants/widgets/main_scaffold.dart.dart';
import '../widgets/accent_button.dart';
import '../widgets/auth_button.dart';
import '../widgets/customtextfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return MainScaffold(
      child: Column(
        children: [
          GlobalVariables.spaceMedium(context),
          GlobalVariables.spaceMedium(context),
          Image.asset(GlobalVariables.logo),
          GlobalVariables.spaceLarge(context),
          Expanded(
            child: Container(
              decoration: GlobalVariables.darkTranslusent,
              width: GlobalVariables.sizeWidth(context),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalVariables.spaceMedium(context),
                    Text('Sign in',
                        textAlign: TextAlign.center,
                        style: FontStyles.headerLarge),
                    GlobalVariables.spaceMedium(context),

                    CustomTextField(
                        text: 'E-mail', controller: emailController),

                    GlobalVariables.spaceMedium(context),

                    CustomTextField(
                        obscureText: true,
                        text: 'Password',
                        controller: passwordController),

                    GlobalVariables.spaceSmall(context),

                    AccentButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'forgotPassword');
                        },
                        text: 'Forgot Password?'),

                    GlobalVariables.spaceSmall(context),

                    // SIGN IN BUTTON
                    AuthButton(
                      text: 'Sign in',
                      onPressed: () {},
                    ),
                    GlobalVariables.spaceSmall(context),
                    GlobalVariables.spaceSmall(context),

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
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: FontStyles.bodyMedium),
                              TextSpan(
                                  text: 'Sign Up',
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
          )
        ],
      ),
    );
  }
}
