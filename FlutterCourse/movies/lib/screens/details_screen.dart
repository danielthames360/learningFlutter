import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:movies/widgets/widgets.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie: movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie: movie),
          _Overview(overview: movie.overview),
          CastingCards(
            movieId: movie.id,
          )
        ])),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
            width: double.infinity,
            color: Colors.black45,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            )),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({required this.movie});
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: movie.heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                movie.originalTitle,
                style: textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  RatingStars(
                      value: movie.voteAverage,
                      starBuilder: (index, color) => Icon(
                            Icons.star,
                            color: color,
                            size: 18,
                          ),
                      maxValue: 10,
                      starCount: 5,
                      starSize: 18,
                      maxValueVisibility: false,
                      valueLabelVisibility: true,
                      starSpacing: 0,
                      valueLabelPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      valueLabelMargin:
                          const EdgeInsets.only(right: 4, top: 3)),

                  // Text(
                  //   movie.voteAverage.toString(),
                  //   style: textTheme.bodySmall,
                  // )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;

  const _Overview({required this.overview});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Text(overview),
    );
  }
}
