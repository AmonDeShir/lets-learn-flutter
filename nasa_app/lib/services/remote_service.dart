import 'package:codelab_first/models/nasa_image.dart';
import 'package:http/http.dart' as http;

const searchUrl = "https://images-api.nasa.gov/search?media_type=image&q=";

class RemoteService {
  Future<NasaImages?> search(String text) async {
    var client = http.Client();

    var url = Uri.parse(searchUrl + text);
    var response = await client.get(url);

    print(response.statusCode);

    if (response.statusCode == 200) {
      var json = response.body;

      return nasaImagesFromJson(json);
    }

    return null;
  }
}