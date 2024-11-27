import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/models/house/get_houses_response.dart';

class MapsWidget extends StatelessWidget {
  const MapsWidget({
    super.key,
    required this.house,
  });

  final House house;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304.h,
      width: 100.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
        child: GoogleMap(
          myLocationEnabled: true,
          indoorViewEnabled: true,
          buildingsEnabled: true,
          compassEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          mapToolbarEnabled: true,
          fortyFiveDegreeImageryEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            zoom: 10,
            target: LatLng(49.9, 61.1),
          ),
          markers: {
            Marker(
                markerId: const MarkerId('1'),
                position: LatLng(house.latitude?.toDouble() ?? 49.9,
                    house.longitude?.toDouble() ?? 69.1),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(title: 'Marker', snippet: '*'),
                visible: true),
          },
        ),
      ),
    );
  }
}
