//format currency or any frequently used method

extension NumExtension on num {

}
extension DoubleExtension on double{
  //or you can also format in the form of 1,000.00$
  String get toDollarCurrency => '${toStringAsFixed(2)}\$';
  String get toEuroCurrency => '${toStringAsFixed(2)}€';
}