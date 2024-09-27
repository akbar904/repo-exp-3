
import 'package:flutter/material.dart';

class AnimalDisplay extends StatelessWidget {
	final String animal;
	final IconData icon;

	const AnimalDisplay({
		Key? key,
		required this.animal,
		required this.icon,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text(animal),
				const SizedBox(width: 8),
				Icon(icon),
			],
		);
	}
}
