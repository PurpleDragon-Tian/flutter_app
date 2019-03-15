import 'dart:math';

/**
 * Dart是面向对象语言，所以也有类的概念，Dart类有如下特点:
 * 所有的类都是Object类的子类。
 * 基于mixin的实现类之间继承的概念。
 * 通过"对象.成员"的形式来调用类中方法或者属性,Dart中还可以通过"对象?.成员"的形式来调用类中的成员,这样的调用可以避免因为对象为空导致的程序崩溃异常，该操作相当于在调用前先自动做了一次判空处理。
 * 类中的变量如果未初始化，则默认值都为null
 * 类中的变量声明后自动隐式声明get方法，非final变量同时自动隐式声明set方法。
 * 如果在声明时初始化变量，则该变量会在创建类的实例时赋值，在调用构造方法和执行初始化列表之前赋值。
 * Dart中没有内部类一说，所有的类都是平级定义声明的。
 */

void useImplicitInterface() {
  loadData();
}

/**
 * 抽象类的相关操作
 */
void abstractClassActions() {
  //声明并实例化抽象类型的变量
  AbstractClass obj = ImplementsClass();
}

void factoryMethods() {
  //利用factory 构造函数实例化，使用方式和使用其他构造方法一样，
  FactoryMethodClass cacheInstance = FactoryMethodClass('dd');
}

void testConstructor() {
  //变量类型是SubClass，
  var subClass = SubClass.One(2);
  print('subClass 的类型是 ${subClass.runtimeType}');
//由于SubClass继承于ParentClass， 所以SubClass产生的对象也属于ParentClass
  if (subClass is ParentClass) {
    print('subClass is ParentClass');
  }
//subClass对象是SubClass的构造方法实例化的，所以肯定也属于SubClass
  if (subClass is SubClass) {
    print('subClass is SubClass');
  }
}

/**
 * 该类主要实现构造函数
 */
class Point {
  num x, y;
  Point mPoint;

  //常规构造函数及其实现
  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }
  //Dart含有构造方法语法糖，可以省略构造方法中给成员变量赋值的操作，通过this关键字。形如：Point(this.x, this.y);如果构造方法只有赋值操作，则相当于省略了方法体。
  //利用语法糖实现构造函数，给成员变量赋值
  Point.sugar(this.x, this.y);
  /**
   * 通过不同的构造方法实例化
   */
  Point createInstance() {
    if (mPoint == null) mPoint = Point.origin();
    mPoint = Point.One(6);
    mPoint = new Point(4, 5);
    mPoint = Point(6, 8);
    return mPoint;
  }

  //重命名的构造函数，通过"类名.附加字符串"的形式来为类指定不同实现的构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }
  //单个参数的构造函数
  Point.One(this.x);
  //如果类中没有声明构造函数，则会默认有个无参的构造函数。并且默认构造函数调用的是超类中的构造函数。
  //除了默认构造函数，其余的构造函数是不能被子类继承的。
  //如果在子类中调用父类的无参构造函数，另外在子类中还有变量要初始化，则执行顺序应该是，先初始化变量，在调用父类构造方法，再执行子类的构造方法。
}

/**
 * 获取对象类型
 */
void getObjectType() {
  //Dart语言中，Object 类中有个属性runtimeType， 我们通过该属性来获取对象类型。
  ConstConstructor constConstructor = ConstConstructor(33, 43);
  //得到结果：constConstructor 是 ConstConstructor类型的对象
  print('constConstructor 是 ${constConstructor.runtimeType}类型的对象');
  AutoDetermineNull determineNull = AutoDetermineNull();
  //得到结果：determineNull 是 AutoDetermineNull类型的对象
  print('determineNull 是 ${determineNull.runtimeType}类型的对象');
}

/**
 * 通过const constructor实例化对象
 */
void userConstConstructor() {
  ConstConstructor instance = const ConstConstructor(55, 99);
  print('a = ${instance.a} , b = ${instance.b}');

  //通过const 构造方法创建常量对象
  var constInstanceA = const ConstConstructor(55, 99);
  var constInstanceB = const ConstConstructor(55, 99);
  //输出结果是:A HashCode is 805388832, B HashCode is 805388832
  print(
      'A HashCode is ${constInstanceA.hashCode}, B HashCode is ${constInstanceB.hashCode}'); //37767548
  //通过对以上两个对象的hashcode值的打印，可以发现，两个hashcode一致，通过Const构造方法得到的两个变量的引用是同一个，即是同一个编译时常量。但也仅仅是因为在这种使用方式的情况。

  //在下面通过Const构造方法得到的两个对象是不一样的。
  var constInstanceC = const ConstConstructor(3, 5);
  var constInstanceD = ConstConstructor(3, 5);
  //输出结果是:C HashCode is 261630489, D HashCode is 869811216
  print(
      'C HashCode is ${constInstanceC.hashCode}, D HashCode is ${constInstanceD.hashCode}');
  //由此可见，有没有const 关键字很重要。决定了是否要新建一个常量。
}

/**
 * Dart类构造方法的使用
 */
void userNormalConstructor() {
  //使用构造方法实例化对象,关键字new可以省略，从Dart2开始支持该特性
  AutoDetermineNull instanceByClassName = new /*new可省略*/ AutoDetermineNull();
  instanceByClassName.p = 'dfd';
  instanceByClassName.p = 333;
}

void autoDetermineNull() {
  AutoDetermineNull a; //下面三个通过a调用的操作单独执行某一个的时候都不会报null异常
  //打印属性p的值,因为对象a是null，导致a?.p直接返回null,所以最终打印出来的是null
  // print('通过对象来调用属性 ${a?.p}');
  //通过对象a来调用类AutoDetermineNull中的方法,由于对象a是null，导致a?.printElement()这句直接跳过。去执行下一条
  a?.printElement();
  //给属性p赋值，由于对象a是null，导致a?.p这句直接跳过。去执行下一条
  a?.p = 'this is string';
}

/**
 * 通过对象调用成员的时候进行自动判空的操作
 */
class AutoDetermineNull {
  var p;
  /**
   * 通过该方法打印属性p
   */
  printElement() {
    print('方法调用 $p');
  }
}

/**
 * 如果一个类生成所有的属性和操作都是不变的，那么可以使用const 构造方法来实例化对象，
 * 拥有const构造方法的类，其所有属性都必须是final修饰的常量。
 * 该构造方法是不能有方法体的。
 */
class ConstConstructor extends Object {
  final b;
  final a;
  const ConstConstructor(this.a, this.b);

  void printStr() {
    int c = a + b;
    print('a = $a, b = $b, c = $c');
  }

  @override
  String toString() {
    return "this is a Constructor instance";
  }
}

/**
 * 父类
 */
class ParentClass {
  int x;
  ParentClass.One(this.x) {
    print('int parent');
  }

  ParentClass.fromJson() {
    print('int parent');
  }
}

/**
 * 子类
 */
class SubClass extends ParentClass {
  SubClass.One(int x) : super.One(x) {
    print('in sub');
  }
  //如果父类中没有系统默认的未命名的、无参构造函数，则子类中也必须不能有默认的，未命名的，无参构造函数，
  //即子类中必须显示的声明一个重命名的构造函数，而且得手动调用一个父类的构造函数，具体形式通过冒号(:)来调用父类的构造函数
  //如果父类有多个构造函数，只选择其中一个调用即可。
  SubClass.fromJson() : super.fromJson() {
    print('in sub');
  }
}

/**
 * factory 构造方法主要用于不需要每次都创建新的对象的时候，有可能返回的对象是原来创建好的，有可能是子类创建的对象。
 */
class FactoryMethodClass {
  static final Map<String, FactoryMethodClass> _cache =
      <String, FactoryMethodClass>{};
  factory FactoryMethodClass(String name) {
    //缓存中如果已经含有了这个对象则不用重新创建
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      FactoryMethodClass factoryMethodClass = FactoryMethodClass._One(name);
      return factoryMethodClass;
    }
  }
  //factory 构造方法中不能访问"this"对象。
  factory FactoryMethodClass._two() {}
  FactoryMethodClass._One(String name);

  //通过关键字get 覆写变量默认的get方法
  num get aaa => aaa * 3;
  //通过关键字set 覆写变量默认的set方法
  set aaa(num bb) {
    aaa += bb;
  }
}

/**
 * 通过关键字abstract类创建一个抽象类。
 * 抽象方法只能定义在抽象类中。
 * 抽象类不能被实例化, 如果想让抽象类看起来可实例化，则请使用factory在抽象类中定义构造方法。
 */
abstract class AbstractClass {
  void doSomething();
  /**
   * 通过factory 定义构造方法，但是最终的构造还是通过具体实现类。
   */
  factory AbstractClass(String flag) {
    if (flag == 'imp') {
      return ImplementsClass();
    } else {
      return AbstractImplementClass();
    }
  }
}

class AbstractImplementClass implements AbstractClass {
  @override
  void doSomething() {
    // TODO: implement doSomething
  }
}

/**
 * 通过关键字implements 实现一个接口，即抽象类
 */
class ImplementsClass implements AbstractClass {
  /**
   * 实现抽象类的方法
   */
  @override
  void doSomething() {
    // TODO: implement doSomething
  }
}

/**
 * 隐式接口类，该功能用于即想复用某个类的结构，有不想继承该类的时候。这种实现，不属于继承，不存在子类父类的关系，
 * 每个类都有一个隐式接口，里面包含该类的所有成员变量和方法，实现该隐式接口的类需要重新实现一遍该类，包括变量，方法。
 */
class ImplicitInterface {
  String string;

  ImplicitInterface.One(this.string);

  String loadData() {
    return 'this is from ImplemetsInterface';
  }
}

/**
 * 实现隐式接口的类。
 */
class ImplicitInterfaceImp implements ImplicitInterface {
  @override
  String string;

  @override
  String loadData() {
    // TODO: implement loadData
    return 'this is from ImplemetsInterfaceImp';
  }
}

/**
 * 验证隐式接口 
 */
String loadData() {
  print(ImplicitInterface.One('dfd').loadData());
  print(ImplicitInterfaceImp().loadData());
}

/**
 * 定义电视类
 */
class Television {
  String name;
  covariant num versionCode;
  Television(this.name);
  void turnOn(String name) {
    print('我是$name，我可以接收广播电视信号，播放节目');
  }

  void testOverride(num test){

  }
}

/**
 * 定义智能电视类，该类继承自电视类，并进行了特有的扩展。
 * 
 */
class SmartTelevison extends Television {
  String name;

  @override
  int versionCode;
  SmartTelevison(String name) : super(name){
    this.name =name;
  }
  @override
  void turnOn(String name) {
    // TODO: implement turnOn
    super.turnOn(name);
    print('我是${this.name},能通过接收网络数据来播放网络节目');
    print('我是${this.name},能通过接收usb数据来播放本地节目');
  }
  
  /**
   * Dart中有中操作叫做'协作'
   * 在子类中可以覆盖父类方法的参数类型，也可以覆盖父类成员变量的类型，但必须是父类中对应类型的子类型。这个操作使用covariant关键字来处理。
   * 可以在子类真正覆盖时使用，也可以在父类实现方法或声明变量时使用，在父类中使用时，子类覆盖时就直接覆盖缩小方位即可。
   * 
   * 该关键字操作适用与变量、get set方法、其他方法。
   * 
   */
  @override
  void testOverride( covariant int test){

  }
}
/**
 * 适用类的扩展
 */
void useExtendingClass() {
  Television television =Television("电视");
  television.turnOn(television.name);

  SmartTelevison smartTelevison =SmartTelevison("智能电视");
  smartTelevison.turnOn(smartTelevison.name);
}

void main() {
  //？. 调用方式
  // autoDetermineNull();
  //使用普通构造方法
  // userNormalConstructor();
  //使用const构造方法
  // userConstConstructor();
  //获取对象类型
  // getObjectType();
  //测试父子类中构造方法的调用
  // testConstructor();
  //使用factory构造方法
  // factoryMethods();
  //抽象类
  // abstractClassActions();
  //隐式接口的使用
  // useImplicitInterface();
  //类的扩展的使用，
  useExtendingClass();
}


