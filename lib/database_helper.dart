import 'package:flutter/material.dart';
import 'main.dart';

List<Fish> fishList = []; 
void _addFish() { 
if (fishList.length < 10) {  // Limiting to 10 fish 
setState(() { 
f
 ishList.add(Fish(color: selectedColor, speed: selectedSpeed)); 
}); 
} 
} 