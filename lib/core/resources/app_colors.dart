import 'package:flutter/rendering.dart';

class AppColors {
  // Main colors
  // static const Color primary500 = Color(0xFF6949FF);
  static const Color primary500 = Color(0xFF0089fe);
  static const Color primary400 = Color(0xFF876DFF);
  static const Color primary300 = Color(0xFFA592FF);
  static const Color primary200 = Color(0xFFC3B6FF);
  static const Color primary100 = Color(0xFFF0EDFF);

  static const Color secondary500 = Color(0xFFFFC107);
  static const Color secondary400 = Color(0xFFFFCD39);
  static const Color secondary300 = Color(0xFFFFDA6A);
  static const Color secondary200 = Color(0xFFFFE69C);
  static const Color secondary100 = Color(0xFFFFF9E6);

  // Alert & Status
  static const Color success = Color(0xFF12D18E);
  static const Color info = Color(0xFF6949FF);
  static const Color warning = Color(0xFFFACC15);
  static const Color error = Color(0xFFF75555);
  static const Color disabled = Color(0xFFD8D8D8);
  static const Color disabledButton = Color(0xFF543ACC);

  // Greyscale
  static const Color grey900 = Color(0xFF212121);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey50 = Color(0xFFFAFAFA);

  // Gradients
  static const LinearGradient gradientGreen = LinearGradient(
    colors: [Color(0xFF12D18E), Color(0xFF71E3BB)],
  );
  static const LinearGradient gradientYellow = LinearGradient(
    colors: [Color(0xFFFACC15), Color(0xFFFFE580)],
  );
  static const LinearGradient gradientBlue = LinearGradient(
    colors: [Color(0xFF246BFD), Color(0xFF5089FD)],
  );
  static const LinearGradient gradientPurple = LinearGradient(
    colors: [Color(0xFF6949FF), Color(0xFF876DFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient gradientTeal = LinearGradient(
    colors: [Color(0xFF019B83), Color(0xFF18C6AB)],
  );
  static const LinearGradient gradientRed = LinearGradient(
    colors: [Color(0xFFFF5A5F), Color(0xFFFF8A9B)],
  );
  static const LinearGradient gradientOrange = LinearGradient(
    colors: [Color(0xFFFB9400), Color(0xFFFFAB38)],
  );

  // Dark Colors
  static const Color dark1 = Color(0xFF181A20);
  static const Color dark2 = Color(0xFF1F222A);
  static const Color dark3 = Color(0xFF262A35);
  static const Color dark4 = Color(0xFF35383F);

  // Others
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFF44336);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);

  // Background
  static const Color backgroundPurple = Color(0xFFF9F8FF);
  static const Color backgroundYellow = Color(0xFFFFFCEB);
  static const Color backgroundGreen = Color(0xFFF1FDF5);
  static const Color backgroundBlue = Color(0xFFF6F9FF);
  static const Color backgroundTeal = Color(0xFFF2FFFD);
  static const Color backgroundRed = Color(0xFFFFF7F8);
  static const Color backgroundOrange = Color(0xFFFFF8ED);

  // Transparent
  static const Color transparentPurple = Color(0xFF6949FF);
  static const Color transparentYellow = Color(0xFFFFD300);
  static const Color transparentGreen = Color(0xFF12D18E);
  static const Color transparentBlue = Color(0xFF246BFD);
  static const Color transparentTeal = Color(0xFF019B83);
  static const Color transparentRed = Color(0xFFFF5A5F);
  static const Color transparentOrange = Color(0xFFFF9800);
  static const Color transparentCyan = Color(0xFF00BCD4);
}
