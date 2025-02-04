import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/storage.dart';
import 'home_view/home_view.dart';
import 'landing_view/landing_view.dart';

final viewStateFutureProvider =
FutureProvider((ref) async => ref.watch(storageProvider).getPageValue());

class ViewStateScreen extends ConsumerWidget {
  const ViewStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(viewStateFutureProvider).when(
          data: (data) => data ? const HomeView() : const LandingView(),
          error: (error, trace) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink()),
    );
  }
}