import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpRepository {
  final String baseUrl = 'https://sendemail-k5575vguqa-uc.a.run.app';

  Future<String> sendOtpToEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["success"] == true) {
          return data["otp"];
        } else {
          throw Exception(data["message"] ?? "Failed to send OTP");
        }
      } else {
        throw Exception("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Request failed: $e");
    }
  }

  Future<bool> verifyOtpCode(String email, String code) async {
    final url = Uri.parse('https://sendemail-k5575vguqa-uc.a.run.app');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['success'] == true;
    } else {
      throw Exception("Verification failed: ${response.statusCode}");
    }
  }
}
