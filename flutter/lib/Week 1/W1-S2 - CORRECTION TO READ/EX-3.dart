void main() {
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];
  var pass = scores.where((X) => X >= 50);
  print("Input \n$scores\n");
  print("Output \n$pass");
  print("${pass.length} students passed");
}
