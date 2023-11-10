import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/color_palette.dart';
import '../../../constants/font_styles.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/widgets/main_scaffold.dart.dart';
import '../../../core/providers/serviceproviders.dart';
import '../widgets/auth_button.dart';
import '../widgets/customtextfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: false);

    TextEditingController emailController = TextEditingController();

    return MainScaffold(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.chevron_left_outlined,
                    color: AppColors.active,
                    size: 50,
                  ))
            ],
          ),
          Image.asset(GlobalVariables.logo),
          GlobalVariables.spaceLarge(context),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.35),
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            width: GlobalVariables.sizeWidth(context),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalVariables.spaceSmall(context),
                  GlobalVariables.spaceSmall(context),
                  GlobalVariables.spaceSmall(context),

                  Text('Forgot your password? No problem',
                      textAlign: TextAlign.center,
                      style: FontStyles.headerMedium),
                  GlobalVariables.spaceMedium(context),

                  CustomTextField(text: 'E-mail', controller: emailController),

                  GlobalVariables.spaceMedium(context),

                  GlobalVariables.spaceSmall(context),

                  // SIGN IN BUTTON
                  AuthButton(
                      text: 'Send email',
                      onPressed: () {
                        servicesProvider.resetPassword(
                            emailController.text, context);
                      }),
                  GlobalVariables.spaceLarge(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
