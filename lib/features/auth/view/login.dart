import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tender_app_test/commons/round_btn.dart';
import 'package:tender_app_test/constants/const.dart';
import 'package:tender_app_test/features/auth/widgets/auth_field.dart';
import 'package:tender_app_test/routes.dart';
import 'package:tender_app_test/themes/theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Text(
                AppText.appTitle,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColorPallete.darkBlue,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Cairo"),
              ),
              const SizedBox(height: 40),
              AuthField(controller: emailController, hintText: "Enter Email.."),
              const SizedBox(height: 22),
              AuthField(
                  controller: passController, hintText: "Enter Password.."),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topRight,
                child: RoundedSmallBtn(
                  ontap: () {},
                  label: " دخول ",
                  textcolor: AppColorPallete.backgroundColor,
                  color: AppColorPallete.darkBlue,
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  text: " SignUP ",
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColorPallete.darkBlue,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cairo"),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // TODO navigate to signup
                      Navigator.pushNamed(context, RouteGenerator.signupView);
                    },
                  children: const [
                    TextSpan(
                        text: AppText.register,
                        style: TextStyle(
                            color: AppColorPallete.blackColor, fontSize: 16)),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
