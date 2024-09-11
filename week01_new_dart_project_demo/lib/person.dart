class Person {
  //think about what the class should represent
  // we can declare variables, but we cannot initialize them
  //to still initialize them we use a 'late' key word for our variable
  late String _name;
  //what late does is it tells the system that this variable can be initialized later and does not have to be intialized later
  //the underscore declares it as private and shall not be used by other classes/code outside of this one
  late int _age;

  //for the constructor, create a person that uses the above variables and initializes them here
  Person(String name, int age) {
    _name =
        name; //you can also use this._name to ensure it is referring to the above private variables, but in this scenario it is not necessary
    _age = age;
  }

//GETTER
  String get name {
    return _name;
  }

//SETTER
set name(String value) {
    if (value.trim().isEmpty) {
      throw Exception('name cannot be empty');
    }
    _name = value;
  }


  int get age {
    return _age;
  }
  set age(int value){
    if(value <0){
      throw Exception('Age must be positive');
    }
    _age = value;
  }
}
