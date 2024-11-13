void main(List<String> args) {
  print(lengthOfLongestSubstring('abcabcbb'));
}

int lengthOfLongestSubstring(String s) {
  String longestSubString = '';
  int leftIndex = -1, currentIndex = 0;
  for (int i = 0; i < s.length; i++) {
    currentIndex += 1;
    for (int j = 0; j < longestSubString.length; j++) {}
  }
  return longestSubString.length;
}
