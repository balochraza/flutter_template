import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluuter_template/view/home_view/home_view.dart';
import 'package:fluuter_template/view/view_state_screen.dart';

import 'common/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigatorKey,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: const Color(0xff17181f)),
        home: const ViewStateScreen(),
      ),
    );
  }
}