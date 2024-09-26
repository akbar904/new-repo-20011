
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal_state.dart';
import 'package:animal_switcher/widgets/animal_display.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Switcher'),
			),
			body: BlocBuilder<AnimalCubit, AnimalState>(
				builder: (context, state) {
					return Center(
						child: GestureDetector(
							onTap: () => context.read<AnimalCubit>().toggleAnimal(),
							child: AnimalDisplay(animal: state.animal, icon: state.icon),
						),
					);
				},
			),
		);
	}
}
