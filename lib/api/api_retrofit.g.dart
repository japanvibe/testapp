// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_retrofit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      adress: json['adress'] as String?,
      minimal_price: json['minimal_price'] as int?,
      price_for_it: json['price_for_it'] as String?,
      rating: json['rating'] as int?,
      rating_name: json['rating_name'] as String?,
      image_urls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      about_the_hotel: json['about_the_hotel'] == null
          ? null
          : AboutTheHotel.fromJson(
              json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minimal_price,
      'price_for_it': instance.price_for_it,
      'rating': instance.rating,
      'rating_name': instance.rating_name,
      'image_urls': instance.image_urls,
      'about_the_hotel': instance.about_the_hotel,
    };

AboutTheHotel _$AboutTheHotelFromJson(Map<String, dynamic> json) =>
    AboutTheHotel(
      description: json['description'] as String?,
      peculiarities: (json['peculiarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutTheHotelToJson(AboutTheHotel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };

HotelRooms _$HotelRoomsFromJson(Map<String, dynamic> json) => HotelRooms(
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelRoomsToJson(HotelRooms instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      price_per: json['price_per'] as String?,
      peculiarities: (json['peculiarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image_urls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.price_per,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.image_urls,
    };

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      id: json['id'] as int?,
      hotel_name: json['hotel_name'] as String?,
      hotel_adress: json['hotel_adress'] as String?,
      horating: json['horating'] as int?,
      rating_name: json['rating_name'] as String?,
      departure: json['departure'] as String?,
      arrival_country: json['arrival_country'] as String?,
      tour_date_start: json['tour_date_start'] as String?,
      tour_date_stop: json['tour_date_stop'] as String?,
      number_of_nights: json['number_of_nights'] as int?,
      room: json['room'] as String?,
      nutrition: json['nutrition'] as String?,
      tour_price: json['tour_price'] as int?,
      fuel_charge: json['fuel_charge'] as int?,
      service_charge: json['service_charge'] as int?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'id': instance.id,
      'hotel_name': instance.hotel_name,
      'hotel_adress': instance.hotel_adress,
      'horating': instance.horating,
      'rating_name': instance.rating_name,
      'departure': instance.departure,
      'arrival_country': instance.arrival_country,
      'tour_date_start': instance.tour_date_start,
      'tour_date_stop': instance.tour_date_stop,
      'number_of_nights': instance.number_of_nights,
      'room': instance.room,
      'nutrition': instance.nutrition,
      'tour_price': instance.tour_price,
      'fuel_charge': instance.fuel_charge,
      'service_charge': instance.service_charge,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://run.mocky.io/v3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Hotel> getHotel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Hotel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/75000507-da9a-43f8-a618-df698ea7176d',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Hotel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HotelRooms> getHotelRooms() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HotelRooms>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/157ea342-a8a3-4e00-a8e6-a87d170aa0a2',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HotelRooms.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Booking> getBooking() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Booking>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/63866c74-d593-432c-af8e-f279d1a8d2ff',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Booking.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
