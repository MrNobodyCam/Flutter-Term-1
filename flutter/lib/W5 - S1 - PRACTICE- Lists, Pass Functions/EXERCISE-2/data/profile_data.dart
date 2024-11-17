import 'package:flutter/material.dart';
import 'package:lutter/W5%20-%20S1%20-%20PRACTICE-%20Lists,%20Pass%20Functions/EXERCISE-2/model/profile_tile_model.dart';

ProfileData vichetProfile = ProfileData(
    name: "Vichet",
    position: "Flutter Developer",
    avatarUrl: 'assets/vichet.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(
          icon: Icons.favorite, title: "Favorite", value: "Listen to Music"),
      TileData(icon: Icons.sports, title: "Sport", value: "Football"),
      TileData(
          icon: Icons.book, title: "Book", value: "C Programming Language"),
      TileData(icon: Icons.food_bank, title: "Bank", value: "ABA"),
      TileData(icon: Icons.map, title: "Map", value: "Phnom Penh"),
    ]);
ProfileData vathnaProfile = ProfileData(
    name: "Vathna",
    position: "Web Developer",
    avatarUrl: 'assets/vathna.jpg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(
          icon: Icons.email, title: "Mail", value: "sereyvathna.em@cadt.edu"),
    ]);
ProfileData sokhomProfile = ProfileData(
    name: "Sokhom",
    position: "Flutter Developer",
    avatarUrl: 'assets/sokhom.jpeg',
    tiles: [
      TileData(
          icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
      TileData(
          icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
      TileData(icon: Icons.email, title: "Mail", value: "sokhom.kim@cadt.edu"),
    ]);
