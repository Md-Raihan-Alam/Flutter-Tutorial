import "package:flutter/material.dart";
enum Categories{
    vegetables,
    fruit,
    dairy,
    meat,
    carbs,
    sweets,
    spices,
    convenience,
    hygiene,
    other
}

class Category{
    const Category(this.title,this.color);
    final String title;
    final Color color;
}