
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_animal_app/cubits/animal_cubit.dart';
import 'package:com.example.simple_animal_app/widgets/animal_display.dart';

class HomeScreen extends StatelessWidget {
	const HomeScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Animal App'),
			),
			body: BlocBuilder<AnimalCubit, AnimalState>(
				builder: (context, state) {
					return GestureDetector(
						onTap: () {
							context.read<AnimalCubit>().toggleAnimal();
						},
						child: Center(
							child: AnimalDisplay(
								animal: state.animal,
								icon: state.icon,
							),
						),
					);
				},
			),
		);
	}
}
