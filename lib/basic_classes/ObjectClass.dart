void main() {
  TestNoSuchMethod test = TestNoSuchMethod();
  TestNoSuchMethod test1 = TestNoSuchMethod();

  test.noSuchMethod(null);
  print("${test * test1}");
  print("${test == test1}");
  print("${test.toString()} ${test.hashCode}");
  print("testHashCode = ${test.hashCode} test1HashCode = ${test1.hashCode}");
}

class TestNoSuchMethod extends Object {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    print("没有这个方法");
  }

  @override
  bool operator ==(dynamic other) {
    return other.hsCode == this.hashCode;
  }

  int operator *(dynamic other) {
    return 3 + 3;
  }
}
