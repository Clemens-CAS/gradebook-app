import 'package:flutter/material.dart';
import 'package:gradebook/ui/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter Counter:'),
              Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.update();
          },
          tooltip: 'Load',
          child: Icon(Icons.add),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
