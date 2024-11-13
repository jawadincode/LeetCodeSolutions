void main(List<String> args) {
  print(lengthOfLongestSubstring('asjdhbbxnnwj2bbx'));
}

int lengthOfLongestSubstring(String s) {
  var input = s;
  Set<String> subString = {};
  int maxLengthSubString = 0;
  for (var i = 0; i < input.length; i++) {
    while (subString.contains(input[i])) {
      subString.remove(subString.first);
    }
    subString.add(input[i]);
    if (subString.length > maxLengthSubString) {
      maxLengthSubString = subString.length;
    }
  }
  return maxLengthSubString;
}
