
/**
 * dart语言的语法和java语言比较：
 *
 * 一句代码执行完后要跟分号
 *
 *
 * dart语言也有main方法，有两种形式，一种是带参数的，一种是不带参数的：
 * main（）{
 *
 * }
 *
 * main(List<Stirng> args){
 *
 * }
 *
 *
 *
 *
 */

void main(){
  //for循环，和java基本一样，只是i变量没有制定具体类型。
  for(var i = 0 ; i< 5; i++) {
    //打印字符串方法，字符串和变量的拼接和java不一样，dart的处理更类似脚本语言
    print('Hello world ${i+1} time');
  }

}