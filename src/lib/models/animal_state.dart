
import 'package:flutter/material.dart';

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
