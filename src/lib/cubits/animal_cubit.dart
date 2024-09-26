
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:your_package_name/models/animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState(animal: 'Cat', icon: Icons.access_time));

	void toggleAnimal() {
		if (state.animal == 'Cat') {
			emit(AnimalState(animal: 'Dog', icon: Icons.person));
		} else {
			emit(AnimalState(animal: 'Cat', icon: Icons.access_time));
		}
	}
}
