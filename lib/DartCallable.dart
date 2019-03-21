/**
 * 为了能想访问函数一样的访问一个Dart类，可以通过在该类中实现call方法来达到这个效果
 * 
 */

// class CallClassLikeCallFunction {
//   call(String str){
//     '$str !';
//   }
 
// }

// main(List<String> args) {
//   var cf = CallClassLikeCallFunction();
//   var call =cf('like');
//   print(call);
// }

class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

main() {
  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');
}