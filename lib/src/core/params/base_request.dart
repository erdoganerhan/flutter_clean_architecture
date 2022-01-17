import '../utils/constants.dart';

class BaseRequestParams {
  final String apiKey;
  final int page;
  final int pageSize;

  const BaseRequestParams({
    this.apiKey = kNewsApiKey,
    this.page = 1,
    this.pageSize = 20,
  });
}
