import 'dart:ui';

import 'package:flutter_example/constants/asset_constants/resources.dart';
import 'package:flutter_example/screens/signin/team_select_view.dart';

class Constants {
  static List<TeamListType> teamList = [
    TeamListType('두산 베어스', false, Assets.emblemOb, const Color(0xff131230)),
    TeamListType('LG 트윈스', false, Assets.emblemLg, const Color(0xffC30452)),
    TeamListType('KIA 타이거즈', false, Assets.emblemHt, const Color(0xffEA0029)),
    TeamListType('삼성 라이온즈', false, Assets.emblemSs, const Color(0xff074CA1)),
    TeamListType('롯데 자이언츠', false, Assets.emblemLt, const Color(0xff041E42)),
    TeamListType('한화 이글스', false, Assets.emblemHh, const Color(0xffFF6600)),
    TeamListType('SSG 랜더스', false, Assets.emblemSk, const Color(0xffCE0E2D)),
    TeamListType('키움 히어로즈', false, Assets.emblemWo, const Color(0xff570514)),
    TeamListType('NC 다이노스', false, Assets.emblemNc, const Color(0xff315288)),
    TeamListType('kt 위즈', false, Assets.emblemKt, const Color(0xff000000)),
  ];

  static List<String> stadiumList = [
    '창원NC파크',
    '대구삼성라이온즈파크',
    '고척스카이돔',
    '광주기아챔피언스필드',
    '인천SSG랜더스필드',
    '수원KT위즈파크',
    '사직야구장',
    '서울종합운동장 야구장',
    '대전한화생명이글스파크',
  ];
}
