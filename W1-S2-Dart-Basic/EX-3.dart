void main() {
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];
  List<int> pass = [];
  for (var num in scores) {
    if (num >= 50) {
      pass.add(num);
    }
  }
  print("Input \n$scores\n");
  print("Output \n$pass");
  print("${pass.length} students passed");
}
