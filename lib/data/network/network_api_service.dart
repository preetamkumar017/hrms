import 'dart:convert';
import 'dart:developer';
import 'package:hrms/data/app_exception.dart';
import 'package:http/http.dart' as http;
import 'base_api_network.dart';


class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(Map<String, dynamic> data, String url) async {

    final Map<String, String> header = await getHeader();
      final http.Response response = await http.get(Uri.parse(url).replace(queryParameters: data),headers: header);
    return returnResponse(response);
  }
  

  // trial 
//   Future<String> getApi1(dynamic data, String url) async {
//   final Map<String, String> header = await getHeader();
//   final http.Response response = await http.get(Uri.parse(url), headers: header);
//   return returnResponse(response);
// }

  @override
  Future<dynamic> postApi(dynamic data, String url)async{
    final Map<String, String> header = await getHeader();
      final http.Response response = await http.post(Uri.parse(url),headers: header,body: data);
    return returnResponse(response);
  }

  @override
  Future<dynamic> patchApi(dynamic data, String url)async{

    final Map<String, String> header = await getHeader();
    dynamic responseJson;
      final http.Response response = await http.patch(Uri.parse(url),headers: header,body: data);
      responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  Future<dynamic> putApi(dynamic data, String url)async{

    final Map<String, String> header = await getHeader();
      final http.Response response = await http.put(Uri.parse(url),headers: header,body: data);
      return returnResponse(response);
  }

  @override
  Future<dynamic> deleteApi(dynamic data, String url)async{

    final Map<String, String> header = await getHeader();

      final http.Response response = await http.delete(Uri.parse(url),headers: header,body: data);
      return returnResponse(response);
  }

  dynamic returnResponse(http.Response response) {
    final String responseString = response.body;
    log(response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseString);
        return responseJson;
      case 202:
        throw AcceptedException(responseString);
      case 204:
        throw NoContentException(responseString);
      case 206:
        throw PartialContentException(responseString);
      case 302:
        throw FoundException(responseString);
      case 400:
        throw BadRequestException(responseString);
      case 401:
        throw UnauthorisedException(responseString);
      case 403:
        throw ForbiddenException(responseString);
      case 404:
        throw NotFoundException(responseString);
      case 406:
        throw NotAcceptableException(responseString);
      case 408:
        throw RequestTimeoutException(responseString);
      case 416:
        throw RequestedRangeNotSatisfiableException(responseString);
      case 500:
        throw InternalServerException(responseString);
      case 503:
        throw ServiceUnavailableException(responseString);
      default:
        throw AppExceptions("Unhandled status code: ${response.statusCode}", "Unhandled:${response.statusCode}");

    }
  }

  @override
  Future<Map<String, String>> getHeader()async {
//  final token = await getToken();
    Map<String, String> data ={
      // "token":token,

    };
    return data;
  }


  @override
  Future<dynamic> postMultiPartApi(Map<String, dynamic> data, String url) async {
  //   final data = {
  //   'title': 'Test Post',
  //   'body': ['item1', 'item2'],
  //   'image': [
  //     await http.MultipartFile.fromPath('image1.jpg', 'path/to/image1.jpg'),
  //     await http.MultipartFile.fromPath('image2.jpg', 'path/to/image2.jpg'),
  //   ],
  // };

    final Map<String, String> header = await getHeader();
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(header);

    data.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is List) {
        for (var i = 0; i < value.length; i++) {
          var fileName = key[i];
          request.files.add(http.MultipartFile.fromString(fileName, value[i].toString()));
        }
      }
    });

    final http.Response response = await http.Response.fromStream(await request.send());
    log(response.body);
    return returnResponse(response);
  }

}
