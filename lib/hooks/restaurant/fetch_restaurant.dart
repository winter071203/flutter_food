import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:winter_food/utils/constants/constants.dart';
import 'package:winter_food/models/api_error.dart';
import 'package:winter_food/models/hooks_model/hook_result.dart';
import 'package:http/http.dart' as http;
import 'package:winter_food/models/restaurant.dart';

FetchHook useFetchRestaurants(String code) {
  final listRestaurants = useState<List<RestaurantModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/restaurant/$code');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        listRestaurants.value = restaurantModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (err) {
      error.value = err as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: listRestaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
