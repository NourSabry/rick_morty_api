import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/models/character_details.dart';

class DetailsCard extends StatelessWidget {
  final String image;
  final String name;
  final String gender;
  final String type;
  final String status;
  final String created;
  final String origin;
  final String location;

  const DetailsCard({
    super.key,
    required this.created,
    required this.gender,
    required this.image,
    required this.name,
    required this.status,
    required this.type,
    required this.location,
    required this.origin,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 2,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: image,
                ),
              ),
              ListTile(
                leading: const Text("Name"),
                trailing: Text(name),
              ),
              ListTile(
                leading: const Text("Gender"),
                trailing: Text(gender),
              ),
              ListTile(
                leading: const Text("Type"),
                trailing: Text(type),
              ),
              ListTile(
                leading: const Text("Status"),
                trailing: Text(status),
              ),
              ListTile(
                leading: const Text("Created"),
                trailing: Text(created),
              ),
              ListTile(
                leading: const Text("Origin"),
                trailing: Text(
                  origin,
                ),
              ),
              ListTile(
                leading: const Text("Location"),
                trailing: Text(
                  location,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
