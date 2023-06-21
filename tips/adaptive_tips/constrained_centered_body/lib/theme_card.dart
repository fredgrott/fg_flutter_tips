// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370


// This is just simple SizedBox with a Card with a passed in label, background
// and text label color. Used to show the colors of a theme color property.
import 'package:constrained_centered_body/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppTheme.radius),
        ),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
