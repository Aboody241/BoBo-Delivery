import 'package:bobo/features/discover_page/widget/discover_category_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<DiscoverCategoryClass>> getDiscoverCategories() {
  return FirebaseFirestore.instance.collection('Discover_categories').snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => DiscoverCategoryClass.fromJson(doc.data()))
            .toList(),
      );
}
