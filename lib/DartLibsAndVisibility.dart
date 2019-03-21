/**
 * Dart中通过import和library来使代码模块化和可共享。
 * Library库不仅提供api调用，同时还是一个隐私单元，带下划线表示服的变量，函数等标识符只能在其所在库呢访问。
 * 每个Dart应用就是一个Library库，即便没有使用library指令标明
 * 通过嵌在dart sdk内部的pub包管理器来管理library库。
 * 
 */


//通过import来进行导包
import 'dart:math';//导入Math包,schema是dart:代表是内置库，即sdk中内置的
import 'package:async/async.dart';//导入async库，schema是package:代表是通过包管理器管理的第三方库，非sdk中自带的

//如果两个库中有相同的API，则可以通过as关键字给库加前缀的形式来区别，在调用api的时候使用"前缀.api"的形式来调用。
import 'dart:async' as dartAsync;
import 'package:async/async.dart' as pkAsync;
// Import only foo.只导入一部分库,即async.dart。
import 'package:async/async.dart' show foo;
//导入async库中除了async.dart以外的所有内容。
import 'package:async/async.dart' hide foo;
// deferred懒加载库，代表只有在使用的时候才加载，一搬用于减少启动时间，不常用的api等情况。需要用 deferred先导入，
//在真正调用的时候通过"hello.loadLibrary"形式来真正加载库。
/**
 * 对于懒加载库要注意：
   1. 在引用懒加载库的文件中，懒加载库中的常量在被真正加载(调用loadLibrary()方法)前不能当做常量来对待。
   2. 在引用懒加载库的文件中，不能使用懒加载库中的类型，应该考虑将接口类型移动到被懒加载库和引用懒加载库文件都引用的文件中
 */
import 'package:async/async.dart' deferred as hello;


/**
 * 如何制作一个library库的最基本目录结构
 * root dir----|---pubspec.yaml
 *             |---lib dir---------|-----src dir--------|---some sourcecode files
 *                                 |-----library.dart(source files apply)   
 */

// library 关键字一般是在库的主文件中省略，但是如果不需要生成库级文档，建议省略。


Future greet() async{
  //加载懒加载的库,可以在程序中调用多次，不会出错，实际只会加载一次。
  await hello.loadLibrary();
  print("dfdrfdd");
}

main(List<String> args) {
  greet();

}


