// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370

import 'package:flutter/material.dart';

/// Just for fun let's make a simple custom theme for this demo app.
class AppTheme {
  AppTheme._();

  /// Define the light theme.
  static ThemeData get light {
    final Color primary = Colors.indigo[700]!;
    final Color secondary = Colors.blue[500]!;
    final ColorScheme scheme = ColorScheme.light(
      primary: primary,
      onPrimary: onColor(primary),
      //primaryVariant: Colors.indigo[800]!,
      secondary: secondary,
      onSecondary: onColor(secondary),
      //secondaryVariant: Colors.blue[700]!,
      surface: Color.alphaBlend(primary.withAlpha(0x06), Colors.white),
      background: Color.alphaBlend(primary.withAlpha(0x06), Colors.white),
    );
    return ThemeData.from(colorScheme: scheme).copyWith(
      primaryColor: scheme.primary,
      primaryColorLight: Colors.indigo[200],
      primaryColorDark: Colors.indigo[900],
      secondaryHeaderColor: Colors.indigo[50],
      //toggleableActiveColor: _secondary,
      scaffoldBackgroundColor: Color.alphaBlend(primary.withAlpha(0x10), Colors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary.withAlpha(0xF0),
        elevation: 0,
      ),
      bottomNavigationBarTheme: _bottomNavigationTheme(scheme),
      cardTheme: _cardTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      toggleButtonsTheme: _toggleButtonsTheme(scheme),
      inputDecorationTheme: _inputDecorationTheme(
        scheme.primary.withOpacity(0.035),
        scheme,
      ),
    );
  }

  /// Define the dark theme.
  static ThemeData get dark {
    final Color primary = Colors.indigo[300]!;
    final Color secondary = Colors.blue[300]!;
    final ColorScheme scheme = ColorScheme.dark(
      primary: primary,
      onPrimary: onColor(primary),
      //primaryVariant: Colors.indigo[400]!,
      secondary: secondary,
      onSecondary: onColor(secondary),
      //secondaryVariant: Colors.blue[400]!,
      surface: Color.alphaBlend(
        primary.withAlpha(0x1C),
        const Color(0xff121212),
      ),
      background: Color.alphaBlend(
        primary.withAlpha(0x1C),
        const Color(0xff121212),
      ),
    );
    return ThemeData.from(colorScheme: scheme).copyWith(
      primaryColor: scheme.primary,
      primaryColorLight: Colors.indigo[200],
      primaryColorDark: Colors.indigo[500],
      secondaryHeaderColor: Colors.indigo[100],
      //toggleableActiveColor: _secondary,
      scaffoldBackgroundColor: Color.alphaBlend(
        primary.withAlpha(0x2A),
        const Color(0xff121212),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary.withAlpha(0xF0),
        elevation: 0,
      ),
      bottomNavigationBarTheme: _bottomNavigationTheme(scheme),
      cardTheme: _cardTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      toggleButtonsTheme: _toggleButtonsTheme(scheme),
      inputDecorationTheme: _inputDecorationTheme(
        scheme.primary.withOpacity(0.15),
        scheme,
      ),
    );
  }

  // Minimum button size.
  static const Size _minButtonSize = Size(46, 46);

  // Border radius default
  static const double radius = 16;

  // Enabled outline thickness.
  static const double _outline = 1.5;

  // The rounded buttons generally need a bit more padding to look good,
  // adjust here to tune the padding for all of them globally in the app.
  static const EdgeInsets roundButtonPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );

  /// Get onColor.
  static Color onColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light ? Colors.black : Colors.white;

  // Rounded CardTheme.
  static const CardTheme _cardTheme = CardTheme(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    ),
  );

  // Bottom NavigationBarTheme, we want primary colored selected icons
  // background colored navbar with a hint of opacity.
  static BottomNavigationBarThemeData _bottomNavigationTheme(ColorScheme colorScheme) =>
      BottomNavigationBarThemeData(
        backgroundColor: colorScheme.background.withOpacity(0.95),
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: colorScheme.primary,
        ),
        selectedItemColor: colorScheme.primary,
      );

  // Rounded InputDecorationTheme, with fill color.
  static InputDecorationTheme _inputDecorationTheme(Color fillColor, ColorScheme colorScheme) =>
      InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(radius),
          ),
          borderSide: BorderSide(
            color: colorScheme.primary.withOpacity(0.45),
            width: _outline,
          ),
        ),
      );

  // Rounded ElevatedButton theme.
  static ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: _minButtonSize,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ), //buttonShape,
          padding: roundButtonPadding,
          elevation: 0, // By default we do not elevated, elevated button.
        ),
      );

  /// Rounded ToggleButtons theme.
  static ToggleButtonsThemeData _toggleButtonsTheme(ColorScheme colorScheme) => ToggleButtonsThemeData(
        selectedColor: colorScheme.onPrimary,
        color: colorScheme.primary.withOpacity(0.85),
        fillColor: colorScheme.secondary.withOpacity(0.85),
        hoverColor: colorScheme.primary.withOpacity(0.2),
        focusColor: colorScheme.primary.withOpacity(0.3),
        borderWidth: _outline,
        borderColor: colorScheme.primary,
        selectedBorderColor: colorScheme.primary,
        borderRadius: BorderRadius.circular(radius),
        constraints: BoxConstraints.tight(_minButtonSize),
      );
}
