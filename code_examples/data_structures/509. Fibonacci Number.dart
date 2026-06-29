int fibRecursive(int n) {
  if (n <= 1) {
    return n;
  }
  return fibRecursive(n - 1) + fibRecursive(n - 2);
}

/*
int fibIterative(int n) {
  if (n <= 1) {
    return n;
  }
  int prev1 = 0;
  int prev2 = 1;
  int current = 0;

  for (int i = 2; i <= n; i++) {
    current = prev1 + prev2;
    prev1 = prev2;
    prev2 = current;
  }

  return current;
}
*/

void main() {
  int n = 18;
  print(fibIterative(n)); // Output: 1
  print(fibRecursive(n));
  print(fibRecursive1(n));
}

int fibIterative(int n) {
  if (n <= 1) {
    return n;
  }

  int prev = 0;
  int prev1 = 1;
  int current = 0;
  for (var i = 2; i <= n; i++) {
    current = prev + prev1;
    prev = prev1;
    prev1 = current;
  }
  return current;
}

int fibRecursive1(int n) {
  if (n <= 1) {
    return n;
  }
  return fibRecursive1(n - 1) + fibRecursive1(n - 2);
}
