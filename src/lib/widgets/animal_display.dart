
import 'package:flutter/material.dart';

class AnimalDisplay extends StatelessWidget {
	final String animal;
	final IconData icon;

	const AnimalDisplay({required this.animal, required this.icon, Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text(animal, style: TextStyle(fontSize: 24)),
				SizedBox(width: 10),
				Icon(icon, size: 24),
			],
		);
	}
}
