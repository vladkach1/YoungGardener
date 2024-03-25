import 'package:flutter/material.dart';

class PlantDescription extends StatelessWidget {
  const PlantDescription({
    Key? key,
    required this.textDescriptionStyle,
  }) : super(key: key);

  final TextStyle textDescriptionStyle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        'Петру́шка кудря́вая, или Петрушка курчавая, (лат. Petroselinum crispum), — одно-двухлетнее растение из семейства зонтичных (Umbelliferae). Корень  стержневой, цилиндрический. Листья темно-зеленые, сверху блестящие. Лист петрушки, в сушёном и свежем виде, — популярная кулинарная приправа.',
        style: textDescriptionStyle,
      ),
    );
  }
}
