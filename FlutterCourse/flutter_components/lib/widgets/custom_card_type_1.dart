import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(
            Icons.photo_album_outlined,
            color: AppTheme.primary,
          ),
          title: Text("I'm a title"),
          subtitle: Text(
              'Consequat pariatur irure enim dolor proident quis officia cillum reprehenderit cillum laborum velit laborum. '),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
              TextButton(onPressed: () {}, child: const Text('Ok'))
            ],
          ),
        )
      ]),
    );
  }
}
