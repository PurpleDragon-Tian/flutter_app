import 'package:meta/meta.dart';

/**
 * 使用metadata为代码提供有关的附加信息。
 * 元数据的注解以@符号开头，后跟编译时常量的引用，或者跟常量构造函数。
 * 可以自定义Metadata，
 */
/**
 * 定义metadata类FavorateMetadata，const构造函数
 */
class FavorateMetadata {
  const FavorateMetadata();
}

/**
 * 定义metadata类Todo，
 */
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

/**
 * 定义Metadata类型常量
 */
const FavorateMetadata favorateMetadata = FavorateMetadata();

@favorateMetadata
@Todo("", "")
@deprecated
void doSomething(@required int rest) {
  // TODO:
  print('do something');
}
