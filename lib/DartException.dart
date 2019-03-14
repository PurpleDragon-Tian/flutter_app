/**
 * Dart语言也有异常处理机制，和java一样，可以通过try{}catch(Exception e){}finally{}语句来捕获和处理异常的。
 * 但是Dart语言的异常处理机制也有可java不同的地方
 * 1、所有的Dart异常都是未经检查的异常，也就是说，方法不会主动提示你该方法的执行会引发哪些可能的异常，也不会要求你对相应的异常进行处理，而java中的异常都是经过检查的，是必须处理的。
 * 2、如果捕获异常后的处理不需要用到Exception对象，则可以用on关键字来捕获异常，如果需要用到Exception对象，则使用catch(Exception e)。
 * 3、java中的异常要么直接处理，要么向上层抛，只能是一种操作，但是dart支持，直接处理、向上层抛出，进行部分处理后再向上层抛出，向上层抛出异常是通过关键字rethrow;
 * 4、Dart中有Exception和Error两种类型。还有一些具体的异常，都是Exception 和 Error的子类。也可以自定义异常。
 * 5、Dart可以throw 任何非空对象，不只能抛出Exception和Error。
 * 6、如果执行了finally中的语句前对没有catch 语句匹配到产生的异常，则该异常会自动向上层抛出。
 */

import 'package:flutter/material.dart';

void main(List<String> args) {
  try {
    testCreateException();
  } catch (e) {
    //这里捕获处理的是testCreateException方法向上层抛出的异常。
  }
}

void testCreateException() {
  //捕获异常并处理，需要用到Exception对象的操作
  try {
    //statement......;
    int.parse("ss");
    //抛出自定义异常。
    throw new CustomException("this is a custom exception");
    //抛出一个对象。
    throw Object();
  } on CustomException {
    //处理自定义的异常
    handleCustomException();
  } on IntegerDivisionByZeroException {
    //处理IntegerDivisionByZeroException不需要用到Exception对象，所以直接用on来捕获异常即可。无须用catch(e);
    handleIntegerDivisionByZeroException();
  } on FormatException catch (e) {
    //处理特定类型的异常
    handleFormatException(e);
    // rethrow;
  } catch (e) {
    //处理与上面捕获的异常以外的各种类型的异常
    handleException(e);
    //抛出异常
    rethrow;
  } catch (e, s) {
    //catch返回两个参数，第一个参数是Exception 对象，第二个参数是 stack trace 堆栈跟踪信息。
  }finally{
    //进行异常处理后的操作。这个操作是为了确保即便出现了异常也要执行到的代码，比如关闭数据库cursor，
    //无论时候发生异常都要执行关闭操作,否则会影响后面的程序执行;
    //
  }
}

/**
 * 处理自定义的异常
 */
void handleCustomException() {}
/**
 * 处理IntegerDivisionByZeroException
 */
void handleIntegerDivisionByZeroException() {
  //handle exception statement......;
}
/**
 * /处理FormatException
 */
void handleFormatException(FormatException e) {
  var exMsg = e.message;
  print("the exception message is $exMsg");
}

/** 
 * 处理异常
 */
void handleException(e) => print(e.toString());

/**
 * 自定义异常类。继承自Exception抽象类。
 * 
 */
class CustomException implements Exception {
  CustomException(@required String msg) {
    print('$msg');
  }
}
