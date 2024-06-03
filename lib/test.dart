import 'package:openapi/api.dart';

// TODO Configure API key authorization: apiKeyScheme
void setApiKey() {
  defaultApiClient.getAuthentication<ApiKeyAuth>('apiKeyScheme').apiKey = '274475f448a74a4499a0a1920ee7b028';
}
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
defaultApiClient.getAuthentication<ApiKeyAuth>('apiKeyScheme').apiKeyPrefix = 'Bearer';

final api_instance = DefaultApi();
final analyzeRecipeRequest = AnalyzeRecipeRequest(); // AnalyzeRecipeRequest | Example request body.
final language = en; // String | The input language, either \"en\" or \"de\".
final includeNutrition = false; // bool | Whether nutrition data should be added to correctly parsed ingredients.
final includeTaste = false; // bool | Whether taste data should be added to correctly parsed ingredients.

try {
    final result = api_instance.analyzeRecipe(analyzeRecipeRequest, language, includeNutrition, includeTaste);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->analyzeRecipe: $e\n');
}
