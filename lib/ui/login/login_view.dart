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
              Container(
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
              ),
              SizedBox(
                height: 25.h,
              ),
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
              SizedBox(
                height: 150.h,
              ),
              _textField(
                hint: 'username',
                obscure: false,
              ),
              SizedBox(
                height: 30.h,
              ),
              _textField(
                hint: 'password',
                obscure: true,
              ),
              SizedBox(
                height: 40.h,
              ),
              Column(
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
              ),
              SizedBox(
                height: 90.h,
              ),
              Center(
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
                  onTap: () => print('Log In'),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }

  Widget _textField({String hint, bool obscure}) {
    return TextField(
      obscureText: obscure,
      style: TextStyle(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.w300,
      ),
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
}

// Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 onSubmitted: (input) {
//                   print('username: $input');
//                   model.username(input);
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'username',
//                 ),
//               ),
//               TextField(
//                 onSubmitted: (input) {
//                   print('password: $input');
//                   model.password(input);
//                 },
//                 decoration: InputDecoration(
//                   hintText: 'password',
//                 ),
//               ),
//               RaisedButton(
//                 onPressed: () => model.login(),
//                 child: Text('Log In'),
//               ),
//               RaisedButton(
//                 onPressed: () => model.logout(),
//                 child: Text('Log out'),
//               ),
//             ],
//           ),
//         ),
