import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key, required this.imageUrl, this.name});

  final String imageUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 30,
      shadowColor: AppTheme.primary.withOpacity(0.7),
      child: Column(children: [
        FadeInImage(
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage('assets/jar-loading.gif'),
          width: double.infinity,
          height: 260,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 300),
        ),
        if (name != null)
          Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(name ?? 'No title'))
      ]),
    );
  }
}
