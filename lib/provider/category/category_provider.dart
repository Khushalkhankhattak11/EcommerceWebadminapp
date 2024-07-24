import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceadmin/models/Category.dart';
import 'package:ecommerceadmin/models/SubCategory.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryProvider extends ChangeNotifier{
  final uuid = Uuid();
  final db = FirebaseFirestore.instance;
  List<SubCategory> subCategories = [];
  bool isLoading = false;
  List<Category> categories = [];
  TextEditingController categoryName = TextEditingController();
  TextEditingController subCategory = TextEditingController();
}