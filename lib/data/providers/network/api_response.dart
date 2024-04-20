
/// BASE MODEL
class ApiResponse<T> {
  int s;
  String m;
  T? r;
  String stackTrace;
  String url;
  Map<String, dynamic> data;
  Map<String, dynamic> queryParam;

  ApiResponse(
      {this.s = 0,
        this.m = "",
        this.r,
        this.stackTrace = "",
        this.url = "",
        this.data = const {},
        this.queryParam = const {}});

  bool get isSuccess {
    // if (s == -1) {
    //   errorRepo.callError(this);
    // }
    return s == 1;
  }

  //FOR GETTING OF MAPS
  factory ApiResponse.fromJson(
      Map<String, dynamic> json) =>
      ApiResponse<T>(
        s: json["s"] == null ? null : json["s"],
        m: json["m"] == null ? null : json["m"],
        r: json["r"] == null ? null : json["r"],
      );

  factory ApiResponse.fromListJson(
      Map<String, dynamic> json, Function(List<dynamic>) create) =>
      ApiResponse<T>(
        s: json["s"] ?? 0,
        m: json["m"] ?? "",
        r: json["r"] != null ? create(json["r"]) : create([]),
      );

  factory ApiResponse.fromEmpty() => ApiResponse<T>(
    r: null,
    m: "",
    s: 0,
  );

  factory ApiResponse.fromMapJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) =>
      ApiResponse<T>(
        s: json["s"] == null ? null : json["s"],
        m: json["m"] == null ? null : json["m"],
        r: json["r"] == null ? null : create(json["r"]),
      );

  factory ApiResponse.fromMessage(Map<String, dynamic> json) => ApiResponse<T>(
    s: json["s"] ?? 0,
    m: json["m"] ?? "",
    r: json["r"] ?? '',
  );

  factory ApiResponse.fromError(String err) => ApiResponse<T>(
    s: 0,
    m: err,
    r: null,
  );

  Map<String, dynamic> toJson() => {
    "s": s,
    "m": m,
    "r": r,
  };
}