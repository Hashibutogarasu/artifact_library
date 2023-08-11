abstract interface class ArtifactBaseClass<T> {
  Map<String, dynamic> toMap();
  T? fromMap(Map map);
}
