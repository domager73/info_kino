import 'package:flutter/material.dart';



class AppTypography {
  const AppTypography._();

  static Color _colorBlack = Colors.black;
  static const _font = TextStyle(fontFamily: 'SF Pro Display',);

  static final font14black = _font.copyWith(
    color: _colorBlack,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static final font24black = _font.copyWith(
    color: _colorBlack,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static final font17black = _font.copyWith(
    color: _colorBlack,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );
  static final font20black = _font.copyWith(
    color: _colorBlack,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static final font16black = _font.copyWith(
    color: _colorBlack,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final font18black = _font.copyWith(
      color: _colorBlack,
      fontSize: 18,
      fontWeight: FontWeight.w500
  );
}
