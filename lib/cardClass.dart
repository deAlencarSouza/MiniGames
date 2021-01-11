import 'package:flutter/material.dart';

class Card {
  int _cardId;
  int _keyCard;
  String _content;
  Color _backgroundColor;
  bool _contentVisibility;

  Card(
      this._cardId,
      this._keyCard,
      this._content,
      this._backgroundColor,
      this._contentVisibility
      );

  int get cardId {
    return this._cardId;
  }

  int get keyCard {
    return this._keyCard;
  }

  String get content {
    return this._content;
  }

  Color get backgroundColor {
    return this._backgroundColor;
  }

  bool get contentVisibility {
    return this._contentVisibility;
  }

  set contentVisibility(bool contentVisibility) {
    this._contentVisibility = contentVisibility;
  }

  set content(String content) {
    this._content = content;
  }

  checksVisibility() {
    if(this.contentVisibility == true) {
      return false;
    }
  }
}