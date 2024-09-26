
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/main.dart';

void main() {
	group('AnimalCubit', () {
		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(animal: "Dog", icon: Icons.person)] when toggleAnimal is called and initial state is Cat',
			build: () => AnimalCubit(),
			seed: () => AnimalState(animal: 'Cat', icon: Icons.access_time),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				AnimalState(animal: 'Dog', icon: Icons.person),
			],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(animal: "Cat", icon: Icons.access_time)] when toggleAnimal is called and initial state is Dog',
			build: () => AnimalCubit(),
			seed: () => AnimalState(animal: 'Dog', icon: Icons.person),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				AnimalState(animal: 'Cat', icon: Icons.access_time),
			],
		);
	});

	group('HomeScreen', () {
		testWidgets('displays Cat with clock icon initially', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog with person icon after tapping', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
