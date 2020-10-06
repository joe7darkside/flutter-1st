import 'package:rxdart/subjects.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class KiosksMapData {
  LatLng myLocation;
}

class KiosksMapDataStream {
  BehaviorSubject<KiosksMapData> _data =
      new BehaviorSubject<KiosksMapData>.seeded(KiosksMapData());
  Stream get stream => _data.stream;
  KiosksMapData get getData => _data.value;
  setData(KiosksMapData data) {
    _data.add(data);
  }
}
