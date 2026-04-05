import 'package:flutter/foundation.dart';

class ContentCardProps {
  final String id;
  final String profileName;
  final double height;
  final List<CustomizableField> fields;

  ContentCardProps(
      {required this.height,
      required this.fields,
      required this.id,
      required this.profileName});

  ContentCardProps copyWith({
    String? id,
    String? profileName,
    double? height,
    List<CustomizableField>? fields,
  }) {
    return ContentCardProps(
      id: id ?? this.id,
      profileName: profileName ?? this.profileName,
      height: height ?? this.height,
      fields: fields ?? this.fields,
    );
  }

  @override
  String toString() {
    return 'ContentCardProps(id: $id, profileName: $profileName, height: $height, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContentCardProps &&
        other.id == id &&
        other.profileName == profileName &&
        other.height == height &&
        listEquals(other.fields, fields);
  }

  factory ContentCardProps.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return defaultObject();
    }
    return ContentCardProps(
      id: json['id'] as String,
      profileName: json['profileName'] as String,
      height: json['height'] as double,
      fields: (json['fields'] as List)
          .map((e) => CustomizableField.fromJson(e))
          .toList(),
    );
  }

  static ContentCardProps defaultObject() {
    return ContentCardProps(
      id: '',
      profileName: '',
      height: 140.0,
      fields: getDefaultCustomizableFields(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profileName': profileName,
      'height': height,
      'fields': fields.map((e) => e.toJson()).toList(),
    };
  }
}

class Position {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  Position({
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  Position copyWith({
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return Position(
      top: top ?? this.top,
      left: left ?? this.left,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
    );
  }

  @override
  String toString() {
    return 'Position(top: $top, left: $left, right: $right, bottom: $bottom)';
  }

  static Position fromJson(Map<String, dynamic> json) {
    return Position(
      top: json['top'] as double?,
      left: json['left'] as double?,
      right: json['right'] as double?,
      bottom: json['bottom'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'top': top,
      'left': left,
      'right': right,
      'bottom': bottom,
    };
  }
}

enum CustomizableFieldType {
  title,
  image,
  media_type,
  mean_score,
  num_list_users,
  list_status,
  list_score,
  edit_and_watched_button,
  next_episode_counter,
  un_seen_episodes,
  watched_eps,
  total_eps,
  genre,
  edit_btn,
  airing_date,
  next_episode_full_counter
}

class CustomizableField {
  final CustomizableFieldType type;
  final String title;
  final String description;
  final Position position;
  final bool hidden;

  CustomizableField({
    required this.type,
    required this.title,
    required this.description,
    required this.position,
    this.hidden = false,
  });

  CustomizableField copyWith({
    CustomizableFieldType? type,
    String? title,
    String? description,
    Position? position,
    bool? hidden,
  }) {
    return CustomizableField(
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      position: position ?? this.position,
      hidden: hidden ?? this.hidden,
    );
  }

  @override
  String toString() {
    return 'CustomizableField(type: $type, title: $title, description: $description, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomizableField &&
        other.type == type &&
        other.title == title &&
        other.description == description &&
        other.position == position;
  }

  static CustomizableField fromJson(Map<String, dynamic> json) {
    return CustomizableField(
      type: CustomizableFieldType.values[json['type'] as int],
      title: json['title'] as String,
      description: json['description'] as String,
      position: Position.fromJson(json['position']),
      hidden: json['hidden'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.index,
      'title': title,
      'description': description,
      'position': position.toJson(),
      'hidden': hidden,
    };
  }
}

List<CustomizableField> getDefaultCustomizableFields() {
  return [
    _titleField(),
    _imageField(),
    _mediaTypeField(),
    _scoreField(),
    _numListUsersField(),
    _listScoreField(),
    _editWatchedBtn(),
    _countDownField(),
    _unSeenEpisodesField(),
    _watchedEpsField(),
    _totalEpsField(),
    _genreField(),
    _editBtn(),
    _nextEpisodeFullCounter(),
    _airingDate(),
    _listStatusField(),
  ];
}

CustomizableField _listStatusField() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.list_status,
    title: 'Status Badge',
    description: 'Your watch status (Watching, Completed, etc.)',
    position: Position(
      top: 5,
      right: 5,
    ),
  );
}

CustomizableField _airingDate() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.airing_date,
    title: 'Airing Date',
    description: 'Airing date of the next episode',
    position: Position(
      top: 65,
      left: 100,
    ),
  );
}

CustomizableField _nextEpisodeFullCounter() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.next_episode_full_counter,
    title: 'Next Episode Full Counter',
    description: 'Countdown to next episode',
    position: Position(
      top: 80,
      left: 100,
    ),
  );
}

CustomizableField _editBtn() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.edit_btn,
    title: 'Edit Button',
    description: 'Button to edit the item',
    position: Position(
      bottom: 5,
      right: 10,
    ),
  );
}

CustomizableField _genreField() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.genre,
    title: 'Genre',
    description: 'Genre of the item',
    position: Position(
      top: 70,
      left: 100,
    ),
  );
}

CustomizableField _totalEpsField() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.total_eps,
    title: 'Total Episodes',
    description: 'Total number of episodes',
    position: Position(
      top: 5,
      left: 35,
    ),
  );
}

CustomizableField _watchedEpsField() {
  return CustomizableField(
    hidden: true,
    type: CustomizableFieldType.watched_eps,
    title: 'Watched Episodes',
    description: 'Number of watched episodes',
    position: Position(
      top: 40,
      right: 15,
    ),
  );
}

CustomizableField _unSeenEpisodesField() {
  return CustomizableField(
    type: CustomizableFieldType.un_seen_episodes,
    title: 'Unseen Episodes',
    description: 'Number of unseen episodes',
    position: Position(
      top: 5,
      left: 5,
    ),
  );
}

CustomizableField _mediaTypeField() {
  return CustomizableField(
    type: CustomizableFieldType.media_type,
    title: 'Media Type',
    description: 'Type of the media',
    position: Position(
      top: 5,
      right: 25,
    ),
  );
}

CustomizableField _imageField() {
  return CustomizableField(
    type: CustomizableFieldType.image,
    title: 'Image',
    description: 'Image of the item',
    position: Position(
      top: 5,
      left: 5,
    ),
  );
}

CustomizableField _titleField() {
  return CustomizableField(
    type: CustomizableFieldType.title,
    title: 'Title',
    description: 'Title of the item',
    position: Position(
      top: 40,
      left: 100,
    ),
  );
}

CustomizableField _scoreField() {
  return CustomizableField(
    type: CustomizableFieldType.mean_score,
    title: 'Mean Score',
    description: 'Mean score of the item',
    position: Position(
      top: 5,
      left: 100,
    ),
  );
}

CustomizableField _numListUsersField() {
  return CustomizableField(
    type: CustomizableFieldType.num_list_users,
    title: 'Number of List Users',
    description: 'Number of users who have this item in their list',
    position: Position(
      top: 7,
      left: 150,
    ),
  );
}

CustomizableField _listScoreField() {
  return CustomizableField(
    type: CustomizableFieldType.list_score,
    title: 'List Score',
    description: 'Score given to the item',
    position: Position(
      bottom: 8,
      left: 100,
    ),
  );
}

CustomizableField _editWatchedBtn() {
  return CustomizableField(
    type: CustomizableFieldType.edit_and_watched_button,
    title: 'Edit & Watched/Total Eps',
    description: 'Button to edit the item',
    position: Position(
      bottom: 5,
      right: 10,
    ),
  );
}

CustomizableField _countDownField() {
  return CustomizableField(
    type: CustomizableFieldType.next_episode_counter,
    title: 'Next Episode Counter',
    description: 'Countdown to next episode',
    position: Position(
      bottom: 5,
      right: 100,
    ),
  );
}
