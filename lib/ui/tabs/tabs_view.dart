import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradebook/ui/grades/grades_view.dart';
import 'package:gradebook/ui/home/home_view.dart';
import 'package:gradebook/ui/settings/settings_view.dart';
import 'package:gradebook/utils/app_icons.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375.0,
      height: 812.0,
      allowFontScaling: true,
    );

    return Container(
      color: Colors.white,
      // child: SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              HomeView(),
              Container(
                color: Colors.green,
              ),
              GradesView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    AppIcons.home_outline,
                    size: 35.0,
                  ),
                ),
                Tab(
                  icon: Icon(
                    AppIcons.calendar_outline,
                    size: 35.0,
                  ),
                ),
                Tab(
                  icon: Icon(
                    AppIcons.clipboard_outline,
                    size: 35.0,
                  ),
                ),
                Tab(
                  icon: Icon(
                    AppIcons.settings_outline,
                    size: 35.0,
                  ),
                ),
              ],
              labelColor: Color(0xff39D8A9),
              unselectedLabelColor: Color(0xffB8B8B8),
              indicatorColor: Colors.transparent,
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
