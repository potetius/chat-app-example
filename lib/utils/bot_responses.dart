import 'dart:math';

final _responses = [
  "こんにちは！",
  "元気ですか？",
  "Flutter楽しいね！",
  "がんばって！",
  "いい質問だね！",
];

String getRandomBotResponse() {
  final random = Random();
  return _responses[random.nextInt(_responses.length)];
}
