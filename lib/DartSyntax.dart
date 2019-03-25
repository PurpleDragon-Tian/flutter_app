import 'package:meta/meta.dart';

/**
 * 所谓顶级，就是在当前.dart文件以内，文件内的所有类以外。即不在任何一个类的范围内。
 * 顶级区域可以做的操作：
 * 1、定义变量。
 * 2、定义方法。
 * 顶级区域不能坐的操作：
 * 1、不可以执行具体代码，比如调用系统api，给变量赋值，数值计算。
 *
 *
 */
//声明变量并且赋值,声明变量时类型可选，可以指定具体类型，也可以不指定，该变量是一个引用变量，变量name引用了一个内容为'Bob'的String类型对象。
var name = 'Bob';
//指定变量类型，有利于 IDE根据类型进行更准确的代码提示和错误检查。
String nickName = "lily";
//变量的默认值，所有变量的默认值都是null
int num;
//  assert(null == num);

//Final 和Const,二者都是定义常量的。都只能赋值一次。const变量是编译时常量（即代码被编译的时候就已经进行了赋值操作），const变量也是final变量。顶级的final变量和类级别的final变量都是在第一次被调用的时候初始化。
const a = 'test';
final c = 5;
//a = 'fdfdfd';,这个操作编译不通过。
//c = 8 ;这个编译也不通过。

//const关键字不仅可以用来声明变量，有时也用来定义不变的值。
var foo1 = const [];
//非final或者const修饰的变量，即便原来的值是const的，后期也可以再次给变量赋值。和定义的普通变量一样。
//  foo = [1,2,3,4,5];
//const变量和final变量声明时必须指定初始化值。
const cc = null;
final dd = 7;
//主函数main,每个app必须有一个顶级的main函数，作为程序的入口，main函数的参数是一个可选的String类型的List对象。
void main() {
//  handleNumbers();
//  handleStrings();
//  handleBooleans();
//  handleList();
//  handleSet();
//  handleMap();
//  handleRunesString();
  // handleFunctions();
  handleOperators();
//  handleControlFlowStatement();
}

/**
 * 控制流程语句
 */
handleControlFlowStatement() {
  //dart中的流程控制语句如下：
  /**
   * if and else
   * for loops
   * while and do-while loops
   * break and continue
   * switch and case
   * assert
   * 这些流程控制语句和java中一样，
   */
  if (true) {
  } else {}

  while (true) {}

  do {} while (true);

  int optional;
  switch (optional) {
    case 4:
      break;
    case 5:
      break;
  }

  assert(a == null);
}

void handleOperators() {
  //dart中大部分的操作符和Java中一样，只有一部分特有的运算符需要重点学习一下
  //?.是dart中特有的运算符，使用形式是express1?.express2; 表示如果express1不等于null，则返回express1，否则返回express2.
  //is 用于对象的类型判断，相当于java中的instance， is!与is相反。
  //as 用于对象的类型转换。
  // "/"除以，这个和java不一样，dart中“/”运算返回的结果是整数，如果想返回小数，则使用"~/"
  // "??"是属于赋值运算符，形如express1??=express2; 表示express1是否等于null，如果是，则将express2赋值给express1,否则还保持原值。

  int a = 6;
  int dd = 8;
  //一元后缀表达式,执行完当前语句后在进行一元运算，
  print("${a++}"); //打印6，然后给a+1=7
  print("${a++}"); //打印7， 然后给a+1=8
  print("${a}"); //打印8，然后给a+1=9
  //一算运算还有 a--,赋值运算符(=)等，

  a ??= dd;
}

void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

// void main() {
//   var x;

//   // Comparing top-level functions.
//   x = foo;
//   assert(foo == x);

//   // Comparing static methods.
//   x = A.bar;
//   assert(A.bar == x);

//   // Comparing instance methods.
//   var v = A(); // Instance #1 of A
//   var w = A(); // Instance #2 of A
//   var y = w;
//   x = w.baz;

//   // These closures refer to the same instance (#2),
//   // so they're equal.
//   assert(y.baz == x);

//   // These closures refer to different instances,
//   // so they're unequal.
//   assert(v.baz != w.baz);
// }

void handleFunctions() {
  //Dart是真正的面向对象语言，所以即使是函数也是对象，属于Function类型，可以被赋值给变量，可以作为参数传递给其他方法。
  //定义一个函数
  var _nobleGases = {"atomNumber": null, "test": 2, 2: 4};
  //dart中函数的返回值类型是可省略的，
  bool isNoble(int atomNumber) {
    return _nobleGases[atomNumber] != null;
  }

  //箭头语法,如果dart函数只有一句执行语句，则可以使用  "=>表达式" 的形式。
  bool isString(String test) => _nobleGases["test"] != null;

//dart中函数的参数有两种定义方式，一个是命名参数，另一个是位置参数，在定义一个方法时，她的参数只能是命名参数和位置参数中的一种，不能两种类型声明都有。

//命名参数，和java定义方法声明参数一样。但调用时不一样，
//声明方法enableFlags，@require是注解语句，代表child参数是必填参数, @require注解在dart的meta包中，或者flutter 的material.dart
  void enableFlags({bool bold, bool hidden, @required String child}) {}
//调用,调用的时候要通过"paramName:value"的形式传参，
  enableFlags(bold: false, hidden: true, child: "dfadfa");

//位置参数，只能是最后一个位置的参数，用中括号包裹[paramName value],
//声明
  void say(String name, String msg, [String device = "小米"]) {
    print('$name, $msg 你用的手机是$device');
  }

//调用
  say("bob", "hello", "dfafdad");
//定义方法的时候可以指定参数的默认值，默认值必须是编译时常量，或者编译时常量表达式，final常量都不行。含变量的表达式也不行
//命名参数指定默认值则用"{}"包裹起来，
  const ag = 3;
  const ddddd = 3;
  final dfadfasdf = 3232;
  defalutValue(
      {bool flag = true, bool lib = false, int value = ddddd * 3 * 3}) {}
//指定位置参数的默认值，位置参数指定默认值是[type paramName = value]
  defalutPosValue([String test = "dfsfa"]) {}
//指定默认值的时候还可以直接指定一个集合类型的const常量
  defaultListValue(
      {List<String> devices = const [
        "oppo",
        "vivo",
        "huawei",
        "xiaomi",
        "lg"
      ]}) {}

//在dart中函数也可以当做其他函数的参数来传递
  void printElement(int num) {
    print(num);
  }

  var numList = [2, 43, 5, 6756, 7565];
  numList.forEach(printElement);
//可以把一个函数赋值给一个变量,变量值是一个匿名函数，不要返回值和函数名称，只要参数声明和方法体
  var func = (int name) {
    print(name);
  };
  func(4344);

//闭包，就是在方法中定义的方法，闭包可以访问外部方法的局部变量，
//操作步骤1.定义外部方法，声明局部变量；2、在外部方法中实现内部方法，即闭包；3将闭包暴露出来，就是return 闭包;

  Function add2 = makeAdd();
  Function add3 = makeAdd();

  print(add2(4));
  print(add3(4));
// assert(add2(4) == 10);
// assert(add3(4) != 10);
//dart中任何一个函数都有返回值，如果没有显示指定返回值，则默认返回null，链接器器会自动加上
}

Function makeAdd() {
  int add = 0;
  return () {
    print(add++);
  };
}

void handleRunesString() {
  //runes字符串是utf-32模式的字符串表达方式，常用语表情的展示，由于dart默认只有Utf-16范围内的字符串，所以特殊字符传需要特殊语法。通常runes格式为"\uXXXX"
  //(♥) = \u2665,如果十六进制数字多余或者少于4位，则应该用大括号括起来 “\u{XXX}” 或者 "\u{XXXX......}"
  //(String)[https://api.dartlang.org/stable/2.2.0/dart-core/String-class.html]中有一些方法可以提取runes字符串。
  //打印出字符串中每个字符在相应字符集中的编码
  print("(♥)😆d".codeUnits); //UTF-16中的编码，[40, 9829, 41, 55357, 56838, 100]
  print("(♥)😆d".runes); //UTF-32中的编码，(40, 9829, 41, 128518, 100)

  print("\u4B5A"); //䭚
  print("\u{1f600}"); //😆
  Runes input = new Runes('\u2665  \u{1f605}  \u{1f60e}  ');
  print(new String.fromCharCodes(input));
}

/**
  Map是键值对<Key,Value>形式的数据集合：
  1、键不可重复
  2、值可以重复
  3、无序的
 */

void handleMap() {
  //定义Map集合,集合中的没对key  value的类型都要相应一致，即key的类型一样，value的类型一样
  var stringMapData = {
    //直接赋值定义map
    "name": "bob",
    "sex": "女",
    "positon": "CEO"
  };
//  stringMapData["dd"] = 2; 非法的
  var numMapData = Map(); //先使用构造方法实例化，然后赋值
  numMapData[2] = 3;
  numMapData[3] = 65;
  numMapData[0] = 34;
  numMapData[1] = 0;

  var wrongMapData = {2: 3, "test": "wrong"};
  wrongMapData["df"] = "fd"; //合法的
  wrongMapData["df"] = 77; //合法的
  wrongMapData[9] = "fd"; //合法的
  wrongMapData[9] = 88; //合法的

  //构造方法的使用,"="后面的关键字new从Dart2开始是可选的，
  var newMap = new Map();

  //map中增加元素 , 变量名[key] = value;
  newMap["key"] = "value";

  //获取map长度
  int mapLen = newMap.length;

  //创建Map类型的const常量
  final constMap = const {"key": "value", "one": "two", 2: 3};
  //constMap["fd"]="dfd";//编译可通过，但执行会报错
  print(constMap);
}

void handleSet() {
  //定义空set
  var setEmpty = <String>{};
  //或者
  var emptySet;
  emptySet = {};
  //如果通过var定义如下变量，即值为空的集合，因为没有指明值的类型，则系统默认是一个Map型集合。
  var mapOrSet = {};
  assert(mapOrSet is Map);

  var setData = {'1', '2', '3'}; //Set
  var mapData = {'1': '1', '2': '2'}; //Map

  //添加另一个set集合
  var needToAddSet = {'4', '5', '6'};
  setData.addAll(needToAddSet);
  //添加一个素材到集合中
  setData.add('7');

  //获取Set长度
  int length = setData.length;
  print('set length is $length');

  //定义一个Set类型的编译时常量（const常量）
  final constSet = const {1, 2, 3, 4};
  //constSet = {3,4}; 这是错误的，const常量只能赋值一次
}

void handleList() {
  //定义list
  var firstList = [1, 2, 3];
//  上边声明变量firstList时候使用的var关键字，没有致命列表类型，但是根据变量值推断出列表中的对象是int类型，所以后边修改列表时也必须是int对象。
  //firstList[0]='dfdf';错误的操作
  firstList[0] = 9; //正确的操作

  var length = firstList.length;

  //获取列表中某个位置的元素，和java中数组的操作方式一样,和javascript操作列表的方式一样。
  var firEle = firstList[0];
  //遍历并打印列表中的元素，for循环
  for (int index = 0; index < firstList.length; index++) {
    var str = '第 $index 个元素是： ${firstList[index]}';
    print(str);
  }
  //如何只是淡出的打印出列表中的元素可以使用如下快捷方式：
  print(firstList);
  //定义List类型的编译时常量
  var list = const [1, 2, 3];
}

void handleBooleans() {
  var emptyStr = '';
  assert(emptyStr.isEmpty);

  var numZero = 0;
  assert(numZero <= 0);

  var nullObj;
  assert(null == nullObj);

  var value = 0 / 0;
  assert(value.isNaN);
}

void handleNumbers() {
  //位运算
  assert((3 << 1) == 6); // 0011 << 1 == 0110 左移一位
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001 右移一位
  assert((3 | 4) == 7); // 0011 | 0100 == 0111 按位或
  //定义整数和小数
  var a = 1;
  var hex = 0xDFD3DFEE;
  var dou = 5.5;
  //int --> double
  double tt = 4; //（dart2.1之前这样的操作是不允许的）
  //double --> int
  3.toDouble();

  //string ----> int
  int.parse("2");
  //string ----> double
  double.parse("3.3");
  //如果使算数运算给一个编译时数字型常量赋值，那么算数表达式的变量也必须是编译时变量。
  const e = 4;
  const b = 5;
  const c = e + b;
}

void handleStrings() {
  //定义字符串
  String str0 = 'the str';
  String str00 = "the str";
  //三个单引号包裹的字符串在展示时是保持原来的格式的，比如段落对齐，换行等格式。
  String str000 = '''
都放假啦就是分了就爱上的阿萨德路附近拉萨的
地方就拉倒会计法
法律的会计法拉克就是
''';

  //字符串拼接
  String str = "this is a dog.";
  String str1 = "No, it's a cat.";
  //通过加号“+”拼接
  String str2 = str + str1;
  //通过${表达式}
  String str3 = " aaaa $str";
  //直接拼接
  String str5 =
      'Is this a dog? ' 'No,it\'s a cat. ' "You are all wrong , it\'s a pig.";

  //保持原格式字符串
  //通过三个单引号或者三个双引号来包裹，
  String test = '''
Is this a dog?
No, it\'s a cat .
You are all wrong,it\'s a pig.''';
  String test1 = """
Is this a dog?
No, it\'s a cat .
You are all wrong,it\'s a pig.""";
//通过在字符串值前加一个前缀“r”,也就是通过runes字符集的形式
  String test2 = r"define a string keep format";
  //如果想使用多个插值表达式来拼接赋值给一个编译时字符串常量，则这几个插值表达式都必须是编译时常量。
  const num = 6;
  const bools = true;
  const constStr = "this is string";
  const numStr = "$num $bools $num";
}
