import 'package:flutter/material.dart';
import 'package:netflix_clone/model/constent.dart';
import 'package:netflix_clone/screens/detile_sreen.dart';

class TopRatedMoviesCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const TopRatedMoviesCard({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DetileScreen(movie: snapshot.data[index]),
                  ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(
                      '${Constent.imagePath}${snapshot.data[index].posterPath}',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
