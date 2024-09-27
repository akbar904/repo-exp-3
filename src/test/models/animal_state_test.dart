
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_animal_app/models/animal_state.dart';

void main() {
	group('AnimalState Model Tests', () {
		test('AnimalState should have correct initial values for Cat', () {
			const animal = 'Cat';
			const icon = Icons.pets;

			final animalState = AnimalState(animal, icon);

			expect(animalState.animal, animal);
			expect(animalState.icon, icon);
		});

		test('AnimalState should have correct initial values for Dog', () {
			const animal = 'Dog';
			const icon = Icons.person;

			final animalState = AnimalState(animal, icon);

			expect(animalState.animal, animal);
			expect(animalState.icon, icon);
		});

		test('AnimalState should serialize to JSON', () {
			const animal = 'Cat';
			const icon = Icons.pets;

			final animalState = AnimalState(animal, icon);
			final json = animalState.toJson();

			expect(json['animal'], animal);
			expect(json['icon'], icon.codePoint);
		});

		test('AnimalState should deserialize from JSON', () {
			const animal = 'Dog';
			const icon = Icons.person;

			final json = {'animal': animal, 'icon': icon.codePoint};
			final animalState = AnimalState.fromJson(json);

			expect(animalState.animal, animal);
			expect(animalState.icon, icon);
		});
	});
}

class AnimalState {
	final String animal;
	final IconData icon;

	AnimalState(this.animal, this.icon);

	Map<String, dynamic> toJson() {
		return {
			'animal': animal,
			'icon': icon.codePoint,
		};
	}

	factory AnimalState.fromJson(Map<String, dynamic> json) {
		return AnimalState(
			json['animal'],
			IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
