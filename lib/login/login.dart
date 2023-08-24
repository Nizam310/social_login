import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:social_login/login/login_controller.dart';

import '../common_widget/button.dart';
import '../common_widget/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(

            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width/4),
        
          children: [
            Lottie.asset('assets/animations/login.json', height: 200)
                .paddingSymmetric(vertical: 20),
            CusTextField(
              hint: 'UserName',
              controller: loginController.nameController,
              color: Colors.white,
              textColor: Colors.white,
            ).paddingSymmetric(vertical: 10, horizontal: 30),
            CusTextField(
                    textColor: Colors.white,
                    hint: 'Password',
                    controller: loginController.passwordController,
                    color: Colors.white)
                .paddingSymmetric(vertical: 10, horizontal: 30),
            Row(
              children: [
                Expanded(
                    child: CusButton(
                  onTap: () {
                    loginController.login();
                  },
                  text: 'Login',
                ).paddingSymmetric(vertical: 10, horizontal: 30)),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.white,
                      thickness: 0.3,
                )),
                Text(
                  'Or',
                  style:
                      context.textTheme.bodyMedium?.copyWith(color: Colors.white),
                ).paddingSymmetric(horizontal: 5),
                Expanded(
                    child: Divider(
                  color: Colors.white,
                      thickness: 0.3,

                )),
              ],
            ).paddingSymmetric(vertical: 30,horizontal: 30),
            Row(
              children: [
                Expanded(
                  child: SignInButton(
                    padding: const EdgeInsets.all(10),
                    elevation: 0,
                    Buttons.Google,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    onPressed: () async {
                      await loginController.handleGoogleSignIn();
                    },
                  ).paddingSymmetric(horizontal: 32),
                ),
              ],
            ).paddingSymmetric(vertical: 5)
          ],
        ).paddingAll(10),
      ),
    );
  }
}
