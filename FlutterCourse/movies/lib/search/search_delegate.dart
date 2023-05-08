import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  Widget _emptyContainer() {
    return const Center(
        child: Icon(
      Icons.movie_creation_outlined,
      color: Colors.black38,
      size: 130,
    ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);

    return GestureDetector(
      onTapDown: (details) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: StreamBuilder(
        stream: moviesProvider.suggestionStream,
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) {
            return _emptyContainer();
          }
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, int index) => _MovieItem(movies[index]),
          );
        },
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem(this.movie);
  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      title: Text(movie.title),
      subtitle: Text(
        movie.overview,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: const TextStyle(fontSize: 11, height: 1),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}
