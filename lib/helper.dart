import 'package:geolocator/geolocator.dart';
import 'package:app_mitigasi_bencana/data/place.dart';

const String google_api_key = "AIzaSyBik0QAgip4imXCI1gIRHVjLtytKMdxX0c";
const double defaultPadding = 16.0;
Position? currentPosition;
Place? startPlace = null;