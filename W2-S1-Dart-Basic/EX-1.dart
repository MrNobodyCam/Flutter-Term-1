enum Skill { FLUTTER, DART, JAVA, HTML, CSS, OTHER }

class Address {
  String _street;
  String _city;
  double _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  double get zipCode => _zipCode;
}

class Employee {
  final String _name;
  static const double baseSalary = 40000;
  final int _yearsOfExperience;
  final List<Skill> _skills;
  final Address _address;

  Employee(this._name, this._skills, this._yearsOfExperience, this._address);

  Employee.mobileDeveloper(String name, Address address)
      : _name = name,
        _yearsOfExperience = 0,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address;

  String get name => _name;
  int get yearsOfExperience => _yearsOfExperience;
  List<Skill> get skills => _skills;
  Address get address => _address;

  double computeSalary() {
    double salary = baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
        default:
          break;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Name: $name');
    print('Years of Experience: $yearsOfExperience');
    print('Skills: ${_skills.join(', ')}');
    print('Address: ${address.street}, ${address.city}, ${address.zipCode}');
    print('Computed Salary: \$${computeSalary()}');
  }
}

void main() {
  Address address1 = Address('123 Main St', 'New York', 10001);
  Employee emp1 = Employee('Sokea', [Skill.JAVA, Skill.FLUTTER], 10, address1);
  emp1.printDetails();
}
