import 'package:http/http.dart' as http;


Future<void> fetchCategoryData(int categoryId, String searchKey) async {
  final apiUrl = 'https://callertunez.mtn.co.za/apigw/Middleware/api/adapter/v1/crbt/categories?language=English&searchKey=$searchKey&categoryId=$categoryId';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
     
      print('API call successful');
      print(response.body);
    } else {
     
      print('Failed to fetch data. Error ${response.statusCode}');
    }
  } catch (e) {
   
    print('Error: $e');
  }
}

