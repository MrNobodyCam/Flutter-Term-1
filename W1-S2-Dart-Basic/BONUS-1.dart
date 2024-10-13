enum Direction { north, east, south, west }

class Robot {
  int x;
  int y;
  Direction direction;

  Robot({required this.x, required this.y, required this.direction});

  void turnRight() {
    direction = Direction.values[(direction.index + 1) % 4];
  }

  void turnLeft() {
    direction = Direction.values[(direction.index + 3) % 4];
  }

  void advance() {
    switch (direction) {
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  void processInstruction(String instruction) {
    switch (instruction) {
      case 'R':
        turnRight();
        break;
      case 'L':
        turnLeft();
        break;
      case 'A':
        advance();
        break;
    }
  }

  void executeInstructions(String instructions) {
    for (var instruction in instructions.split('')) {
      processInstruction(instruction);
    }
  }

  void report() {
    print("End Position = {$x, $y, '${direction.name.toUpperCase()}'}");
  }
}

void runRobot(int x, int y, String dir, String instructions) {
  Direction direction =
      Direction.values.firstWhere((d) => d.name == dir.toLowerCase());
  Robot robot = Robot(x: x, y: y, direction: direction);
  robot.executeInstructions(instructions);
  robot.report();
}

void main() {
  runRobot(7, 3, 'north', 'RAALAL');
}
