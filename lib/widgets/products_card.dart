// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharcterCard extends StatelessWidget {
  String name;
  String image;
  String gender;
  String id;

  CharcterCard({
    super.key,
    required this.gender,
    required this.image,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CachedNetworkImage(imageUrl: image),
          ),
          Text(name),
          Text("Gender : $gender"),
        ],
      ),
    );
  }
}
