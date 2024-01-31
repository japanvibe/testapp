import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_retrofit.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/75000507-da9a-43f8-a618-df698ea7176d')
  Future<Hotel> getHotel();

  @GET('/157ea342-a8a3-4e00-a8e6-a87d170aa0a2')
  Future<HotelRooms> getHotelRooms();

  @GET('/63866c74-d593-432c-af8e-f279d1a8d2ff')
  Future<Booking> getBooking();
}

@JsonSerializable()
class Hotel {
  int? id;
  String? name;
  String? adress;
  int? minimal_price;
  String? price_for_it;
  int? rating;
  String? rating_name;
  List<String>? image_urls;
  AboutTheHotel? about_the_hotel;

  Hotel(
      {this.id,
      this.name,
      this.adress,
      this.minimal_price,
      this.price_for_it,
      this.rating,
      this.rating_name,
      this.image_urls,
      this.about_the_hotel});

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable()
class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({this.description, this.peculiarities});

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelFromJson(json);
  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}

@JsonSerializable()
class HotelRooms {
  List<Room>? rooms;
  HotelRooms({this.rooms});

  factory HotelRooms.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelRoomsToJson(this);
}

@JsonSerializable()
class Room {
  int? id;
  String? name;
  int? price;
  String? price_per;
  List<String>? peculiarities;
  List<String>? image_urls;

  Room(
      {this.id,
      this.name,
      this.price,
      this.price_per,
      this.peculiarities,
      this.image_urls});

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class Booking {
  int? id;
  String? hotel_name;
  String? hotel_adress;
  int? horating;
  String? rating_name;
  String? departure;
  String? arrival_country;
  String? tour_date_start;
  String? tour_date_stop;
  int? number_of_nights;
  String? room;
  String? nutrition;
  int? tour_price;
  int? fuel_charge;
  int? service_charge;

  Booking(
      {this.id,
      this.hotel_name,
      this.hotel_adress,
      this.horating,
      this.rating_name,
      this.departure,
      this.arrival_country,
      this.tour_date_start,
      this.tour_date_stop,
      this.number_of_nights,
      this.room,
      this.nutrition,
      this.tour_price,
      this.fuel_charge,
      this.service_charge});

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
