import 'package:flutter/cupertino.dart';

import '../../../common/api.dart';
import '../../../model/movie.dart';

class PopularItem extends StatelessWidget {
  final MoviesModel movies;
  const PopularItem({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.bottomLeft, children: [
         _moviePoster(height, width),
          _movieDetail(width, height),
        ]),
        SizedBox(height: 20,)
      ],
    );
  }

  Padding _movieDetail(double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        width: width * .7,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              movies.title == null ? const Text("N/A") : _movieTitle(),
              SizedBox(
                height: height * .02,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //RedButton(width: width, height: height),
                    SizedBox(
                      width: width * .05,
                    ),
                    //WhiteBorderButton(width: width, height: height),
                  ])
            ]),
      ),
    );
  }

  Text _movieTitle() {
    return Text(movies.title ?? "");
  }

  Container _moviePoster(double height, double width) {
    return movies.poster == null ? Container() : Container(
      height: height * .45,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              image: NetworkImage("${movies.poster ?? ""}"))),
    );
  }
}
