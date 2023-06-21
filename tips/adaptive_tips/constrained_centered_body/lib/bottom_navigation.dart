// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.buttonIndex,
    required this.onTap,
  });
  final int buttonIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: buttonIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          label: 'Item 1',
          // title: Text('Item 1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.beenhere),
          label: 'Item 2',
          // title: Text('Item 2'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.create_new_folder),
          label: 'Item 3',
          // title: Text('Item 3'),
        ),
      ],
    );
  }
}
