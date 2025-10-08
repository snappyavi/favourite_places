import 'package:flutter/material.dart';
import 'package:udemy_favourite_places/screen/map_screen.dart';
import 'package:udemy_favourite_places/screen/places_details.dart';

import '../models/place_model.dart';
import 'dart:io';

class PlacesList extends StatelessWidget {
  const PlacesList({required this.places, super.key});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlacesDetails(place: places[index]),
            ),
          );
        },
        leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(places[index].image),
          ),


        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        subtitle: Text(
          places[index].location.address,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
