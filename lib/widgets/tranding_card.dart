import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/constent.dart';
import 'package:netflix_clone/screens/detile_sreen.dart';

class TrendindCard extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const TrendindCard({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 20,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: .55,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetileScreen(movie: snapshot.data[index]),
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  '${Constent.imagePath}${snapshot.data[index].posterPath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
