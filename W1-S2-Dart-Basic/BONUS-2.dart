void main() {
  String text = "[{(text)}]";
  matchBracket(text);
}

void matchBracket(String text) {
  List<String> openBracket = ['[', '{', '('];
  List<String> closeBracket = [']', '}', ')'];
  Map<String, String> bracket = {'[': ']', '{': '}', '(': ')'};

  List<String> stack = [];

  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (openBracket.contains(char)) {
      stack.add(char);
    } else if (closeBracket.contains(char)) {
      if (stack.isEmpty || bracket[stack.removeLast()] != char) {
        print("Brackets are not balanced.");
        return;
      }
    }
  }
  if (stack.isEmpty) {
    print("Brackets are balanced.");
  } else {
    print("Brackets are not balanced.");
  }
}
