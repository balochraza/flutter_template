import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/home_view/home_view.dart';
import 'constant.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void showDialogFlash({String title = '', String? content}) {

  showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) {
        return AlertDialog(
          title: Text(title, style: const TextStyle(fontSize: 16)),
          content:
          Text(content!, style: const TextStyle(fontSize: 14)),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                //controller.dismiss()
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () => {

              },
              child: Text('NO'),
            ),
          ],
        );
      });

}

void checkInternetConnectivity(WidgetRef ref) {
  final connectivity = Connectivity();
  connectivity.onConnectivityChanged.listen((event) {
    switch (event) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        ref.invalidate(homeViewFutureProvider);
        break;
      case ConnectivityResult.none:
        showDialogFlash(title: noConnection, content: noConnectionMessage);
        break;
      default:
        ConnectivityResult.mobile;
    }
  });
}

final internetNotifier = Provider((ref) => Connectivity());