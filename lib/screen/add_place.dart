import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:udemy_favourite_places/provider/user_places.dart';
import 'package:udemy_favourite_places/widgets/image_input.dart';
import 'dart:io';

import 'package:udemy_favourite_places/widgets/location_input.dart';

import '../models/place_model.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  void _savePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle == null ||
        enteredTitle.isEmpty ||
        _selectedImage == null || _selectedLocation==null) {
      return;
    }

    ref
        .read(UserPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!, _selectedLocation!);
    Navigator.pop(context);
  }

  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new place")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            SizedBox(height: 16),
            ImageInput(
              onPickImage: (File image) {
                _selectedImage = image;
              },
            ),
            SizedBox(height: 10),
            LocationInput(onSelectLocation: (location) {
              _selectedLocation=location;
            },),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
