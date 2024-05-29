import 'dart:convert';
import 'package:http/http.dart';
import '../../core/constants/constants.dart';
import '../../domein/entities/post_entity.dart';
import '../models/post_model.dart';
import '../models/post_res_model.dart';

class Network {
  static bool isTester = true;


  static String getServer() {
    if (isTester) return SERVER_DEV;
    return SERVER_PROD;
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(getServer(), api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Apis*/
  static String API_POST_LIST = "/posts";
  static String API_POST_CREATE = "/posts";
  static String API_POST_UPDATE = "/posts/"; //{id}
  static String API_POST_DELETE = "/posts/"; //{id}

  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCreate(PostEntity post) {
    Map<String, String> params = new Map();
    params.addAll({
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(PostEntity post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id.toString(),
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId.toString(),
    });
    return params;
  }

/* Http Parsing */
// list [] bilan boshlansa shunaqa yoziladi
  static List<PostModel> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    return List<PostModel>.from(json.map((x) => PostModel.fromJson(x)));
  }

  static PostModel parsePost(String response) {
    dynamic json = jsonDecode(response);
    return PostModel.fromJson(json);
  }
// obyekt bilan boshlansa apiay {} shunaqa yozladi
  static PostResModel parsePostRes(String response) {
    dynamic json = jsonDecode(response);
    return PostResModel.fromJson(json);
  }
}