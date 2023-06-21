// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original by Mike Rydsrom MIT License 2021
// see gist https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370

import 'package:constrained_centered_body/bottom_navigation.dart';
import 'package:constrained_centered_body/center_constrained_body.dart';
import 'package:constrained_centered_body/grid_card.dart';
import 'package:constrained_centered_body/insets.dart';
import 'package:constrained_centered_body/show_theme_colors.dart';
import 'package:constrained_centered_body/sign_in_card.dart';
import 'package:constrained_centered_body/theme_mode_switch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key, required this.themeMode, required this.onThemeModeChanged,});

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final MediaQueryData media = MediaQuery.of(context);
    final double topPadding = media.padding.top + kToolbarHeight;
    final double bottomPadding =
        media.padding.bottom + kBottomNavigationBarHeight;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text('Constrained Scrolling Body'),
      ),
      bottomNavigationBar: BottomNavigation(
        buttonIndex: _buttonIndex,
        onTap: (int value) {
          setState(() {
            _buttonIndex = value;
          });
        },
      ),
      body: CenterConstrainedBody(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: topPadding + Insets.l),
                Text('Theme', style: Theme.of(context).textTheme.headlineMedium),
                ListTile(
                  title: const Text('Change theme mode'),
                  trailing: ThemeModeSwitch(
                    themeMode: widget.themeMode,
                    onChanged: widget.onThemeModeChanged,
                  ),
                ),
                Insets.vSpaceM,
              ]),
            ),
            const ShowThemeColors(),
            SliverList(
              delegate: SliverChildListDelegate([
                Insets.vSpaceL,
                const SignInCard(),
              ]),
            ),
            const SliverToBoxAdapter(child: Insets.vSpaceL),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 280,
                mainAxisSpacing: Insets.m,
                crossAxisSpacing: Insets.m,
                mainAxisExtent: 150,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GridCard(
                      title: 'Card nr ${index + 1}',
                      color: Colors.primaries[index % Colors.primaries.length]
                          [isLight ? 800 : 400]!,);
                },
                childCount: 2000,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: Insets.l + bottomPadding),
            ),
          ],
        ),
      ),
    );
  }
}
