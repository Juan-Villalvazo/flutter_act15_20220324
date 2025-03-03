







class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState()) {
    on<GameStarted>(_onGameStarted);
    on<GameReset>(_onGameReset);
    on<GameLocationChanged>(_onGameLocationChanged);
    on<GameScoreUpdated>(_onScoreUpdated);
    on<GameFinished>(_onGameEnded);
  }

  void _onGameStarted(GameStarted event, Emitter<GameState> emit) {
    emit(state.copyWith(status: GameStatus.inProgress));
  }

  void _onGameReset(GameReset event, Emitter<GameState> emit) {
    emit(const GameState());
  }

  void _onGameLocationChanged(
    GameLocationChanged event,
    Emitter<GameState> emit,
  ) {
    emit(state.copyWith(location: event.location));
  }

  void _onScoreUpdated(GameScoreUpdated event, Emitter<GameState> emit) {
    emit(state.copyWith(score: state.score + event.score));
  }

  void _onGameEnded(GameFinished event, Emitter<GameState> emit) {
    emit(state.copyWith(status: GameStatus.finished));
  }
}