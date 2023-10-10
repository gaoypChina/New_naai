import 'package:cloud_firestore/cloud_firestore.dart';

class Artist {
  String? id;
  String? name;
  double? rating, originalRating;
  String? imagePath;
  String? salonId;
  String? salonName;
  Availability? availability;
  double? distanceFromUser;
  String? instagramLink;

  Artist({
    this.id,
    this.name,
    this.rating,
    this.originalRating,
    this.imagePath,
    this.salonId,
    this.salonName,
    this.availability,
    this.instagramLink,
  });

  factory Artist.fromDocumentSnapshot(DocumentSnapshot docData) {
    Map<String, dynamic> json = docData.data() as Map<String, dynamic>;
    return Artist(
      id: json['id'],
      name: json['name'],
      rating: json['rating'],
      originalRating: json['rating'],
      imagePath: json['imagePath'] ?? 'https://firebasestorage.googleapis.com/v0/b/naai-5d31f.appspot.com/o/artist_images%2Fsample_artist_img.jpg?alt=media&token=2ff916a5-f2ae-40c7-b9fa-da0472938036&_gl=1*zfoq0v*_ga*MTQ0NjM3MTQzMy4xNjk2Njg1MTk3*_ga_CW55HF8NVT*MTY5NjkxMTQ1Ni4xNS4xLjE2OTY5MTQyOTYuMTAuMC4w' ,
      salonId: json['salonId'],
      salonName: json['salonName'],
      availability: Availability.fromFirestore(json['availability'] ?? {}),
      instagramLink: json['instagramLink'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['name'] = this.name;
    data['imagePath'] = this.imagePath;
    data['salonName'] = this.salonName;
    data['salonId'] = this.salonId;
    if (this.availability != null) {
      data['availability'] = this.availability!.toJson();
    }

    return data;
  }
}

class Availability {
  Day? monday;
  Day? tuesday;
  Day? wednesday;
  Day? thursday;
  Day? friday;
  Day? saturday;
  Day? sunday;

  Availability({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Map<String, dynamic> toJson() {
    return {
      'monday': this.monday!.toJson(),
      'tuesday': this.tuesday!.toJson(),
      'wednesday': this.wednesday!.toJson(),
      'thursday': this.thursday!.toJson(),
      'friday': this.friday!.toJson(),
      'saturday': this.saturday!.toJson(),
      'sunday': this.sunday!.toJson(),
    };
  }

  factory Availability.fromFirestore(Map<String, dynamic> data) {
    return Availability(
      monday: Day.fromFirestore(data['monday'] ?? {}),
      tuesday: Day.fromFirestore(data['tuesday'] ?? {}),
      wednesday: Day.fromFirestore(data['wednesday'] ?? {}),
      thursday: Day.fromFirestore(data['thursday'] ?? {}),
      friday: Day.fromFirestore(data['friday'] ?? {}),
      saturday: Day.fromFirestore(data['saturday'] ?? {}),
      sunday: Day.fromFirestore(data['sunday'] ?? {}),
    );
  }
}

class Day {
  int? start;
  int? end;

  Day({
    this.start,
    this.end,
  });

  factory Day.fromFirestore(Map<String, dynamic> data) {
    return Day(
      start: data['start'],
      end: data['end'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': this.start,
      'end': this.end,
    };
  }
}
