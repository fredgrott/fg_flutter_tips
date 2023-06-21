// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370

import 'package:flutter/material.dart';

/// Insets and vertical and horizontal fixed size spacers.
class Insets {
  Insets._();

  // Margins
  static const double s = 4;
  static const double m = 8;
  static const double l = 16;

  // Spacers vertical
  static const SizedBox vSpaceS = SizedBox(height: s);
  static const SizedBox vSpaceM = SizedBox(height: m);
  static const SizedBox vSpaceL = SizedBox(height: l);
  // Spacers horizontal
  static const SizedBox hSpaceS = SizedBox(width: s);
  static const SizedBox hSpaceM = SizedBox(width: m);
  static const SizedBox hSpaceL = SizedBox(width: l);
}
