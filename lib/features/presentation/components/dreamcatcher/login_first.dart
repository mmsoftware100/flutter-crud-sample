import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginFirst extends StatelessWidget {
  const LoginFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("To see this page, you need to login first"),
        SubmitButton(callback: (){Navigator.pushNamed(context, LoginPage.routeName);}, text: "Login")
      ],
    );
  }
}
