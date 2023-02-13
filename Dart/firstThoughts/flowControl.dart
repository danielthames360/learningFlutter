import 'dart:io';

main() {
  // stdout.writeln("Please insert a value");

  // String? hola = stdin.readLineSync();

  // stdout.writeln("hola $hola");

  stdout.writeln("Please enter your age");

  int? age = int.tryParse(stdin.readLineSync().toString());

  while (age == null) {
    stdout.writeln("Please enter a valid number");
    age = int.tryParse(stdin.readLineSync().toString());
  }

  if (age > 21) {
    stdout.writeln("Citizen");
  } else if (age >= 18 && age <= 20) {
    stdout.writeln("Older than 18 years of age");
  } else {
    stdout.writeln("Younger than 18 years of age");
  }
}
