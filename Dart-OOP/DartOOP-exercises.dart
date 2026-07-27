// 1. คลาสแม่ (BASE CLASS)
abstract class FeedItem {
  String author;
  int likes;

  FeedItem(this.author, this.likes);

  // เมธอดนามธรรม
  void renderWidget();
}

// 2. คลาสลูก TextPost
class TextPost extends FeedItem {
  String textContent;

  TextPost(String author, int likes, this.textContent)
      : super(author, likes);

  @override
  void renderWidget() {
    print("📝 โพสต์ข้อความ โดย $author");
    print("   \"$textContent\"");
    print("   ❤️ $likes ถูกใจ\n");
  }
}

// 3. คลาสลูก ImagePost
class ImagePost extends FeedItem {
  String imageUrl;

  ImagePost(String author, int likes, this.imageUrl)
      : super(author, likes);

  @override
  void renderWidget() {
    print("🖼️ โพสต์รูปภาพ โดย $author");
    print("   รูปภาพ: $imageUrl");
    print("   ❤️ $likes ถูกใจ\n");
  }
}

void main() {
  // ลิสต์ที่เก็บอ็อบเจกต์ของคลาสแม่ (FeedItem)
  List<FeedItem> myAppFeed = [
    TextPost(
        "คนไม่จำเป็น", 45, "ก็ต้องเดินจากไป"),
    TextPost(
        "ถึงแม้ว่าภายในใจ", 120, "จะรักเธอแค่ไหน"),
    ImagePost(
        "เพราะคนไม่จำเป็น", 200, "https://www.siamzone.com/music/yt/fmAEiuuoc_0.jpg"),
  ];

  print("=== กำลังสร้างฟีดแอปพลิเคชัน ===\n");

  // POLYMORPHISM
  for (var item in myAppFeed) {
    item.renderWidget();
  }
}
