import 'dart:async';

import 'package:emailapp/Message.dart';
import 'package:emailapp/Validation.dart';
import 'package:rxdart/rxdart.dart';

class MessageFormManager with Validation {
  final _email = BehaviorSubject<String>();
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  void setEmail(String value)=> _email.sink.add(value);


  final _subject = BehaviorSubject<String>();
  Stream<String> get subject$ => _subject.stream.transform(validateSubject);
  void setSubject(String value)=> _subject.sink.add(value);

  final _body = BehaviorSubject<String>();
  Stream<String> get body$ => _body.stream;
  void setBody(String value)=> _body.sink.add(value);

  Stream<bool> get isFormValid$ =>
      Observable.combineLatest([email$, subject$, body$], (values) => true);

  submit() {
    String subject = _subject.value;
    String body = _body.value;
    return Message(subject, body);
  }
}
