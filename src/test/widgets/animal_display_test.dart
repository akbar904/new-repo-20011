
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/widgets/animal_display.dart';

void main() {
	group('AnimalDisplay Widget Tests', () {
		testWidgets('should display Cat text with a clock icon', (WidgetTester tester) async {
			// Arrange
			const animalText = 'Cat';
			const animalIcon = Icons.access_time; // clock icon

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalDisplay(animal: animalText, icon: animalIcon),
					),
				),
			);

			// Assert
			expect(find.text(animalText), findsOneWidget);
			expect(find.byIcon(animalIcon), findsOneWidget);
		});

		testWidgets('should display Dog text with a person icon', (WidgetTester tester) async {
			// Arrange
			const animalText = 'Dog';
			const animalIcon = Icons.person; // person icon

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalDisplay(animal: animalText, icon: animalIcon),
					),
				),
			);

			// Assert
			expect(find.text(animalText), findsOneWidget);
			expect(find.byIcon(animalIcon), findsOneWidget);
		});
	});
}
