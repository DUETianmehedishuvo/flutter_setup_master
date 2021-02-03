import 'package:flutter/material.dart';
import 'package:ecommerce_ael/data/model/body/login_model.dart';
import 'package:ecommerce_ael/localization/language_constrants.dart';
import 'package:ecommerce_ael/provider/auth_provider.dart';
import 'package:ecommerce_ael/utill/color_resources.dart';
import 'package:ecommerce_ael/utill/custom_themes.dart';
import 'package:ecommerce_ael/utill/dimensions.dart';
import 'package:ecommerce_ael/view/basewidget/button/custom_button.dart';
import 'package:ecommerce_ael/view/basewidget/show_custom_snakbar.dart';
import 'package:ecommerce_ael/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:ecommerce_ael/view/basewidget/textfield/custom_textfield.dart';
import 'package:ecommerce_ael/view/screen/auth/forget_password_screen.dart';
import 'package:provider/provider.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController _emailController;

  TextEditingController _passwordController;

  GlobalKey<FormState> _formKeyLogin;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.text = Provider.of<AuthProvider>(context, listen: false).getUserEmail() ?? null;
    _passwordController.text = Provider.of<AuthProvider>(context, listen: false).getUserPassword() ?? null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  FocusNode _emailNode = FocusNode();
  FocusNode _passNode = FocusNode();
  LoginModel loginBody = LoginModel();

  void loginUser() async {
    if (_formKeyLogin.currentState.validate()) {
      _formKeyLogin.currentState.save();

      if (_emailController.text.isEmpty) {
        showCustomSnackBar(getTranslated('EMAIL_MUST_BE_REQUIRED', context), context);
      } else if (_passwordController.text.isEmpty) {
        showCustomSnackBar(getTranslated('PASSWORD_MUST_BE_REQUIRED', context), context);
      } else {

        if (Provider.of<AuthProvider>(context, listen: false).isRemember) {
          Provider.of<AuthProvider>(context, listen: false).saveUserEmail(_emailController.text, _passwordController.text);
        } else {
          Provider.of<AuthProvider>(context, listen: false).clearUserEmailAndPassword();
        }

        loginBody.email = _emailController.text;
        loginBody.password = _passwordController.text;
        await Provider.of<AuthProvider>(context, listen: false).login(loginBody, route);
        //await Provider.of<ProfileProvider>(context, listen: false).getUserInfo();
      }
    }
  }

  route(bool isRoute, String errorMessage) {
    if (isRoute) {
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashBoardScreen()));
    } else {
      showCustomSnackBar(errorMessage, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).isRemember;

    return Form(
      key: _formKeyLogin,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
        children: [
          // for Email
          Container(
              margin:
                  EdgeInsets.only(left: Dimensions.MARGIN_SIZE_LARGE, right: Dimensions.MARGIN_SIZE_LARGE, bottom: Dimensions.MARGIN_SIZE_SMALL),
              child: CustomTextField(
                hintText: getTranslated('ENTER_YOUR_EMAIL', context),
                focusNode: _emailNode,
                nextNode: _passNode,
                textInputType: TextInputType.emailAddress,
                controller: _emailController,
              )),

          // for Password
          Container(
              margin:
                  EdgeInsets.only(left: Dimensions.MARGIN_SIZE_LARGE, right: Dimensions.MARGIN_SIZE_LARGE, bottom: Dimensions.MARGIN_SIZE_DEFAULT),
              child: CustomPasswordTextField(
                hintTxt: getTranslated('ENTER_YOUR_PASSWORD', context),
                textInputAction: TextInputAction.done,
                focusNode: _passNode,
                controller: _passwordController,
              )),

          // for remember and forgetpassword
          Container(
            margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_SMALL, right: Dimensions.MARGIN_SIZE_SMALL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) => Checkbox(
                        checkColor: ColorResources.WHITE,
                        activeColor: ColorResources.COLOR_PRIMARY,
                        value: authProvider.isRemember,
                        onChanged: authProvider.updateRemember,
                      ),
                    ),
                    //

                    Text(getTranslated('REMEMBER', context), style: titilliumRegular),
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordScreen())),
                  child: Text(getTranslated('FORGET_PASSWORD', context), style: titilliumRegular.copyWith(color: ColorResources.getLightSkyBlue(context))),
                ),
              ],
            ),
          ),

          // for signin button
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
            child: Provider.of<AuthProvider>(context).isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : CustomButton(onTap: loginUser, buttonText: getTranslated('SIGN_IN', context)),
          ),

          SizedBox(height: 20),
          Center(child: Text(getTranslated('OR', context), style: titilliumRegular.copyWith(fontSize: 12))),

          //for order as guest
          GestureDetector(
            onTap: () {
              if (!Provider.of<AuthProvider>(context, listen: false).isLoading) {
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DashBoardScreen()));
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 30),
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: ColorResources.getHint(context), width: 1.0),
              ),
              child: Text(getTranslated('CONTINUE_AS_GUEST', context), style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context))),
            ),
          ),
        ],
      ),
    );
  }
}
