import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_example/constants/asset_constants/resources.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.emblemHh).existsSync(), isTrue);
    expect(File(Assets.emblemHt).existsSync(), isTrue);
    expect(File(Assets.emblemKt).existsSync(), isTrue);
    expect(File(Assets.emblemLg).existsSync(), isTrue);
    expect(File(Assets.emblemLt).existsSync(), isTrue);
    expect(File(Assets.emblemNc).existsSync(), isTrue);
    expect(File(Assets.emblemOb).existsSync(), isTrue);
    expect(File(Assets.emblemSk).existsSync(), isTrue);
    expect(File(Assets.emblemSs).existsSync(), isTrue);
    expect(File(Assets.emblemWo).existsSync(), isTrue);
  });
}
