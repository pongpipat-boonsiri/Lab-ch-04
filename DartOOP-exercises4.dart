// 1. มิกซ์อิน (THE MIXIN)
// มิกซ์อินช่วยให้เรานำโค้ดไปใช้ซ้ำในคลาสอื่นๆ ได้โดยไม่ต้องสืบทอด (extends)
mixin CloudLogger {
  void logToCloud(String message) {
    // ในแอปจริง โค้ดส่วนนี้จะส่งข้อมูลไปยังระบบฐานข้อมูล เช่น Firebase
    print("☁️ [Cloud Log]: $message");
  }
}

// 2. คลาสแบบเจเนอริกส์ (THE GENERIC CLASS)
class AppDataCache<T> with CloudLogger {
  T? cachedData;

  void saveData(T newData) {
    cachedData = newData;
    logToCloud("บันทึกข้อมูลแล้ว: $cachedData");
  }

  void clearData() {
    cachedData = null;
    logToCloud("ล้างข้อมูลในแคชแล้ว");
  }
}

void main() {
  print("=== กำลังแคชข้อมูลแบบสตริง (User Token) ===\n");
  AppDataCache<String> tokenCache = AppDataCache<String>();
  tokenCache.saveData("ABC-123");
  tokenCache.clearData();
  print("\n=== กำลังแคชข้อมูลแบบตัวเลข (High Score) ===\n");
  AppDataCache<int> scoreCache = AppDataCache<int>();
  scoreCache.saveData(9999);
}