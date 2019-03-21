/**
 * Dart语言也支持异步操作
 * 在Dart的sdk中有很多函数返回的是Future和Stream,就是异步函数。
 * 通过async 关键字跟在方法名后面来声明异步函数
 * 通过await关键字来阻塞等待执行。
 */

main(List<String> args) {
  asyncMethod();
}

void asyncMethod() async {
  await emulateNetwork();
  print('异步操作的下一步');
}

void emulateNetwork() {
  for (var i = 0; i < 100; i++) {
    print(i);
  }
}
