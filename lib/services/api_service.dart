import 'dart:convert';

import 'package:katalogapp/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ProductModel> fetchProducts () async {
    final responce= await http.get(Uri.parse("https://wantapi.com/products.php"));

    if(responce.statusCode==200){
      final data=jsonDecode(responce.body);
      return ProductModel.fromJson(data);
    }
    else{
      throw Exception("Ürünler yüklenirken hata oluştu.");
    }
  }
}