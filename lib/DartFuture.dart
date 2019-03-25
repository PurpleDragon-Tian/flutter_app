/**
 * Future代表了异步执行的结果对象，该对象是Future<T>类型的。
 * async和await使得dart里的异步执行看起来像是同步执行操作.
 * 记住要返回异步操作的结果，否则await不生效
 *
 */
main() {
//  handleFileIo();
//  print('进行和文件读写无关的操作');
//  print('用户开始登录');
//  login();
//  print('等待登录结果');
  testAsync();
}

Future<void> handleFileIo() async {
  var result = await fileIo();
  print('文件读写完毕 ${result}');
}

Future<int> fileIo() {
  return Future.delayed(Duration(seconds: 3), () => 9);
}

void login() async {
  var resp = await httpReq();
  if (resp is Future<void>) {
    print('程序出错');

    return;
  }
  if (resp != null && resp.errCode == 200) {
    print('login success');
  } else {
    print('login failed');
  }
}

Future<Response> httpReq() {
  Future.delayed(Duration(seconds: 5), () => Response('success', 200))
      .then((resp) {
    if (resp != null && resp.errCode == 200) {
      print('login success');
    } else {
      print('login failed');
    }
  }).catchError((onError) {
    print(onError.toString());
  });
}

class Response {
  String errMsg;
  int errCode;

  Response(this.errMsg, this.errCode);
}

/**
 * Future作为异步操作的结果返回给用户，
 * 可以通过async和await配对的形式进行异步操作，
 * 程序运行到第一个await处是阻塞等待，在异步操作执行完毕之后返回结果。
 */
Future<void> testAsync() async {
  var result = await testFileIo();
  var result1 = await formatResult(result);
  print(result);
  print(result1);
}

Future<String> formatResult(int result) {
  return Future.delayed(Duration(seconds: 3), () => 'result = $result');
}

Future<int> testFileIo() {
  return Future.delayed(Duration(seconds: 3), () => 22);
}

/**
 * Dart1.9以前是通过Future api来实现异步操作的。
 * then方法相当于异步回调操作,catchError()用于处理异常,
 * "_"下划线符号表示用不到参数。
 */
void asyncMethod() {
  Future.delayed(Duration(seconds: 2), () => '')
      .then((_) => {
//    onValue.
          })
      .catchError((_) => {});
  Future.wait([])
      .then((List response) {})
      .catchError((Function onError, cp) {});
}

typedef Compp = bool Function();
Compp cp;

/**
 * Stream也是异步操作的一种，不过是用于操作异步事件流，类似于Iterator迭代器。
 * 还是能通过async和await配对的形式来实现异步操作，不过要在await后增加个for循环，
 */
Future<int> sumStream(Stream<int> streams) async {
  var sum = 0;
  await for (var value in streams) {
    sum += value;
  }
  return sum;
}

void testAsyncStream(int i) async* {
  for (int i; i < 3; i++) {
    yield i;
  }
}
