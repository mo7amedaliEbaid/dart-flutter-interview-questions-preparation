main() {
  print(sortArray([5, 2, 7, 9, 2, 8, 9, 6, 5, 55, 7, 8]));
}

List<int> sortArray(List<int> nums) {
  // Sort the array in ascending order by calling the desired sorting function
  return selectionSort(nums);
}

// 1. Insertion Sort
List<int> insertionSort(List<int> nums) {
  for (var i = 1; i < nums.length; i++) {
    int curr = nums[i];
    int j = i - 1;
    while (j >= 0 && curr < nums[j]) {
      nums[j + 1] = nums[j];
      j--;
    }
    nums[j + 1] = curr;
  }
  return nums;
}
// [5,7,8,1,3]
//  j i
// curr= 7
// j=0
// while j>=0 and curr <nums[j]
// j=0 and 7 , nums[j]=5 , 7<5 = false
//nums[0+1]=nums[1]=7
// 5,7,8,1,3
// curr =nums[2]=8, j=2-1=1
// j=1>0 and nums[j]=nums[1]=7, 8<7=false
// nums[2]=8
// 5,7,8,1,3
// i=3, curr=nums[3]=1, j=3-1=2
// j=2>0, 1<nums[j]=>8
//nums[2+1]=nums[3]=nums[2]
// 5,7,8,8,3
// j=1
// nums[2]=nums[1]=7
// 5,7,7,8,3
// 5,5,7,8,3
// 1,5,7,8,3

// 2. Merge Sort
List<int> mergeSort(List<int> nums) {
  if (nums.length <= 1) {
    return nums;
  }
  int mid = nums.length ~/ 2;
  List<int> left = mergeSort(nums.sublist(0, mid));
  List<int> right = mergeSort(nums.sublist(mid));
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}

// 3. Selection Sort
selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    // Swap arr[i] and arr[minIndex]
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
  return arr;
}
