// lib/services/bus_api_service.dart
import 'dart:async';

class BusApiService {
  /// Trả về danh sách xe khách (mock) — giả lập request network bằng delay.
  static Future<List<Map<String, dynamic>>> fetchBusesMock() async {
    await Future.delayed(const Duration(milliseconds: 800)); // giả lập latency
    return [
      {
        "id": "BX001",
        "route": "Hà Nội → Đà Nẵng",
        "company": "Hoàng Long",
        "departure_date": "2025-11-05",
        "departure_time": "07:30",
        "arrival_time": "19:30",
        "duration": "12h",
        "price": 450000,
        "seats_left": 12,
        "note": "Xe giường nằm VIP, có WC",
      },
      {
        "id": "BX002",
        "route": "Hồ Chí Minh → Nha Trang",
        "company": "Phương Trang",
        "departure_date": "2025-11-05",
        "departure_time": "06:00",
        "arrival_time": "13:30",
        "duration": "7h30m",
        "price": 320000,
        "seats_left": 6,
        "note": "Xe ghế ngồi, wifi miễn phí",
      },
      {
        "id": "BX003",
        "route": "Hà Nội → Sapa",
        "company": "InterBus",
        "departure_date": "2025-11-05",
        "departure_time": "21:00",
        "arrival_time": "05:30",
        "duration": "8h30m",
        "price": 280000,
        "seats_left": 20,
        "note": "Chuyến đêm, giường nằm",
      },
      {
        "id": "BX004",
        "route": "Đà Nẵng → Quy Nhơn",
        "company": "Mai Linh Bus",
        "departure_date": "2025-11-06",
        "departure_time": "09:00",
        "arrival_time": "13:00",
        "duration": "4h",
        "price": 150000,
        "seats_left": 4,
        "note": "Xe ghế ngồi, điều hoà",
      },
      // thêm nhiều bản ghi nếu cần
    ];
  }
}
