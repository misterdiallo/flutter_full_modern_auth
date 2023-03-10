import 'package:flutter/material.dart';
import 'package:flutter_full_modern_auth/constant/app_colors.dart';
import 'package:flutter_full_modern_auth/ui/auth/register_page.dart';
import 'package:flutter_full_modern_auth/ui/widget/button_widget.dart';
import 'package:flutter_full_modern_auth/ui/widget/social_logo_button.dart';
import 'package:flutter_full_modern_auth/ui/widget/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Editing controllers
  final usernameController = TextEditingController();
  String? errorMessage;
  final passwordController = TextEditingController();

  bool clicked = false;

  // sign user in functon
  void signUserIn() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
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
                    maxHeight: screenSize.height > 700
                        ? screenSize.height * 0.9
                        : 700),
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
                      "Welcome to the awersome full flutter Authentication App",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
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
                    //? username
                    TextFieldWidget(
                      controller: usernameController,
                      hintText: "Username",
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    //? password
                    TextFieldWidget(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                      action: TextInputAction.done,
                    ),
                    const SizedBox(height: 10),
                    //? Forgot password ?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot password ?",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.grey700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    //? login button
                    ButtonWidget(
                      text: "Sign In",
                      bgColor: clicked ? AppColors.grey700 : AppColors.black,
                      textColor: AppColors.white,
                      padding: 18.0,
                      horizontalMargin: 25,
                      onTap: signUserIn,
                      clicked: clicked,
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
                              "Or sign in with",
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
                    //? social app logo button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //? Google button
                        const SocialLogoButon(
                          url: 'assets/img/pictures/google-logo.png',
                          height: 40.0,
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        //? Apple Button
                        const SocialLogoButon(
                          url: 'assets/img/pictures/apple-logo.png',
                          height: 40.0,
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        //? Wechat Button
                        const SocialLogoButon(
                          url: 'assets/img/pictures/wechat-logo.png',
                          height: 40.0,
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    //? not accound ? sign in link
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushAndRemoveUntil<void>(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => RegisterPage()),
                        ModalRoute.withName('/signup'),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a member ? ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: AppColors.grey700),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Sign Up",
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
