// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370

// Draw a number of boxes showing the colors of key theme color properties
// in the ColorScheme of the inherited ThemeData and some of its key color
// properties.
// This widget is just used so we can visually see the active theme colors
// in the examples and their used FlexColorScheme based themes.
import 'package:constrained_centered_body/app_theme.dart';
import 'package:constrained_centered_body/insets.dart';
import 'package:constrained_centered_body/theme_card.dart';
import 'package:flutter/material.dart';

class ShowThemeColors extends StatelessWidget {
  const ShowThemeColors({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final Color appBarColor =
        theme.appBarTheme.backgroundColor ?? theme.primaryColor;

    // A Wrap widget is just the right handy widget for this type of
    // widget to make it responsive.
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 110,
        mainAxisExtent: 70,
        mainAxisSpacing: Insets.s,
        crossAxisSpacing: Insets.s,
      ),
      delegate: SliverChildListDelegate(
        <Widget>[
          ThemeCard(
            label: 'Primary',
            color: colorScheme.primary,
            textColor: colorScheme.onPrimary,
          ),
          ThemeCard(
            label: 'Primary\nColor',
            color: theme.primaryColor,
            textColor: theme.primaryTextTheme.titleMedium!.color ?? Colors.white,
          ),
          ThemeCard(
            label: 'Primary\nColorDark',
            color: theme.primaryColorDark,
            textColor: AppTheme.onColor(theme.primaryColorDark),
          ),
          ThemeCard(
            label: 'Primary\nColorLight',
            color: theme.primaryColorLight,
            textColor: AppTheme.onColor(theme.primaryColorLight),
          ),
          ThemeCard(
            label: 'Secondary\nHeader',
            color: theme.secondaryHeaderColor,
            textColor: AppTheme.onColor(theme.secondaryHeaderColor),
          ),
          
          ThemeCard(
            label: 'Secondary',
            color: colorScheme.secondary,
            textColor: colorScheme.onSecondary,
          ),
          ThemeCard(
            label: 'AppBar',
            color: appBarColor,
            textColor: AppTheme.onColor(appBarColor),
          ),
          ThemeCard(
            label: 'Divider',
            color: theme.dividerColor,
            textColor: colorScheme.onBackground,
          ),
          ThemeCard(
            label: 'Background',
            color: colorScheme.background,
            textColor: colorScheme.onBackground,
          ),
          ThemeCard(
            label: 'Canvas',
            color: theme.canvasColor,
            textColor: colorScheme.onBackground,
          ),
          ThemeCard(
            label: 'Surface',
            color: colorScheme.surface,
            textColor: colorScheme.onSurface,
          ),
          ThemeCard(
            label: 'Card',
            color: theme.cardColor,
            textColor: colorScheme.onBackground,
          ),
          ThemeCard(
            label: 'Dialog',
            color: theme.dialogBackgroundColor,
            textColor: colorScheme.onBackground,
          ),
          ThemeCard(
            label: 'Scaffold\nbackground',
            color: theme.scaffoldBackgroundColor,
            textColor: colorScheme.onBackground,
          ),
          ThemeCard(
            label: 'Error',
            color: colorScheme.error,
            textColor: colorScheme.onError,
          ),
        ],
      ),
    );
  }
}
