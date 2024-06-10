import 'dart:math';

String getTransactionId() {
  Random random = Random();
  int randomNumber = random.nextInt(1000000000);
  return "$randomNumber";
}
