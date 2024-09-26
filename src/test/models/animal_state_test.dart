
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/models/animal_state.dart';

void main() {
	group('AnimalState', () {
		test('should create AnimalState with initial values', () {
			// Arrange & Act
			final animalState = AnimalState(animal: 'Cat', icon: Icons.access_time);

			// Assert
			expect(animalState.animal, 'Cat');
			expect(animalState.icon, Icons.access_time);
		});

		test('should update animal and icon correctly', () {
			// Arrange
			var animalState = AnimalState(animal: 'Cat', icon: Icons.access_time);

			// Act
			animalState = AnimalState(animal: 'Dog', icon: Icons.person);

			// Assert
			expect(animalState.animal, 'Dog');
			expect(animalState.icon, Icons.person);
		});
	});
}
