import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture_posts_app/features/posts/domain/entities/post_entity.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {
     if (event is GetAllPostsEvent) {
       
     } else if(event is RefreshPostsEvent){
       
     }
    });
  }
}
