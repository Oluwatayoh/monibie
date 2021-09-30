import 'dart:ffi';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

const titletextStyle = TextStyle(
    fontFamily: 'Nunito-Bold', fontSize: 16.0, fontWeight: FontWeight.w900);
var title2textStyle = TextStyle(
    color: HexColor(cgreyMedium),
    fontFamily: 'Nunito-Bold',
    fontSize: 15.0,
    decoration: TextDecoration.lineThrough);

var reviewDateextStyle = TextStyle(
  color: HexColor(cgreyMedium),
  fontFamily: 'Nunito',
  fontSize: 16.0,
);

const btntextStyle = TextStyle(
    fontFamily: 'Nunito-Bold',
    fontSize: 14.0,
    color: Colors.white,
    fontWeight: FontWeight.w900);

const mainTitletextStyle = TextStyle(
    fontFamily: 'Nunito-Bold', fontSize: 18.0, fontWeight: FontWeight.w900);

const subTitletextStyle = TextStyle(
  fontFamily: 'Nunito-Bold',
  fontSize: 14.0,
);
const rateSubTitletextStyle = TextStyle(
  fontFamily: 'Nunito',
  fontSize: 14.0,
);

const sub2TitletextStyle = TextStyle(
    fontFamily: 'Nunito-Bold', fontSize: 14.0, fontWeight: FontWeight.w900);

const redSubTitletextStyle = TextStyle(
    fontFamily: 'Nunito-Bold',
    fontSize: 14.0,
    color: Colors.red,
    fontWeight: FontWeight.w900);

const inputtextStyle = TextStyle(
  fontFamily: 'Nunito-Medium',
  color: Color.fromRGBO(20, 85, 169, 1),
  fontSize: 16.0,
);

const sub2textStyle = TextStyle(
  fontFamily: 'Nunito-Medium',
  fontSize: 11.0,
);

var hinttextStyle = TextStyle(
  fontFamily: 'Nunito',
  color: HexColor("#959595"),
  fontSize: 14.0,
);

String cgreyLight = "#F2F2F2";
String cRed = "#FF242C";
String cgrey = "#B4B4B4";
String cgreyMedium = "#A7A7A7";
String cgreyDeep = "#959595";
String cBlue = "#179AFD";
String cPurple = "#581AA0";
String cPurpleLight = "#E6DFED";
String cPurpleDeep = "#581AA0";
String cPurpleMedium = "#B824F1";
String cOrange = "#FF5700";
String cGreenLight = "#DFFCF9";
String cYellow = "#FFB300";

List itemArray = [
  {"image": "assets/images/bestSelling/1.jpg", "price": 3400},
  {"image": "assets/images/bestSelling/2.jpg", "price": 76000},
  {"image": "assets/images/bestSelling/3.jpg", "price": 2000},
  {"image": "assets/images/bestSelling/4.jpg", "price": 10000},
  {"image": "assets/images/bestSelling/5.jpg", "price": 3500},
];

List flashSales = [
  {
    "image": "assets/images/bestSelling/6.jpg",
    "previousPrice": 6500,
    "price": 3400,
    "discount": 24
  },
  {
    "image": "assets/images/bestSelling/7.jpg",
    "previousPrice": 85000,
    "price": 76000,
    "discount": 43
  },
  {
    "image": "assets/images/bestSelling/8.jpg",
    "previousPrice": 3500,
    "price": 2000,
    "discount": 2
  },
  {
    "image": "assets/images/bestSelling/9.jpg",
    "previousPrice": 15000,
    "price": 10000,
    "discount": 15
  },
  {
    "image": "assets/images/bestSelling/10.jpg",
    "previousPrice": 6500,
    "price": 3500,
    "discount": 10
  },
];

List recommendedItems = [
  {
    "id": 1,
    "image": "assets/images/recommend/1.jpeg",
    "desc": "Addidas Bag",
    "price": 3400,
    "previousPrice": 8500,
    "discount": 31,
    "quantity":1
  },
  {
    "id": 2,
    "image": "assets/images/recommend/2.jpg",
    "desc": "Tecno Phantom X",
    "previousPrice": 0,
    "price": 76000,
    "discount": 0,
     "quantity":1
  },
  {
    "id": 3,
    "image": "assets/images/recommend/3.jpg",
    "desc": "Tecno Spark 4 Case",
    "price": 2000,
    "previousPrice": 0,
    "discount": 0,
     "quantity":1
  },
  {
    "id": 4,
    "image": "assets/images/recommend/4.png",
    "desc": "Oppo X20 Blaze",
    "price": 100000,
    "previousPrice": 180000,
    "discount": 20,
     "quantity":1
  }
];

List shoppingCartList = [];

final List<String> imgList = [
  'assets/images/topSliderImages/i.png',
  'assets/images/topSliderImages/i.png',
  'assets/images/topSliderImages/i.png',
];

final List<String> electronicList = [
  'assets/images/electronics/1.jpg',
  'assets/images/electronics/2.jpg',
  'assets/images/electronics/3.jpg',
];
final List<String> beautyHealth = [
  'assets/images/health/1.jpg',
  'assets/images/health/2.jpg',
  'assets/images/health/3.jpg',
];
final List<String> phone = [
  'assets/images/phone/1.jpg',
  'assets/images/phone/2.jpg',
  'assets/images/phone/3.jpg',
];
final List<String> accessories = [
  'assets/images/accessories/1.jpg',
  'assets/images/accessories/2.jpg',
  'assets/images/accessories/3.jpg',
];
final List<String> brands = [
  'assets/images/brands/1.png',
  'assets/images/brands/2.png',
  'assets/images/brands/3.png',
  'assets/images/brands/4.jpeg',
  'assets/images/brands/5.png',
  'assets/images/brands/6.png',
];
final List<String> reviewImage = [
  'assets/images/icons/r1.png',
  'assets/images/icons/r2.png',
  'assets/images/icons/r3.png',
  'assets/images/icons/r4.png',
];


double totalAmount = 0.0;
