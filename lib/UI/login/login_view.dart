import 'package:adarsh/app/util.dart';
import 'package:adarsh/constants/app_colors.dart';
import 'package:adarsh/widgets/tools/screen_size.dart';
import 'package:adarsh/widgets/tools/shared.dart';
import 'package:adarsh/widgets/tools/view_model_builder.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: backButton(),
              pinned: true,
              backgroundColor: Palette.white,
              expandedHeight: 320,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(top: kToolbarHeight),
                    child: Image.asset(
                      'assets/images/login.png',
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () => dismissKeyboard(context),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50.h),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: Text(
                          'We will send you confirmation code',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      textFieldWidget(model),
                      //  textFieldWidget(model),
                      buttonWidget(model),
                      footerText(),
                      SizedBox(height: 81.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => LoginViewModel(
          apiService: Provider.of(context),
          notificationService: Provider.of(context)),
    );
  }

  Widget footerText() {
    return Container(
      margin: EdgeInsets.only(top: 35.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By login to callbro, you agree with our\n',
            ),
            TextSpan(
              text: 'Terms of Services',
              style: TextStyle(
                color: Palette.orange,
              ),
            ),
            TextSpan(
              text: ' and ',
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: Palette.orange,
              ),
            ),
          ],
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.black,
            height: 1.5,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget textFieldWidget(LoginViewModel model) {
    return Form(
      key: model.formKey,
      autovalidateMode: model.autovalidateMode,
      child: Column(
        children: [
          Container(
            height: 46,
            width: ScreenSize.width,
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(top: 30.h),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    //maxLength: 10,
                    //maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    buildCounter: (
                      context, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) {
                      return const SizedBox();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'User Name',
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Palette.hint,
                      ),
                      contentPadding: EdgeInsets.only(bottom: 10.h),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Username is required';
                      }
                      // if (value?.length != 10) {
                      //   return 'Invalid phone number';
                      // }
                      return null;
                    },
                    onSaved: (newValue) => model.mobile = newValue,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 46,
            width: ScreenSize.width,
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(top: 30.h),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    //maxLength: 10,
                    //maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    buildCounter: (
                      context, {
                      required currentLength,
                      required isFocused,
                      maxLength,
                    }) {
                      return const SizedBox();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Palette.hint,
                      ),
                      contentPadding: EdgeInsets.only(bottom: 10.h),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Username is required';
                      }
                      // if (value?.length != 10) {
                      //   return 'Invalid phone number';
                      // }
                      return null;
                    },
                    onSaved: (newValue) => model.mobile = newValue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget(LoginViewModel model) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 46,
      width: ScreenSize.width,
      child: ElevatedButton(
        onPressed: () {
          model.login();
        },
        style: ElevatedButton.styleFrom(
          primary: Palette.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
