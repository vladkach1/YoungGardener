import 'package:flutter/material.dart';

class PlantDescription2 extends StatelessWidget {
  const PlantDescription2({
    Key? key,
    required this.textDescriptionStyle,
  }) : super(key: key);

  final TextStyle textDescriptionStyle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(

        'Монстера Деликатесная или Привлекательная (Monstera deliciosa) – это самый популярный вид растения. Представляет собой быстрорастущую лиану с темно-зелеными перисто-рассеченными листьями в форме вытянутого сердечка.  Листья кожистые, тоже внушительных размеров – до полуметра в ширину.',
        style: textDescriptionStyle,
      ),
    );
  }
}
