// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370


import 'package:constrained_centered_body/app_theme.dart';
import 'package:flutter/material.dart';

/// Colorful cards used in the grid view.
class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppTheme.onColor(color),
              ),
        ),
      ),
    );
  }
}
