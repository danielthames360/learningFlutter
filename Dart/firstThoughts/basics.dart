main() {
  //   print('hello world');
  //   print('funca?');

  //* Variables & data types
  //   var -- dynamic
  // For each data type we can specify the null safety symbol in front of the type i.e. String? or int? something;

  // Numerics -> int, double
  // Strings -> String -> ''' use this to create multiline ''' -> the use of variables '$variable $variable2' is automatic in Dart
  // Booleans -> bool
  // Arrays or Lists -> List<type> -> List<String> something = ["hi","mom"] -> //? methods = add(), toSet()
  // Sets -> Set<type> -> Set<String> something = {"hi","mom"} -> //? methods = add,
  // Map -> Map with key and value -> Map<int,String> myMap = {1: 'Hi mon'} -> //! we could also use Map<int,dynamic> to use any type of value
  // To access to a value from map we should use myMap['value']
  // We can also initialize a map with new Map();

  //* var final and const
  // Final and cost never changes its values
  // We can modify a list with final but we cannot do that with const

  //   final personasFinal = ['Daniel', 'Cespedes'];
  //   const personasConst = ['Daniel', 'Cespedes'];

  //   personasFinal.add('Tames');
  //   personasConst.add('Tames');

  //   print(personasFinal);
  //   print(personasConst);

  //* late works to initialize a variable after being created with final i.e. late final double x; ->  x = 10;

  //* for avoid assignations of new values to some property we can grab the double ? symbol before the set i.e.
  //int b;  b??=20; then the result is 20 for b
  //int b= 1; b??=20; then the result is 1 because it was already assigned

  //* verify type of a variable if(variable is String) -> then the result
}
