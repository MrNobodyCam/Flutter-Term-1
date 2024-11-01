// class Tree {
//   String type;
//   double height;

//   Tree(this.type, this.height);
// }

// // Class House
// class House {
//   String address;
//   List<Tree> trees = []; // by default empty

//   House(this.address);

//   void addTree(Tree newTree) {
//     this.trees.add(newTree);
//   }
// }

class Window {
  String color;
  int stair;
  String position;

  Window(this.color, this.stair, this.position);
}

class Roof {
  String? type;
  Roof({this.type});
}

class Chimney {
  bool type;
  Chimney(this.type);
}

class Door {
  String position;
  Door(this.position);
}

class House {
  Roof roof;
  Chimney chimney;
  Door door;
  List<Window> windows = [];
  House(this.roof, this.door, this.chimney);
  void addWindow(Window window) {
    windows.add(window);
  }

  void ShowHouse() {
    print("Type Of Roof is : ${roof.type} ");
    if (chimney.type == true) {
      print("have Chimney in this house");
    } else {
      print("haven't Chimney in this house");
    }
    print("Door Position : ${door.position} ");
    print("There are : ${windows.length} window ");
    print("Window Detail : ");
    for (var window in windows) {
      print(
          "Window color: ${window.color}, Stair: ${window.stair}, Position: ${window.position}");
    }
  }
}

void main() {
  Roof gableRoof = Roof(type: "gable");
  Door centerDoor = Door("center");
  Chimney houseChimney = Chimney(true);
  Window firstStairLeft = Window("green", 1, "left");
  Window firstStairRight = Window("red", 1, "right");
  Window SecondStairLeft = Window("red", 2, "left");
  Window SecondStairRight = Window("blue", 2, "right");
  House house = House(gableRoof, centerDoor, houseChimney);
  house.addWindow(firstStairRight);
  house.addWindow(firstStairLeft);
  house.addWindow(SecondStairRight);
  house.addWindow(SecondStairLeft);
  house.ShowHouse();
}
