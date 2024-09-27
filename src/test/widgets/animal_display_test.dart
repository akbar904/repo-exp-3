
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animal_app/widgets/animal_display.dart';

void main() {
	group('AnimalDisplay Widget', () {
		testWidgets('displays given animal text and icon', (WidgetTester tester) async {
			// Arrange
			const animalText = 'Cat';
			const animalIcon = Icons.pets;

			// Act
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: AnimalDisplay(
							animal: animalText,
							icon: animalIcon,
						),
					),
				),
			);

			// Assert
			expect(find.text(animalText), findsOneWidget);
			expect(find.byIcon(animalIcon), findsOneWidget);
		});

		testWidgets('responds to tap and toggles animal', (WidgetTester tester) async {
			// Arrange
			const initialAnimalText = 'Cat';
			const initialAnimalIcon = Icons.pets;
			const toggledAnimalText = 'Dog';
			const toggledAnimalIcon = Icons.person;

			var currentAnimalText = initialAnimalText;
			var currentAnimalIcon = initialAnimalIcon;

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: StatefulBuilder(
							builder: (BuildContext context, StateSetter setState) {
								return GestureDetector(
									onTap: () {
										setState(() {
											if (currentAnimalText == initialAnimalText) {
												currentAnimalText = toggledAnimalText;
												currentAnimalIcon = toggledAnimalIcon;
											} else {
												currentAnimalText = initialAnimalText;
												currentAnimalIcon = initialAnimalIcon;
											}
										});
									},
									child: AnimalDisplay(
										animal: currentAnimalText,
										icon: currentAnimalIcon,
									),
								);
							},
						),
					),
				),
			);

			// Initial state
			expect(find.text(initialAnimalText), findsOneWidget);
			expect(find.byIcon(initialAnimalIcon), findsOneWidget);

			// Act
			await tester.tap(find.byType(AnimalDisplay));
			await tester.pump();

			// Toggled state
			expect(find.text(toggledAnimalText), findsOneWidget);
			expect(find.byIcon(toggledAnimalIcon), findsOneWidget);

			// Act
			await tester.tap(find.byType(AnimalDisplay));
			await tester.pump();

			// Back to initial state
			expect(find.text(initialAnimalText), findsOneWidget);
			expect(find.byIcon(initialAnimalIcon), findsOneWidget);
		});
	});
}
