import 'package:flutter/material.dart';
import 'package:flutter_full_modern_auth/constant/app_colors.dart';
import 'package:flutter_full_modern_auth/ui/auth/login_page.dart';
import 'package:flutter_full_modern_auth/ui/widget/button_widget.dart';
import 'package:flutter_full_modern_auth/ui/widget/social_logo_button.dart';
import 'package:flutter_full_modern_auth/ui/widget/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text Editing controllers
  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  String? errorMessage;

  // sign user in functon
  void signUserIn() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      setState(() {
        errorMessage = "Some fields are empty.";
      });
    } else {
      setState(() {
        errorMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: 450,
                    maxHeight: screenSize.height > 950
                        ? screenSize.height * 0.9
                        : 950),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.01,
                    ),
                    //? Logo
                    const Icon(
                      Icons.apple,
                      size: 80,
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    //? welcome message
                    Text(
                      "Sign up",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: AppColors.grey700),
                    ),
                    const SizedBox(height: 25),
                    //? Error Message
                    if (errorMessage != null)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          errorMessage!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: AppColors.white,
                              ),
                        ),
                      ),
                    //? firstname
                    TextFieldWidget(
                      controller: firstnameController,
                      hintText: "Firstname",
                      obscureText: false,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    //? Lastname
                    TextFieldWidget(
                      controller: lastnameController,
                      hintText: "Lastname",
                      obscureText: false,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    //? Email
                    TextFieldWidget(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    //? Phone
                    TextFieldWidget(
                      controller: phoneController,
                      hintText: "Phone",
                      obscureText: false,
                      action: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    //? password
                    TextFieldWidget(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                      action: TextInputAction.done,
                    ),

                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    //? login button
                    ButtonWidget(
                      text: "Sign Up",
                      bgColor: AppColors.black,
                      textColor: AppColors.white,
                      padding: 18.0,
                      horizontalMargin: 25,
                      onTap: signUserIn,
                    ),

                    SizedBox(height: screenSize.height * 0.03),
                    //? message for continue with others
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: AppColors.grey.shade400,
                          )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "or by using",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.grey700),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 0.5,
                            color: AppColors.grey[400],
                          )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //? Google button
                        const SocialLogoButon(
                          url: 'assets/img/pictures/google-logo.png',
                          height: 30.0,
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        //? Apple Button
                        const SocialLogoButon(
                          url: 'assets/img/pictures/apple-logo.png',
                          height: 30.0,
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        //? Wechat Button
                        const SocialLogoButon(
                          url: 'assets/img/pictures/wechat-logo.png',
                          height: 30.0,
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    //? not accound ? sign in link
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushAndRemoveUntil<void>(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LoginPage()),
                        ModalRoute.withName('/signin'),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already a member ? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: AppColors.grey700),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
