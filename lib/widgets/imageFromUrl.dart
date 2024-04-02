import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// Функция для преобразования ссылки в фото с использованием пакета flutter_cached_network_image
Widget imageFromUrl(String imageUrl) {
  return Container(
    color: Colors.white,
    width: 130,
    height: 130,
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fit: BoxFit.cover, // Заполняем контейнер картинкой
    ),
  );
}
