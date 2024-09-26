
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_package_name/cubits/animal_cubit.dart';
import 'package:your_package_name/models/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalState with animal Cat and icon Icons.access_time', () {
			expect(animalCubit.state.animal, 'Cat');
			expect(animalCubit.state.icon, Icons.access_time);
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(animal: "Dog", icon: Icons.person)] when toggleAnimal is called from initial state',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				AnimalState(animal: 'Dog', icon: Icons.person),
			],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(animal: "Cat", icon: Icons.access_time)] when toggleAnimal is called from Dog state',
			build: () => animalCubit,
			seed: () => AnimalState(animal: 'Dog', icon: Icons.person),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				AnimalState(animal: 'Cat', icon: Icons.access_time),
			],
		);
	});
}
