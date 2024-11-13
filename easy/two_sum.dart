import 'dart:collection';

void main(List<String> args) {
  List<int> nums = [3, 2, 4];
  int target = 6;
  print(twoSumLoopSolution(nums, target));
  print(twoSumHashSolution(nums, target));
}

twoSumHashSolution(List<int> nums, int target) {
  Map<int, int> indexValueMap = HashMap();
  for (int i = 0; i < nums.length; i++) {
    int complement = target - nums[i];
    if (indexValueMap.containsKey(complement)) {
      return [indexValueMap[complement], i];
    }
    indexValueMap[nums[i]] = i;
  }
  return [];
}

twoSumLoopSolution(List<int> nums, int target) {
  int firstIndex = 0;
  int secondIndex = 0;
  for (int i = 0; i < nums.length; i++) {
    for (int j = 0; j < nums.length; j++) {
      if ((nums[i] + nums[j] == target) && (i != j)) {
        firstIndex = i;
        secondIndex = j;
        if (firstIndex > secondIndex) {
          int temp = secondIndex;
          secondIndex = firstIndex;
          firstIndex = temp;
        }
        return [firstIndex, secondIndex];
      }
    }
  }
  return [];
}
