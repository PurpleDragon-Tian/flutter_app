/**
 * Dart 语言中 TypeDef 关键字用于为函数指定别名，当然目前只支持为函数指定别名，后期可能会支持更多
 * 起作用主要可用于对某个函数类型的判断，还有在把函数当做参数传递时候对参数类型的限定。
 */

//基本定义方式，typedef 别名 = 函数;
typedef Comppare<T> = T Function(T a, T b);
//简化定义方式 typedef 函数返回值类型 别名(函数所需参数);
typedef T Comparee<T>(T a, T b);
