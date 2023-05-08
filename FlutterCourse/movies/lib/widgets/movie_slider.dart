import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../models/movie.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider(
      {super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    double? maxScrollTemp;
    scrollController.addListener(() {
      double positionScroll = scrollController.position.pixels;
      double maxScroll = scrollController.position.maxScrollExtent;
      if (positionScroll >= maxScroll - 600) {
        if (maxScrollTemp == maxScroll) {
          return;
        } else {
          widget.onNextPage();
          maxScrollTemp = maxScroll;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) {
                final movie = widget.movies[index];
                return _MoviePoster(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'slider-${movie.id}';

    return Container(
      width: 130,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, 'details', arguments: movie),
          child: Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        RatingStars(
            value: movie.voteAverage,
            starBuilder: (index, color) => Icon(
                  Icons.star,
                  color: color,
                  size: 15,
                ),
            maxValue: 10,
            starCount: 5,
            starSize: 15,
            maxValueVisibility: false,
            valueLabelVisibility: true,
            starSpacing: 0,
            valueLabelPadding:
                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 4, top: 0)),
        const SizedBox(
          height: 5,
        ),
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(fontSize: 13),
        ),
      ]),
    );
  }
}
