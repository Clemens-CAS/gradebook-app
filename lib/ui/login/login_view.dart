import 'package:flutter/material.dart';
import 'package:gradebook/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (content, model, child) => Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
            left: 40.0.w,
            right: 40.0.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 110.h,
              ),
              _iconPlaceholder(),
              SizedBox(
                height: 25.h,
              ),
              _titleText(),
              SizedBox(
                height: 150.h,
              ),
              _loginField(model),
              SizedBox(
                height: 40.h,
              ),
              _helpSection(),
              SizedBox(
                height: 90.h,
              ),
              _loginButton(model),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }

  Widget _iconPlaceholder() {
    return Container(
      height: 50.0.w,
      width: 50.0.h,
      child: Center(
        child: Text(
          'GB',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 24.0.sp,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.success,
      ),
    );
  }

  Widget _titleText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gradebook',
          style: TextStyle(
            color: AppColors.success,
            fontSize: 36.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign in to continue',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 18.0.sp,
          ),
        ),
      ],
    );
  }

  Widget _loginField(model) {
    // TODO: Add Failed Login State
    return Column(
      children: [
        _textField(
          hint: 'username',
          obscure: false,
          controller: model.usernameController,
        ),
        SizedBox(
          height: 30.h,
        ),
        _textField(
          hint: 'password',
          obscure: true,
          controller: model.passwordController,
        ),
      ],
    );
  }

  Widget _textField(
      {String hint, bool obscure, TextEditingController controller}) {
    return TextField(
      obscureText: obscure,
      style: TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.w300,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 24.0.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.tertiary,
        ),
        fillColor: AppColors.tertiary,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiary),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.tertiary),
        ),
      ),
    );
  }

  Widget _helpSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.dark,
              ),
            ),
            InkWell(
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.success,
                ),
              ),
              onTap: () {
                print('Sign Up');
              },
            )
          ],
        ),
        SizedBox(
          height: 13.h,
        ),
        InkWell(
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.success,
            ),
          ),
          onTap: () {
            print('Forgot Password');
          },
        )
      ],
    );
  }

  Widget _loginButton(model) {
    return Center(
      child: InkWell(
        child: Container(
          width: 245.w,
          height: 55.h,
          child: Center(
            child: Text(
              'Log in',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white),
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.success,
            borderRadius: BorderRadius.circular(30.0.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.dark.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
        ),
        onTap: () => model.login(),
      ),
    );
  }
}
