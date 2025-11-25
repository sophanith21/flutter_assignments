import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Aang", // changed name
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/aang.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Email", value: "aang.dev@cadt.edu"),
    TileData(icon: Icons.web, title: "Website", value: "www.aang.dev"),
    TileData(
      icon: Icons.link,
      title: "LinkedIn",
      value: "linkedin.com/in/aang",
    ),
    TileData(icon: Icons.code, title: "GitHub", value: "github.com/aang"),
    TileData(
      icon: Icons.school,
      title: "Education",
      value: "Cambodia Academy of Digital Technology",
    ),
    TileData(
      icon: Icons.calendar_today,
      title: "Date of Birth",
      value: "April 12, 2000",
    ),
    TileData(icon: Icons.location_city, title: "City", value: "Phnom Penh"),
    TileData(icon: Icons.language, title: "Languages", value: "English, Khmer"),
  ],
);
