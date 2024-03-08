class Users {
  String? tPNumberEmail;
  String eligibleStatus;
  double walletBalance;
  String name;
  int age;
  String gender;
  String contactNumber;
  String profilePicURL;
  double averageRating; // Calculated and updated later

  Users({
    required this.tPNumberEmail,
    required this.eligibleStatus ,
    required this.walletBalance ,
    required this.name ,
    required this.age ,
    required this.gender ,
    required this.contactNumber ,
    required this.profilePicURL ,
    required this.averageRating ,
  });

  Map<String, dynamic> toMap() {
    return {
      'WalletBalance': walletBalance,
      'Name': name,
      'Age': age,
      'Gender': gender,
      'ContactNumber': contactNumber,
      'ProfilePicURL': profilePicURL,
      'AverageRating': averageRating,
    };
  }

}

class TripHistory {
  List tripId;

  TripHistory(this.tripId);

}

class Reputation {
  String comment;
  double rating;
  String raterTPNumber;

  Reputation(this.comment, this.rating, this.raterTPNumber);

  Map<String, dynamic> toMap() {
    return {
      'Comment': comment,
      'Rating': rating,
      'RaterTPNumber': raterTPNumber,
    };
  }
}

class SensitiveInfo {
  String password;
  double? latitude;
  double? longitude;

  SensitiveInfo(this.password, this.latitude,this.longitude);

  Map<String, dynamic> toMap() {
    return {
      'Password': password,
      'Latitude': latitude,
      'Longitude': longitude,
    };
  }
}

class Emergency {
  String? emergencyCall;
  List? emergencyWhatsapp;

  Emergency(this.emergencyCall, this.emergencyWhatsapp);

  Map<String, dynamic> toMap() {
    return {
      'EmergencyCall': emergencyCall,
      'EmergencyWhatsapp': emergencyWhatsapp,
    };
  }
}

class Notifications {
  String? content;
  String? departureDate;
  String? departureTime;
  String? pickUpPoint;
  String? destination;
  String? notificationTime;

  Notifications(
      this.content,this.notificationTime, this.departureDate, this.departureTime, this.pickUpPoint, this.destination);

  Map<String, dynamic> toMap() {
    return {
      'Content': content,
      'NotificationTime': notificationTime,
      'DepartureDate': departureDate,
      'DepartureTime': departureTime,
      'PickUpPoint': pickUpPoint,
      'Destination': destination,
    };
  }
}
