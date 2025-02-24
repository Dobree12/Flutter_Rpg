mixin Stats {
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  // getters
  int get points => _points;

  List<Map<String, String>> get statsAsFormattedList => [
    {'title': 'health', 'value': _health.toString()},
    {'title': 'attack', 'value': _attack.toString()},
    {'title': 'defense', 'value': _defense.toString()},
    {'title': 'skill', 'value': _skill.toString()}
  ];

  Map<String, int> get statsAsMap => {
    "Health": _health,
    "Attack": _attack,
    "Defense": _defense,
    "Skill": _skill,
  };

  // methods
  void increaseStat(String stat) {
    if (_points > 0) {
      if (stat == 'Health') {
        _health++;
      }
      if (stat == 'Attack') {
        _attack++;
      }
      if (stat == 'Defense') {
        _defense++;
      }
      if (stat =='Skill') {
        _skill++;
      }
      _points--;
    }
  }

  void decreaseStat(String stat) {
    if (stat == 'Health' && _health > 5) {
      _health--;
      _points++;
    }
    if (stat == 'Attack' && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == 'Defense' && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == 'Skill' && _skill > 5) {
      _skill--;
      _points++;
    }
  }

  // set stats & points
  void setStats({ required int points, required Map<String, dynamic> stats}) {
    _points = points;
    
    _health = stats['Health'];
    _attack = stats['Attack'];
    _defense = stats['Defense'];
    _skill = stats['Skill'];
  }
}