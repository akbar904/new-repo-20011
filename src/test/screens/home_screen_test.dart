
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/screens/home_screen.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('Initial state shows Cat with clock icon', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: 'Cat', icon: Icons.access_time));
			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (context) => animalCubit,
					child: MaterialApp(home: HomeScreen()),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('Tapping text toggles to Dog with person icon', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: 'Cat', icon: Icons.access_time));
			whenListen(animalCubit, Stream.fromIterable([
				AnimalState(animal: 'Cat', icon: Icons.access_time),
				AnimalState(animal: 'Dog', icon: Icons.person),
			]));

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>(
					create: (context) => animalCubit,
					child: MaterialApp(home: HomeScreen()),
				),
			);

			await tester.pump();
			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
