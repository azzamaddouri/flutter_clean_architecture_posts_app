// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;
  const ErrorAddDeleteUpdatePostState({
    required this.message,
  });
  @override
  List<Object> get props => [];
}

class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;
  const MessageAddDeleteUpdatePostState({
    required this.message,
  });
  @override
  List<Object> get props => [];
}
