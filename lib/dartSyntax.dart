import 'package:flutter_app/dartSyntax.dart';

/**
 * 所谓顶级，就是在当前.dart文件以内，文件内的所有类以外。即不在任何一个类的包裹中。
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

//Final 和Const,二者都是定义常量的。都只能赋值一次。const变量是编译时常量，const变量也是final变量。顶级的final变量和类级别的final变量都是在第一次被调用的时候初始化。
const a = 'test';
final c = 5;
//a = 'fdfdfd';,这个操作编译不通过。
//c = 8 ;这个编译也不通过。

//const关键字不仅可以用来声明变量，有时也用来定义不变的值。
var foo = const [];
//非final或者const修饰的变量，即便原来的值是const的，后期也可以再次给变量赋值。和定义的普通变量一样。
//  foo = [1,2,3,4,5];
//const变量和final变量声明时必须指定初始化值。
const cc = null;
final dd = 7;

void main() {
//  handleNumbers();
//  handleStrings();
//  handleBooleans();
  handleList();

}

void handleList() {
  //定义list
  var firstList  = [1,2,3];
//  上边声明变量firstList时候使用的var关键字，没有致命列表类型，但是根据变量值推断出列表中的对象是int类型，所以后边修改列表时也必须是int对象。
  //firstList[0]='dfdf';错误的操作
  firstList[0] = 9;//正确的操作

  var length = firstList.length;

  //获取列表中某个位置的元素，和java中数组的操作方式一样,和javascript操作列表的方式一样。
  var firEle = firstList[0];
  //遍历并打印列表中的元素，for循环
  for(int index = 0 ; index < firstList.length ; index++){
    var str = '第 $index 个元素是： ${firstList[index]}' ;
    print(str);
  }
  //如何只是淡出的打印出列表中的元素可以使用如下快捷方式：
  print(firstList);




}

void handleBooleans() {
  var emptyStr = '';
  assert(emptyStr.isEmpty);

  var numZero = 0;
  assert(numZero <= 0);

  var nullObj ;
  assert(null == nullObj);

  var value = 0/ 0;
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
