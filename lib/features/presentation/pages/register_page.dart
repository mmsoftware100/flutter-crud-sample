import 'package:base/core/util/loading_dialog.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/components/text_link.dart';
import 'package:base/features/presentation/pages/dreamcatcher/dreamcatcher_home_page.dart';
import 'package:base/features/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/messenger.dart';
import '../providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = "/RegisterPage";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BuildContext? buildContext;
  TextEditingController phoneTec = TextEditingController();
  TextEditingController nameTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context){
            buildContext = context;
            return Column(
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
                    textEditingController: phoneTec,
                    callback: (String? str){}
                ),
                //Text("Login"),
                OurTextInput(
                    textInputType: TextInputType.text,
                    label: "အမည်",
                    placeHolder: "Mg Mg",
                    textEditingController: nameTec,
                    callback: (String? str){}
                ),
                SubmitButton(callback: _submit, text: "Register"),
                SizedBox(height: 24,),
                TextLink(description: "Already registered? ", linkName: "Login Here", routeName: LoginPage.routeName, replace: true,)
              ],
            );
          },
        ),
      ),
    );
  }

  void _submit()async{
    String name = nameTec.text;
    String phoneNo = phoneTec.text;
    String password = phoneNo;

    LoadingDialog.show(context);
    bool status = await Provider.of<UserProvider>(context, listen:false).userRegisterPlz(
        name: name,
        email: "$phoneNo@email.com",
        phoneNo: phoneNo,
        password: password
    );
    Future.delayed(Duration(seconds: 3),(){
      LoadingDialog.hide(context);
      if(status){
        // go to home page
        Navigator.pushNamedAndRemoveUntil(context, DreamCatcherHomePage.routeName, (route) => false);
      }
      else{
        if(buildContext != null){
          OurMessenger.showUp(buildContext ?? context, "Register Fail, Try Again");
        }
        // OurMessenger.showUp(context, "Login Fail, Try Again");
      }
    });
  }
}
