import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Auth0Service {
  final String domain = dotenv.env['AUTH_0_DOMAIN']!;

  late Future<String> authToken;

  Auth0Service() {
    authToken = getManagementToken();
  }

  Future<String> getManagementToken() async {
    final url = Uri.parse('https://$domain/oauth/token');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': dotenv.env['AUTH_0_CLIENT_ID_MANAGEMENT']!,
        'client_secret': dotenv.env['AUTH_0_CLIENT_SECRET_MANAGEMENT']!,
        'audience': 'https://$domain/api/v2/',
      },
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(result);
      return result[
          'access_token']; // Assuming the token is stored under 'access_token'
    } else {
      throw Exception('Failed to get user: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> updateUser(
      String userId, Map<String, dynamic> updates) async {
    final url = Uri.parse('https://$domain/api/v2/users/$userId');
    final response = await http.patch(
      url,
      headers: {
        'Authorization':
            'Bearer ${await authToken}', // Use the token from getManagementToken
        'Content-Type': 'application/json',
      },
      body: jsonEncode(updates),
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print(result);
      return result;
    } else {
      throw Exception('Failed to update user: ${response.body}');
    }
  }

  // Other methods would go here, all using authToken for authentication
}
