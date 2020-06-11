import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (content, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('TxConnect Demo Login Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (input) {
                  print('username: $input');
                  model.username(input);
                },
                decoration: InputDecoration(
                  hintText: 'username',
                ),
              ),
              TextField(
                onSubmitted: (input) {
                  print('password: $input');
                  model.password(input);
                },
                decoration: InputDecoration(
                  hintText: 'password',
                ),
              ),
              RaisedButton(
                onPressed: () => model.login(),
                child: Text('Log In'),
              ),
              RaisedButton(
                onPressed: () => model.logout(),
                child: Text('Log out'),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
