import 'package:flutter/material.dart';

class MenuItem {
  String title;
  IconData icon;
  void Function()? onPressed;

  MenuItem(this.icon, this.title, this.onPressed);
}


