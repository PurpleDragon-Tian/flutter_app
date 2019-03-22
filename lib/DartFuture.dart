/**
 * Future代表了异步执行的结果对象，该对象是Future<T>类型的。
 * async和await使得dart里的异步执行看起来像是同步执行操作.
 * 记住要返回异步操作的结果，否则await不生效
 *
 */
main() {
//  handleFileIo();
//  print('进行和文件读写无关的操作');
  print('用户开始登录');
  login();
  print('等待登录结果');
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
