

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluuter_template/model/movie.dart';
import 'package:intl/intl.dart';

import '../../widget/error_widget.dart';
import 'home_view_model.dart';
import 'item_view/popular_item.dart';

final homeViewFutureProvider = FutureProvider.family(
        (ref, WidgetRef _ref) async =>
        ref.watch(homeViewModelProvider).fetchMoviesListApi(_ref));

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final weather = ref.watch(homeViewFutureProvider(ref));
      return Scaffold(
          body: weather.when(
              data: (data) => SafeArea(
                child: Container(
                 child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return PopularItem(movies: data[index]);
                          })

                ),
              ),
              error: (error, trace) => ApiErrorWidget(
                  onTap: () => ref.refresh(homeViewFutureProvider(ref))),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              )));
    });
  }
}