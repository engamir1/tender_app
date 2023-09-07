import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tender_app_test/commons/round_btn.dart';
import 'package:tender_app_test/constants/const.dart';
import 'package:tender_app_test/features/auth/widgets/auth_field.dart';
import 'package:tender_app_test/routes.dart';
import 'package:tender_app_test/themes/theme.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                AppText.register,
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
                  label: "تسجيل",
                  textcolor: AppColorPallete.backgroundColor,
                  color: AppColorPallete.darkBlue,
                ),
              ),
              const SizedBox(height: 40),
              // RichText(
              //     text: TextSpan(
              //   text: TextString.newAccount,
              //   style:
              //       const TextStyle(color: ColorPallete.darkBlue, fontSize: 16),
              //   children: [
              //     TextSpan(
              //         text: " دخول",
              //         style: const TextStyle(
              //             color: ColorPallete.blackColor, fontSize: 16),
              //         recognizer: TapGestureRecognizer()
              //           ..onTap = () {
              //             // TODO navigate to signup
              //             Navigator.pushNamed(context, LoginView.id);
              //           }),
              //   ],
              // )),
              RichText(
                text: TextSpan(
                  text: AppText.newAccount,
                  style: const TextStyle(
                      color: AppColorPallete.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Cairo"),
                  children: [
                    TextSpan(
                      text: " دخول ",
                      style: const TextStyle(
                          color: AppColorPallete.darkBlue, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO navigate to signup
                          Navigator.pushNamed(
                              context, RouteGenerator.loginView);
                        },
                    ),
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
