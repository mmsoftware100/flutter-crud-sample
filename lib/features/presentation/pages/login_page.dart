import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/components/text_link.dart';
import 'package:base/features/presentation/pages/dreamcatcher/dreamcatcher_home_page.dart';
import 'package:base/features/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/messenger.dart';
import '../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext? buildContext;
  TextEditingController tec = TextEditingController();
  TextEditingController passwordTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          buildContext = context;
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(appName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                ),
                //Text("Login"),
                OurTextInput(
                    textInputType: TextInputType.number,
                    label: "ဖုန်းနံပါတ်",
                    placeHolder: "09 *** *** ***",
                    textEditingController: tec,
                    callback: (String? str){}
                ),
                OurTextInput(
                    textInputType: TextInputType.number,
                    label: "စကားဝှက်",
                    placeHolder: "*** *** ***",
                    textEditingController: passwordTec,
                    callback: (String? str){}
                ),
                SubmitButton(callback: _submit, text: "Login"),
                //SizedBox(height: 24,),
                //TextLink(description: "Don't have an account? ", linkName: "Register Here", routeName: RegisterPage.routeName, replace: true,)
              ],
            ),
          );
        } ,
      ),
    );
  }

  void _submit()async{
    String phoneNo = tec.text;
    String password = phoneNo;
    print("LoginPage->_submit");
    print(phoneNo);
    print(password);

    LoadingDialog.show(context);
    bool status = await Provider.of<UserProvider>(context, listen:false).userLoginPlz(phoneNo: phoneNo, password: password);
    Future.delayed(Duration(seconds: 3),(){
      LoadingDialog.hide(context);
      if(status){
        // clear route and
        // go to home page
        Navigator.pushNamedAndRemoveUntil(context, DreamCatcherHomePage.routeName, (route) => false);
        // Navigator.popAndPushNamed(context, DreamCatcherHomePage.routeName)
        // Navigator.pushReplacementNamed(context, DreamCatcherHomePage.routeName);
      }
      else{
        if(buildContext != null){
          OurMessenger.showUp(buildContext ?? context, "Login Fail, Try Again");
        }
      }
    });
  }
}
