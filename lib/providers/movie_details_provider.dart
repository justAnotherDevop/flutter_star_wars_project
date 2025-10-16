import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/models/Species.dart';
import 'package:flutter_star_wars_project/models/planet.dart';
import 'package:flutter_star_wars_project/models/starship.dart';
import 'package:flutter_star_wars_project/models/vehicle.dart';

import '../data/repository/movie_details_repository.dart';
import '../models/character.dart';


class MovieDetailsProvider with ChangeNotifier {
  final _movieDetailsRepo = MovieDetailsRepository();

  List<String> _peopleEndpoints = [];
  List<String> _planetsEndpoints = [];
  List<String> _starshipsEndpoints = [];
  List<String> _vehiclesEndpoints = [];
  List<String> _speciesEndpoints = [];

  Status _status = Status.initial;

  Status get status => _status;

  String _movieTitle = "";

  String get movieTitle => _movieTitle;

  List<DetailItem> _detailItems = [];

  List<DetailItem> get detailItems => _detailItems;

  void updatePeopleEndpoints({
    required List<String> peopleEndpoints,
    required List<String> planetsEndpoints,
    required List<String> starshipsEndpoints,
    required List<String> vehicleEndpoints,
    required List<String> speciesEndpoints,
  }) {
    _detailItems.clear();
    _status = Status.initial;
    _peopleEndpoints = peopleEndpoints;
    // above code seems hacky - need to find a better way of resetting state
    _planetsEndpoints = planetsEndpoints;
    _starshipsEndpoints = starshipsEndpoints;
    _vehiclesEndpoints = vehicleEndpoints;
    _speciesEndpoints = speciesEndpoints;

    notifyListeners();
  }

  void updateMovieTitle(String movieTitle) {
    _movieTitle = movieTitle;
    notifyListeners();
  }
}

