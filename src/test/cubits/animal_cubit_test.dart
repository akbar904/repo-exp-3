
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:com.example.simple_animal_app/cubits/animal_cubit.dart';

// Mocking dependencies
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

		test('initial state is AnimalState(animal: "Cat", icon: Icons.pets)', () {
			expect(animalCubit.state, AnimalState(animal: 'Cat', icon: Icons.pets));
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(animal: "Dog", icon: Icons.person)] when toggleAnimal is called and initial state is Cat',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(animal: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(animal: "Cat", icon: Icons.pets)] when toggleAnimal is called and initial state is Dog',
			build: () {
				final cubit = AnimalCubit();
				cubit.emit(AnimalState(animal: 'Dog', icon: Icons.person));
				return cubit;
			},
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(animal: 'Cat', icon: Icons.pets)],
		);
	});
}
