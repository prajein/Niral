// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

String generateUserInputJson(String userInput) {
  // Construct the JSON structure for the user input
  Map<String, dynamic> userInputJson = {
    "role": "user",
    "parts": [
      {"text": userInput}
    ]
  };

  // Encode the JSON data to string and return
  return jsonEncode(userInputJson);
}

Future<String> sendApiRequest(
  String existingChatHistory,
  String newInput,
) async {
  // Add your function code here!
  List<dynamic> chatHistory = jsonDecode(existingChatHistory);

  // Append the new user input to the existing chat history
  chatHistory.add(jsonDecode(generateUserInputJson(newInput)));

  // Encode the updated chat history into a JSON string
  String apiBody = jsonEncode({"contents": chatHistory});

  // Send the POST request to the API
  // Replace 'YOUR_API_KEY' with your actual API key
  final response = await http.post(
    Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBPqfvJxYg4Bvec0lgwmXBpxJN62_HCVQU'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: apiBody,
  );

  if (response.statusCode == 200) {
    // Parse the API response
    Map<String, dynamic> apiResponse = jsonDecode(response.body);
    List<dynamic> candidates = apiResponse['candidates'];

    // Extract the model output text from the response
    String modelOutputText = candidates[0]['content']['parts'][0]['text'];

    // Append the model output to the existing chat history
    chatHistory.add({
      "role": "model",
      "parts": [
        {"text": modelOutputText}
      ]
    });

    // Encode the updated chat history into a JSON string and return
    return jsonEncode({"contents": chatHistory});
  } else {
    print('Failed to send request. Status code: ${response.statusCode}');
    return '';
  }
}
