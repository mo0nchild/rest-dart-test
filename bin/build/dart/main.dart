import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  querySelector('#main-btn')?.addEventListener('click', (event) async {
    var params = {'hello': 'user', 'username': 'byter'};
    final uri = Uri.parse('/data').replace(queryParameters: params);

    print('URI: $uri');

    var jsonBody = json.encode({'foo': 'bar'});
    var headers = <String, String>{
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    final response = await http.post(uri, body: jsonBody, headers: headers);
    print('response: ${response.body}');
  });
}
