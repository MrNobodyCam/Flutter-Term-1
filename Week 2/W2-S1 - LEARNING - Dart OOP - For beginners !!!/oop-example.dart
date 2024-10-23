enum Color { red, blue, green, yellow }

enum Type { Phteah_Pet, Phteah_Keung, Pteas_Khmer }

class Room {
  final int num;
  final String type;
  final int floor;
  const Room(this.num, this.type, this.floor);
}

class Window {
  final String type;
  final Color color;
  final int floor;
  const Window(this.type, this.color, this.floor);
}

class Tree {
  final String type;
  final int height;
  const Tree(this.type, this.height);
}

class Animal {
  final String name;
  final String type;
  const Animal(this.name, this.type);
}

class Roof {
  final Type type;
  const Roof(this.type);
}

class Door {
  final type;
  Door(this.type);
}

class House {
  List<Room> room = [];
  List<Window> window = [];
  Tree tree;
  Door door;
  List<Animal> animal = [];
  Roof roof;
  House(this.tree, this.roof, this.door);

  void addWindow(Window newWindow) {
    window.add(newWindow);
  }

  void addAnimal(Animal newAnimal) {
    animal.add(newAnimal);
  }

  void addRoom(Room newRoom) {
    room.add(newRoom);
  }

  void ShowDetail() {
    print("The tree type is ${tree.type} height is ${tree.height}");
    print("-----------------------------------------------");
    print("The Door is ${door.type}");
    print("-----------------------------------------------");
    for (var num in window) {
      print(
          "Window type is ${num.type} Color is ${num.color} floor is ${num.floor}");
    }
    print("-----------------------------------------------");
    for (var num in animal) {
      print("Animal name is ${num.name} type is ${num.type}");
    }
    print("-----------------------------------------------");
    for (var num in room) {
      print(
          "Room is in ${num.floor} floor and have ${num.num} room and type is ${num.type}");
    }
    print("-----------------------------------------------");
    print("Roof type is ${roof.type}");
  }
}

main() {
  Room room1 = Room(2, "bedroom", 2);
  Room room2 = Room(1, "bathroom", 1);
  Room room3 = Room(2, "bathroom", 2);

  Tree tree = Tree("ork", 180);

  Roof roof = Roof(Type.Phteah_Pet);

  Door door = Door("Classic");

  Window w1 = Window("Classic", Color.blue, 2);
  Window w2 = Window("Classic", Color.red, 1);

  Animal a1 = Animal("Coca", "Dog");
  Animal a2 = Animal("Peppi", "Cat");

  House house = House(tree, roof, door);
  house.addAnimal(a1);
  house.addAnimal(a2);
  house.addRoom(room1);
  house.addRoom(room2);
  house.addRoom(room3);
  house.addWindow(w1);
  house.addWindow(w2);

  house.ShowDetail();
}
